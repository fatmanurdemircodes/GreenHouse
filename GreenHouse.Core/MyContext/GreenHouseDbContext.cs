using GreenHouse.Core.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.Core.MyContext
{
    public class GreenHouseDbContext : DbContext
    {
        public GreenHouseDbContext(DbContextOptions<GreenHouseDbContext> options) : base(options) { }

        public DbSet<Uye> Uyeler { get; set; }
        public DbSet<Urun> Urunler { get; set; }
        public DbSet<Uretici> Ureticiler { get; set; }
        public DbSet<Kategori> Kategoriler { get; set; }
        public DbSet<Icerik> Icerikler { get; set; }
        public DbSet<UrunIcerik> UrunIcerikler { get; set; }
        public DbSet<RiskDurumu> RiskDurumlari { get; set; }
        public DbSet<FavoriListesi> FavoriListeleri { get; set; }
        public DbSet<FavoriListesiDetay> FavoriListeDetaylari { get; set; }
        public DbSet<KaraListe> KaraListeler { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
         
            modelBuilder.Entity<UrunIcerik>()
                .HasKey(ui => new { ui.UrunId, ui.IcerikId });

            modelBuilder.Entity<UrunIcerik>()
                .HasOne(ui => ui.Urun)
                .WithMany(u => u.UrunIcerikler)
                .HasForeignKey(ui => ui.UrunId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<UrunIcerik>()
                .HasOne(ui => ui.Icerik)
                .WithMany(i => i.UrunIcerikler)
                .HasForeignKey(ui => ui.IcerikId)
                .OnDelete(DeleteBehavior.Cascade);

        

            modelBuilder.Entity<KaraListe>()
                    .HasOne(kl => kl.Icerik)
                    .WithMany(i => i.KaraListeler)
                    .HasForeignKey(kl => kl.IcerikId)
                    .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Urun>()
                .HasOne(u => u.Kategori)
                .WithMany(k => k.Urunler)
                .HasForeignKey(u => u.KategoriId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Urun>()
                .HasOne(u => u.Uretici)
                .WithMany(ur => ur.Urunler)
                .HasForeignKey(u => u.UreticiId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Urun>()
            .HasOne(u => u.RiskDurumu)
    .WithMany()
    .HasForeignKey(u => u.RiskDurumuId)
    .OnDelete(DeleteBehavior.SetNull);
        }

    }
}
