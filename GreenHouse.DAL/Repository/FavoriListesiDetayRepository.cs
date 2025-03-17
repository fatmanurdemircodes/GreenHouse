using GreenHouse.Core.Entities;
using GreenHouse.Core.MyContext;
using GreenHouse.DAL.IRepository;
using GreenHouse.DAL.Repository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DAL.Repository
{
    public class FavoriListesiDetayRepository : GenericRepository<FavoriListesiDetay>, IFavoriListesiDetayRepository
    {

        private readonly GreenHouseDbContext _context;

        public FavoriListesiDetayRepository(GreenHouseDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<bool> IsUrunInFavoritesAsync(int favoriListesiId, int urunId)
        {
            return await _context.FavoriListeDetaylari
                .AnyAsync(fd => fd.FavoriListesiId == favoriListesiId && fd.UrunId == urunId);
        }
    }
}
