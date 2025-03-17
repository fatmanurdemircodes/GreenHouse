using GreenHouse.Core.MyContext;
using GreenHouse.DAL.IRepository;
using GreenHouse.DAL.Repository;
using GreenHouse.DAL.Service;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddHttpContextAccessor();
builder.Services.AddDbContext<GreenHouseDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Uye/GirisYap";
        options.LogoutPath = "/Uye/CikisYap";
    });
builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));


builder.Services.AddScoped<IFavoriListesiRepository, FavoriListesiRepository>();
builder.Services.AddScoped<IFavoriListesiDetayRepository, FavoriListesiDetayRepository>();
builder.Services.AddScoped<IIcerikRepository, IcerikRepository>();
builder.Services.AddScoped<IKaraListeRepository, KaraListeRepository>();
builder.Services.AddScoped<IKategoriRepository, KategoriRepository>();
builder.Services.AddScoped<IRiskDurumuRepository, RiskDurumuRepository>();
builder.Services.AddScoped<IUreticiRepository, UreticiRepository>();
builder.Services.AddScoped<IUrunRepository, UrunRepository>();
builder.Services.AddScoped<IUrunIcerikRepository, UrunIcerikRepository>();
builder.Services.AddScoped<IUyeRepository, UyeRepository>();
builder.Services.AddScoped<FavoriListesiService>();
builder.Services.AddScoped<FavoriListesiDetayService>();
builder.Services.AddScoped<IcerikService>();
builder.Services.AddScoped<KaraListeService>();
builder.Services.AddScoped<KategoriService>();
builder.Services.AddScoped<RiskDurumuService>();
builder.Services.AddScoped<UreticiService>();
builder.Services.AddScoped<UrunService>();
builder.Services.AddScoped<UrunIcerikService>();
builder.Services.AddScoped<UyeService>();
builder.Services.AddSession();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();
app.UseSession();
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
