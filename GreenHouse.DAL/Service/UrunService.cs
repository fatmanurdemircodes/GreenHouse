using GreenHouse.Core.Entities;
using GreenHouse.DAL.IRepository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DAL.Service
{

    public class UrunService : GenericService<Urun>
    {
        private readonly IUrunRepository _urunRepository;
        private readonly IKaraListeRepository _karaListeRepository;
        private readonly IFavoriListesiRepository _favoriListesiRepository;
        private readonly IFavoriListesiDetayRepository _favoriListesiDetayRepository;
        public UrunService(IUrunRepository urunRepository, IKaraListeRepository karaListeRepository, IFavoriListesiRepository favoriListesiRepository, IFavoriListesiDetayRepository favoriListesiDetayRepository) : base(urunRepository)
        {
            _urunRepository = urunRepository;
            _karaListeRepository = karaListeRepository;
            _favoriListesiRepository = favoriListesiRepository;
            _favoriListesiDetayRepository = favoriListesiDetayRepository;
        }
        public async Task KaralisteyeEkleAsync(int uyeId, int urunId)
        {
            var urun = await _urunRepository.GetByIdWithDetailsAsync(urunId);
            if (urun == null) throw new Exception("Ürün bulunamadı!");

            if (!urun.UrunIcerikler.Any())
                throw new Exception("Ürüne ait içerik bulunamadı!");

            foreach (var urunIcerik in urun.UrunIcerikler)
            {
                bool exists = await _karaListeRepository.AnyAsync(k => k.UyeId == uyeId && k.IcerikId == urunIcerik.IcerikId);
                if (!exists)
                {
                    var karaListe = new KaraListe
                    {
                        UyeId = uyeId,
                        IcerikId = urunIcerik.IcerikId
                    };
                    await _karaListeRepository.AddAsync(karaListe);
                }
            }

            await _karaListeRepository.SaveChangesAsync();
        }
        public async Task FavorilereEkleAsync(int uyeId, int urunId)
        {
            var favoriListesi = await _favoriListesiRepository
                .FirstOrDefaultAsync(fl => fl.UyeId == uyeId);

            if (favoriListesi == null)
            {
                favoriListesi = new FavoriListesi
                {
                    ListeAdi = "Favorilerim",
                    UyeId = uyeId
                };

                await _favoriListesiRepository.AddAsync(favoriListesi);
                await _favoriListesiRepository.SaveChangesAsync();
            }

            bool exists = await _favoriListesiDetayRepository.AnyAsync(fld => fld.FavoriListesiId == favoriListesi.FavoriListesiId && fld.UrunId == urunId);

            if (!exists)
            {
                var favoriDetay = new FavoriListesiDetay
                {
                    FavoriListesiId = favoriListesi.FavoriListesiId,
                    UrunId = urunId
                };

                await _favoriListesiDetayRepository.AddAsync(favoriDetay);
                await _favoriListesiDetayRepository.SaveChangesAsync();
            }
            else
            {
                throw new Exception("Ürün zaten favorilerde!");
            }
        }
        public async Task<IEnumerable<Urun>> GetAllWithDetailsAsync()
        {
            return await _urunRepository.GetAllAsQueryable()
         .Include(u => u.Kategori)
         .Include(u => u.Uretici)
         .Include(u => u.Uye)
         .ToListAsync();
        }
        public async Task<Urun> GetByIdWithDetailsAsync(int id)
        {
            return await _urunRepository.GetByIdWithDetailsAsync(id);
        }
    }
}
