using GreenHouse.Core.Entities;
using GreenHouse.Core.MyContext;
using GreenHouse.DAL.IRepository;
using GreenHouse.DAL.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DAL.Repository
{
    public class RiskDurumuRepository : GenericRepository<RiskDurumu>, IRiskDurumuRepository
    {
        public RiskDurumuRepository(GreenHouseDbContext context) : base(context) { }
    }

}
