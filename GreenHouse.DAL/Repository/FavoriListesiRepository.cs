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
    public class FavoriListesiRepository : GenericRepository<FavoriListesi>, IFavoriListesiRepository
    {
        private readonly GreenHouseDbContext _context;

        public FavoriListesiRepository(GreenHouseDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<FavoriListesi> GetFavorilerByUyeIdAsync(int uyeId)
        {
            return await _context.FavoriListeleri
                .Include(f => f.FavoriListeDetaylar)
                    .ThenInclude(fd => fd.Urun)
                .FirstOrDefaultAsync(f => f.UyeId == uyeId);
        }
    }

}
