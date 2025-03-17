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
    public class FavoriListesiService : GenericService<FavoriListesi>
    {
        private readonly IFavoriListesiRepository _favoriListesiRepository;
        public FavoriListesiService(IGenericRepository<FavoriListesi> repository, IFavoriListesiRepository favoriListesiRepository) : base(repository)
        {
            _favoriListesiRepository = favoriListesiRepository;
        }
        public async Task<FavoriListesi> GetFavorilerByUyeIdAsync(int uyeId)
        {
            var favoriListesi = await _favoriListesiRepository.GetAllAsQueryable()
                .Include(f => f.FavoriListeDetaylar)
                .ThenInclude(fd => fd.Urun)
                .FirstOrDefaultAsync(f => f.UyeId == uyeId);

            return favoriListesi ?? new FavoriListesi(); 
        }

    }

}
