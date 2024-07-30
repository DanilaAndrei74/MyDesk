using DataAccess.ModelConfiguration;
using Entities.Models;
using Microsoft.EntityFrameworkCore;

namespace DataAccess
{
    public class DataContext:DbContext
    {
        public DataContext(DbContextOptions options) : base(options)
        {
        }


        public DbSet<Building> Buildings { get; set; }
        public DbSet<Floor> Floors { get; set; }
        public DbSet<Zone> Zones { get; set; }
        public DbSet<Tile> Tiles { get; set; }
        public DbSet<Reservation> Reservations { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Team> Teams { get; set; }
        public DbSet<Credential> Credentials{ get; set; }
        public DbSet<Photo> Photos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new BuildingsConfig());
            modelBuilder.ApplyConfiguration(new FloorsConfig());
            modelBuilder.ApplyConfiguration(new ZonesConfig());
            modelBuilder.ApplyConfiguration(new TilesConfig());
            modelBuilder.ApplyConfiguration(new ReservationsConfig());
            modelBuilder.ApplyConfiguration(new UsersConfig());
            modelBuilder.ApplyConfiguration(new TeamsConfig());
            modelBuilder.ApplyConfiguration(new CredentialsConfig());
            modelBuilder.ApplyConfiguration(new PhotosConfig());
        }
    }
}