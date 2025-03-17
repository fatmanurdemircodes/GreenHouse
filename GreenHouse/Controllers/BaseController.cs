using GreenHouse.DAL.Service;
using Microsoft.AspNetCore.Mvc;

namespace GreenHouse.Controllers
{
    public class BaseController : Controller
    {
        private readonly UyeService _uyeService;

        public BaseController(UyeService uyeService)
        {
            _uyeService = uyeService;
        }

        public async Task<IActionResult> GetUserInfo()
        {
            var userId = HttpContext.User.Identity.Name; 
            if (string.IsNullOrEmpty(userId)) return View(); 

            var uye = await _uyeService.GetByIdAsync(int.Parse(userId));
            if (uye != null)
            {
                ViewData["KullaniciAdi"] = uye.UyeAdi + " " + uye.UyeSoyadi;
            }
            return View();
        }
    }
}
