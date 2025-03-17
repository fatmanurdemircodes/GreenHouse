using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class FavoriListesiDetay
    {
        [Key]
        public int FavoriListeDetayId { get; set; }

        public int FavoriListesiId { get; set; }
        public int UrunId { get; set; }

        [ForeignKey("FavoriListesiId")]
        public FavoriListesi FavoriListesi { get; set; }

        [ForeignKey("UrunId")]
        public Urun Urun { get; set; }  
    }

}
