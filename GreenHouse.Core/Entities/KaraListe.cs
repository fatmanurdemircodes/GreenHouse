using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class KaraListe
    {
        [Key]
        public int KaraListeId { get; set; }
        public int UyeId { get; set; }
        public int IcerikId { get; set; }

        [ForeignKey("UyeId")]
        public Uye Uye { get; set; }

        [ForeignKey("IcerikId")]
        public Icerik Icerik { get; set; }
    }
}
