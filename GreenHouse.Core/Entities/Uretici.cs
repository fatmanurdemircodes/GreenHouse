using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class Uretici
    {
        [Key]
        public int UreticiId { get; set; }
        public string UreticiAdi { get; set; }

        public ICollection<Urun> Urunler { get; set; } = new List<Urun>();
    }

}
