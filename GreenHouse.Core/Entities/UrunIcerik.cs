using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class UrunIcerik
    {
        public int UrunId { get; set; }
        public int IcerikId { get; set; }

        [ForeignKey("UrunId")]
        public Urun Urun { get; set; }

        [ForeignKey("IcerikId")]
        public Icerik Icerik { get; set; }
    }
}
