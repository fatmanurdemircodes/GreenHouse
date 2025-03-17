using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GreenHouse.Core.Migrations
{
    /// <inheritdoc />
    public partial class four : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Icerikler_RiskDurumuId",
                table: "Icerikler",
                column: "RiskDurumuId");

            migrationBuilder.AddForeignKey(
                name: "FK_Icerikler_RiskDurumlari_RiskDurumuId",
                table: "Icerikler",
                column: "RiskDurumuId",
                principalTable: "RiskDurumlari",
                principalColumn: "RiskDurumuId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Icerikler_RiskDurumlari_RiskDurumuId",
                table: "Icerikler");

            migrationBuilder.DropIndex(
                name: "IX_Icerikler_RiskDurumuId",
                table: "Icerikler");
        }
    }
}
