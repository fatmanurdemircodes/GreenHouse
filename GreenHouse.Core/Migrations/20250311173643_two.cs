using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GreenHouse.Core.Migrations
{
    /// <inheritdoc />
    public partial class two : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_UrunIcerikler_IcerikId",
                table: "UrunIcerikler",
                column: "IcerikId");

            migrationBuilder.CreateIndex(
                name: "IX_UrunIcerikler_UrunId",
                table: "UrunIcerikler",
                column: "UrunId");

            migrationBuilder.AddForeignKey(
                name: "FK_UrunIcerikler_Icerikler_IcerikId",
                table: "UrunIcerikler",
                column: "IcerikId",
                principalTable: "Icerikler",
                principalColumn: "IcerikId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UrunIcerikler_Urunler_UrunId",
                table: "UrunIcerikler",
                column: "UrunId",
                principalTable: "Urunler",
                principalColumn: "UrunId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UrunIcerikler_Icerikler_IcerikId",
                table: "UrunIcerikler");

            migrationBuilder.DropForeignKey(
                name: "FK_UrunIcerikler_Urunler_UrunId",
                table: "UrunIcerikler");

            migrationBuilder.DropIndex(
                name: "IX_UrunIcerikler_IcerikId",
                table: "UrunIcerikler");

            migrationBuilder.DropIndex(
                name: "IX_UrunIcerikler_UrunId",
                table: "UrunIcerikler");
        }
    }
}
