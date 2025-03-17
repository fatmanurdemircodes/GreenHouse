using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class FavoriListesi
    {
        [Key]
        public int FavoriListesiId { get; set; }

        public string ListeAdi { get; set; }
        public int UyeId { get; set; }

        [ForeignKey("UyeId")]
        public Uye Uye { get; set; }

        public ICollection<FavoriListesiDetay> FavoriListeDetaylar { get; set; } = new List<FavoriListesiDetay>();
    }

}
