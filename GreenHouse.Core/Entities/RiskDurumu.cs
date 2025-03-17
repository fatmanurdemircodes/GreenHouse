using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class RiskDurumu
    {
        [Key]
        public int RiskDurumuId { get; set; }
        public string RiskSeviyesi { get; set; }

        public ICollection<Icerik> Icerikler { get; set; } = new List<Icerik>();
    }

}
