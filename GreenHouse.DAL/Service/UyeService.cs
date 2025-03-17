using GreenHouse.Core.Entities;
using GreenHouse.DAL.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DAL.Service
{
    public class UyeService : GenericService<Uye>
    {
        public UyeService(IUyeRepository repository) : base(repository) { }
    }
}
