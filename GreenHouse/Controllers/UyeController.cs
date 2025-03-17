using GreenHouse.Core.Entities;
using GreenHouse.DTO.UyeDTO;
using GreenHouse.DAL.Service;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Threading.Tasks;

namespace GreenHouse.Controllers
{
    public class UyeController : Controller
    {
        private readonly UyeService _uyeService;

        public UyeController(UyeService uyeService)
        {
            _uyeService = uyeService;
        }

        [HttpGet]
        public IActionResult KayitOl()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> KayitOl(UyeRegisterDTO model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var mevcutUye = (await _uyeService.FindAsync(u => u.MailAdresi == model.MailAdresi)).FirstOrDefault();
            if (mevcutUye != null)
            {
                ModelState.AddModelError("", "Bu e-posta adresi zaten kayıtlı.");
                return View(model);
            }

            Uye yeniUye = new Uye
            {
                UyeAdi = model.UyeAdi,
                UyeSoyadi = model.UyeSoyadi,
                MailAdresi = model.MailAdresi,
                UyeSifre = model.UyeSifre,
                UyelikTarihi = DateTime.Now,
                OlusturmaTarihi = DateTime.Now
            };

            await _uyeService.AddAsync(yeniUye);
            return RedirectToAction("GirisYap");
        }

        [HttpGet]
        public IActionResult GirisYap()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> GirisYap(UyeLoginDTO model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var uye = (await _uyeService.FindAsync(u => u.MailAdresi == model.MailAdresi && u.UyeSifre == model.UyeSifre)).FirstOrDefault();
            if (uye == null)
            {
                ModelState.AddModelError("", "Geçersiz e-posta veya şifre.");
                return View(model);
            }

            HttpContext.Session.SetString("KullaniciAdi", uye.UyeAdi + " " + uye.UyeSoyadi);

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, uye.UyeAdi),
                new Claim(ClaimTypes.Email, uye.MailAdresi),
                new Claim(ClaimTypes.NameIdentifier, uye.UyeId.ToString())
            };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimsPrincipal);

            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> CikisYap()
        {
            HttpContext.Session.Clear();
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("GirisYap");
        }
    }
}