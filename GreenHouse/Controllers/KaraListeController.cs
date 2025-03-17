using GreenHouse.DAL.IRepository;
using GreenHouse.DAL.Service;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace GreenHouse.Controllers
{
    public class KaraListeController : Controller
    {
        private readonly IKaraListeRepository _karaListeRepository;

        public KaraListeController(IKaraListeRepository karaListeRepository)
        {
            _karaListeRepository = karaListeRepository;
        }

        public async Task<IActionResult> Index()
        {
            int uyeId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var karaListeler = await _karaListeRepository.GetKaraListeByUyeIdAsync(uyeId);
            return View(karaListeler);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            await _karaListeRepository.RemoveAsync(id);
            TempData["Message"] = "Karaliste öğesi silindi.";
            return RedirectToAction("Index");
        }
    }
}