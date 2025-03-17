using GreenHouse.Core.Entities;
using GreenHouse.DAL.IRepository;
using Microsoft.EntityFrameworkCore;

namespace GreenHouse.DAL.Service
{
    public class KaraListeService : GenericService<KaraListe>
    {
        private readonly IKaraListeRepository _karaListeRepository;

        public KaraListeService(IKaraListeRepository repository) : base(repository)
        {
            _karaListeRepository = repository;
        }

        public async Task<IEnumerable<KaraListe>> GetKaraListeByUyeIdAsync(int uyeId)
        {
            return await _karaListeRepository.GetAllAsQueryable()
                .Include(k => k.Icerik)
                .Where(k => k.UyeId == uyeId)
                .ToListAsync();
        }

        public async Task RemoveAsync(int karaListeId)
        {
            var karaListe = await _karaListeRepository.GetByIdAsync(karaListeId);
            if (karaListe != null)
            {
                _karaListeRepository.Delete(karaListe);
                await _karaListeRepository.SaveChangesAsync();
            }
        }
    }
}
