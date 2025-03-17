using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class Urun
    {
        [Key]
        public int UrunId { get; set; }
        public string UrunAdi { get; set; }
        public int KategoriId { get; set; }
        public int UreticiId { get; set; }
        public int UyeId { get; set; }
        public int OlusturanKisi { get; set; }
        public DateTime OlusturmaTarihi { get; set; }

        [ForeignKey("KategoriId")]
        public Kategori Kategori { get; set; }

        [ForeignKey("UreticiId")]
        public Uretici Uretici { get; set; }

        [ForeignKey("UyeId")]
        public Uye Uye { get; set; }

        public int RiskDurumuId { get; set; }

        [ForeignKey("RiskDurumuId")]
        public RiskDurumu RiskDurumu { get; set; }

        public ICollection<UrunIcerik> UrunIcerikler { get; set; } = new List<UrunIcerik>();

        public ICollection<FavoriListesiDetay> FavoriListesiDetaylar { get; set; } = new List<FavoriListesiDetay>();
    }
}
