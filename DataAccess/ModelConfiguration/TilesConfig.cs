using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class TilesConfig : IEntityTypeConfiguration<Tile>
    {
        public void Configure(EntityTypeBuilder<Tile> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.Zone_Id).IsRequired();
            builder.Property(p => p.Type).IsRequired();
            builder.Property(p => p.X_Position).IsRequired();
            builder.Property(p => p.Y_Position).IsRequired();
            builder.Property(p => p.Deleted).HasDefaultValue(false).IsRequired();
            builder.Property(p => p.Created_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");

            builder.HasMany(build => build.Reservations)
                 .WithOne(build => build.Tile)
                 .HasForeignKey(p => p.Desk_Id)
                 .IsRequired();
            builder.HasOne(build => build.Zone)
                .WithMany(build => build.Tiles)
                .HasForeignKey(p => p.Zone_Id)
                .IsRequired();
        }
    }
}