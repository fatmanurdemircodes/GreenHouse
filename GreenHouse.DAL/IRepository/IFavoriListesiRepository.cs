using GreenHouse.Core.Entities;
using GreenHouse.DAL.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DAL.IRepository
{
    public interface IFavoriListesiRepository : IGenericRepository<FavoriListesi>
    {
        Task<FavoriListesi> GetFavorilerByUyeIdAsync(int uyeId);
    }
}
