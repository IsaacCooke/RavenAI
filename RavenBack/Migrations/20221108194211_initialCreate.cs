using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RavenBack.Migrations
{
    /// <inheritdoc />
    public partial class initialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    FirstName = table.Column<string>(type: "TEXT", maxLength: 24, nullable: true),
                    LastName = table.Column<string>(type: "TEXT", maxLength: 24, nullable: true),
                    Email = table.Column<string>(type: "TEXT", maxLength: 255, nullable: true),
                    Password = table.Column<string>(type: "TEXT", maxLength: 30, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.UserId);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "User");
        }
    }
}
