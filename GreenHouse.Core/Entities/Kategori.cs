using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.Entities
{
    public class Kategori
    {
        [Key]
        public int KategoriId { get; set; }
        public string KategoriAdi { get; set; }
        public int? UstKategoriId { get; set; }

        public ICollection<Urun> Urunler { get; set; }

        [ForeignKey("UstKategoriId")]
        public Kategori UstKategori { get; set; }

        public ICollection<Kategori> AltKategoriler { get; set; } = new List<Kategori>();
    }

}
