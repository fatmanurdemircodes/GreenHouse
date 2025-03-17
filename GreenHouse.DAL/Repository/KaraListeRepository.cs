using GreenHouse.Core.Entities;
using GreenHouse.Core.MyContext;
using GreenHouse.DAL.IRepository;
using GreenHouse.DAL.Repository;
using Microsoft.EntityFrameworkCore;

namespace GreenHouse.DAL.Repository
{
    public class KaraListeRepository : GenericRepository<KaraListe>, IKaraListeRepository
    {
        private readonly GreenHouseDbContext _context;

        public KaraListeRepository(GreenHouseDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<KaraListe>> GetKaraListeByUyeIdAsync(int uyeId)
        {
            var result = await _context.KaraListeler
                .Include(k => k.Icerik)
                .Where(k => k.UyeId == uyeId)
                .ToListAsync();

            return result ?? new List<KaraListe>();
        }

        public async Task RemoveAsync(int karaListeId)
        {
            var karaListe = await _context.KaraListeler.FindAsync(karaListeId);
            if (karaListe != null)
            {
                _context.KaraListeler.Remove(karaListe);
                await _context.SaveChangesAsync();
            }
        }
    }
}
