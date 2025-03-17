using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class Uye
    {
        [Key]
        public int UyeId { get; set; }
        public string UyeAdi { get; set; }
        public string UyeSoyadi { get; set; }
        public string MailAdresi { get; set; }
        public DateTime UyelikTarihi { get; set; }
        public string UyeSifre { get; set; }
        public DateTime OlusturmaTarihi { get; set; }

        public ICollection<Urun> Urunler { get; set; } = new List<Urun>();
        public ICollection<FavoriListesi> FavoriListeleri { get; set; } = new List<FavoriListesi>();
        public ICollection<KaraListe> KaraListeler { get; set; } = new List<KaraListe>();
    }
}
