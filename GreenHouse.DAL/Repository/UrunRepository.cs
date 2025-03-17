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
    public class UrunRepository : GenericRepository<Urun>, IUrunRepository
    {
        private readonly GreenHouseDbContext _context;

        public UrunRepository(GreenHouseDbContext context) : base(context)
        {
            _context = context;
        }
       
        public async Task<Urun> GetByIdWithDetailsAsync(int id)
        {
            return await _context.Urunler
                  .Include(u => u.Kategori)
        .Include(u => u.Uretici)
        .Include(u => u.Uye)
        .Include(u => u.RiskDurumu) 
        .Include(u => u.UrunIcerikler)
            .ThenInclude(ui => ui.Icerik)
        .ThenInclude(i => i.RiskDurumu) 
        .FirstOrDefaultAsync(u => u.UrunId == id);
        }
    }
    }

