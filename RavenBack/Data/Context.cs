using Microsoft.EntityFrameworkCore;
using RavenBack.Models;

namespace RavenBack.Data
{
    public class Context : DbContext
    {
        public Context(DbContextOptions<Context> options): base(options)
        {
        }

        public DbSet<User> User { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().ToTable("User");
        }

    }
}