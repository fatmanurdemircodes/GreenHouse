using GreenHouse.Core.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using GreenHouse.DAL.Service;
using System.Security.Claims;

namespace GreenHouse.Controllers
{
    public class UrunController : Controller
    {
        private readonly UrunService _urunService;
        private readonly IcerikService _icerikService;
        private readonly KategoriService _kategoriService;
        private readonly UreticiService _ureticiService;
        private readonly UyeService _uyeService;
        private readonly RiskDurumuService _riskDurumuService;

        public UrunController(UrunService urunService, IcerikService icerikService,
                              KategoriService kategoriService, UreticiService ureticiService,
                              UyeService uyeService, RiskDurumuService riskDurumuService)
        {
            _urunService = urunService;
            _icerikService = icerikService;
            _kategoriService = kategoriService;
            _ureticiService = ureticiService;
            _uyeService = uyeService;
            _riskDurumuService = riskDurumuService;
        }



        public async Task<IActionResult> Index(string searchTerm)
        {
            if (!User.Identity.IsAuthenticated || string.IsNullOrEmpty(User.Identity.Name))
            {
                TempData["ErrorMessage"] = "Lütfen giriş yapınız.";
                return RedirectToAction("GirisYap", "Uye");
            }
            var urunler = await _urunService.GetAllWithDetailsAsync();

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                urunler = urunler
                    .Where(u => u.UrunAdi.Contains(searchTerm, StringComparison.OrdinalIgnoreCase))
                    .ToList();
            }


            return View(urunler);
        }


        public async Task<IActionResult> Detaylar(int id)
        {
            var urun = await _urunService.GetByIdWithDetailsAsync(id);


            if (urun == null)
            {
                return NotFound();
            }

            return View(urun);
           
        }

        public async Task<IActionResult> Ekle()
        {
            ViewBag.Kategoriler = new SelectList(await _kategoriService.GetAllAsync(), "KategoriId", "KategoriAdi");
            ViewBag.Ureticiler = new SelectList(await _ureticiService.GetAllAsync(), "UreticiId", "UreticiAdi");
            ViewBag.Uyeler = new SelectList(await _uyeService.GetAllAsync(), "UyeId", "UyeAdi");
            ViewBag.RiskDurumlari = new SelectList(await _riskDurumuService.GetAllAsync(), "RiskDurumuId", "RiskSeviyesi");
            ViewBag.Icerikler = await _icerikService.GetAllAsync();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Ekle(Urun urun, int[] secilenIcerikler)
        {
            if (urun.RiskDurumuId == 0) 
            {
                urun.RiskDurumuId = 1;
            }
            if (secilenIcerikler.Count() < 10)
            {
                TempData["Message"] = "en az 10 adet içerik ekleyiniz";
                return RedirectToAction(nameof(Ekle));
            }
            urun.UrunIcerikler = secilenIcerikler.Select(icerikId => new UrunIcerik { IcerikId = icerikId }).ToList();
                await _urunService.AddAsync(urun);
                return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Duzenle(int id)
        {
            var urun = await _urunService.GetByIdWithDetailsAsync(id);
            if (urun == null) return NotFound();

            ViewBag.Kategoriler = new SelectList(await _kategoriService.GetAllAsync(), "KategoriId", "KategoriAdi", urun.KategoriId);
            ViewBag.Ureticiler = new SelectList(await _ureticiService.GetAllAsync(), "UreticiId", "UreticiAdi", urun.UreticiId);
            ViewBag.Uyeler = new SelectList(await _uyeService.GetAllAsync(), "UyeId", "UyeAdi", urun.UyeId);
            ViewBag.RiskDurumlari = new SelectList(await _riskDurumuService.GetAllAsync(), "RiskDurumuId", "RiskSeviyesi", urun.RiskDurumuId);
            ViewBag.Icerikler = await _icerikService.GetAllAsync();
            return View(urun);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Duzenle(int id, Urun urun, int[] secilenIcerikler)
        {
            var mevcutUrun = await _urunService.GetByIdWithDetailsAsync(id);
            if (mevcutUrun == null) return NotFound();
            if (urun.RiskDurumuId == 0)
            {
                urun.RiskDurumuId = 1;
            }
            if (secilenIcerikler.Count() < 10)
            {
                TempData["Message"] = "en az 10 adet içerik ekleyiniz";
                return RedirectToActionPermanent("Duzenle",id);
            }
            mevcutUrun.UrunAdi = urun.UrunAdi;
            mevcutUrun.KategoriId = urun.KategoriId;
            mevcutUrun.UreticiId = urun.UreticiId;
            mevcutUrun.UyeId = urun.UyeId;
            mevcutUrun.RiskDurumuId = urun.RiskDurumuId;

            mevcutUrun.UrunIcerikler.Clear();
            mevcutUrun.UrunIcerikler = secilenIcerikler.Select(icerikId => new UrunIcerik { IcerikId = icerikId }).ToList();

            await _urunService.UpdateAsync(mevcutUrun);
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Sil(int id)
        {
            var urun = await _urunService.GetByIdAsync(id);
            if (urun == null) return NotFound();
            return View(urun);
        }

        [HttpPost, ActionName("Sil")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SilOnay(int id)
        {
            var urun = await _urunService.GetByIdAsync(id);
            if (urun == null) return NotFound();

            await _urunService.DeleteAsync(urun);
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public async Task<IActionResult> KaralisteyeEkle(int urunId)
        {
            try
            {
                int uyeId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
                await _urunService.KaralisteyeEkleAsync(uyeId, urunId);

                TempData["Message"] = "Ürün karalisteye başarıyla eklendi.";
            }
            catch (Exception ex)
            {
                TempData["Message"] = "Hata: " + ex.Message;
            }

            return RedirectToAction("Detaylar", new { id = urunId });
        }

        [HttpPost]
        public async Task<IActionResult> FavorilereEkle(int urunId)
        {
            try
            {
                int uyeId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
                await _urunService.FavorilereEkleAsync(uyeId, urunId);

                TempData["Message"] = "Ürün favorilere başarıyla eklendi.";
            }
            catch (Exception ex)
            {
                TempData["Message"] = "Hata: " + ex.Message;
            }

            return RedirectToAction("Detaylar", new { id = urunId });
        }

    }
}
