using GreenHouse.Core.Entities;
using GreenHouse.DAL.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DAL.Service
{
    public class UreticiService : GenericService<Uretici>
    {
        public UreticiService(IUreticiRepository repository) : base(repository) { }
    }
}
