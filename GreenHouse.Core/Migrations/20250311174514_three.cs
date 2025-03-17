using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GreenHouse.Core.Migrations
{
    /// <inheritdoc />
    public partial class three : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_KaraListeler_IcerikId",
                table: "KaraListeler",
                column: "IcerikId");

            migrationBuilder.CreateIndex(
                name: "IX_KaraListeler_UyeId",
                table: "KaraListeler",
                column: "UyeId");

            migrationBuilder.AddForeignKey(
                name: "FK_KaraListeler_Icerikler_IcerikId",
                table: "KaraListeler",
                column: "IcerikId",
                principalTable: "Icerikler",
                principalColumn: "IcerikId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_KaraListeler_Uyeler_UyeId",
                table: "KaraListeler",
                column: "UyeId",
                principalTable: "Uyeler",
                principalColumn: "UyeId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_KaraListeler_Icerikler_IcerikId",
                table: "KaraListeler");

            migrationBuilder.DropForeignKey(
                name: "FK_KaraListeler_Uyeler_UyeId",
                table: "KaraListeler");

            migrationBuilder.DropIndex(
                name: "IX_KaraListeler_IcerikId",
                table: "KaraListeler");

            migrationBuilder.DropIndex(
                name: "IX_KaraListeler_UyeId",
                table: "KaraListeler");
        }
    }
}
