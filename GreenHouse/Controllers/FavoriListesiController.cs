using GreenHouse.DAL.Service;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace GreenHouse.Controllers
{
    public class FavoriListesiController : Controller
    {
        private readonly FavoriListesiService _favoriListesiService;
        private readonly FavoriListesiDetayService _favoriListesiDetayService;
        public FavoriListesiController(FavoriListesiService favoriListesiService, FavoriListesiDetayService favoriListesiDetayService)
        {
            _favoriListesiService = favoriListesiService;
            _favoriListesiDetayService = favoriListesiDetayService;
        }

        public async Task<IActionResult> Index()
        {
            int uyeId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var favoriler = await _favoriListesiService.GetFavorilerByUyeIdAsync(uyeId);
            return View(favoriler);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var favoriler = await _favoriListesiDetayService.GetByIdAsync(id);
                if (favoriler == null) { TempData["Message"] = "Hata."; return RedirectToAction("Index"); }
                    
                await _favoriListesiDetayService.DeleteAsync(favoriler);

                TempData["Message"] = "Ürün favorilerden başarıyla silindi.";
            }
            catch (Exception ex)
            {
                TempData["Message"] = "Hata: " + ex.Message;
            }

            return RedirectToAction("Index");
        }

    }
}
