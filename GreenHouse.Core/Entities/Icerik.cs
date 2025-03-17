using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class Icerik
    {
        [Key]
        public int IcerikId { get; set; }

        [Required]
        [StringLength(255)]
        public string IcerikAdi { get; set; }

        public string IcerikBilgi { get; set; }

        public int RiskDurumuId { get; set; }

        [ForeignKey("RiskDurumuId")]
        public RiskDurumu RiskDurumu { get; set; }

        public ICollection<UrunIcerik> UrunIcerikler { get; set; } = new List<UrunIcerik>();

        public ICollection<KaraListe> KaraListeler { get; set; } = new List<KaraListe>();
    }

}
