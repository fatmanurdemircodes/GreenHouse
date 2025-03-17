using GreenHouse.Core.Entities;
using GreenHouse.DAL.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DAL.Service
{
    public class RiskDurumuService : GenericService<RiskDurumu>
    {
        public RiskDurumuService(IRiskDurumuRepository repository) : base(repository) { }
    }
}
