using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class ZonesConfig : IEntityTypeConfiguration<Zone>
    {
        public void Configure(EntityTypeBuilder<Zone> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.Floor_Id).IsRequired();
            builder.Property(p => p.Name).IsRequired();
            builder.Property(p => p.Size_X).IsRequired();
            builder.Property(p => p.Size_Y).IsRequired();
            builder.Property(p => p.Deleted).HasDefaultValue(false).IsRequired();
            builder.Property(p => p.Created_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");

            builder.HasMany(build => build.Tiles)
                .WithOne(build => build.Zone)
                .HasForeignKey(p => p.Zone_Id)
                .IsRequired();
            builder.HasOne(build => build.Floor)
                .WithMany(build => build.Zones)
                .HasForeignKey(p => p.Floor_Id)
                .IsRequired();
        }
    }
}