using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class FloorsConfig : IEntityTypeConfiguration<Floor>
    {
        public void Configure(EntityTypeBuilder<Floor> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.Building_Id).IsRequired();
            builder.Property(p => p.Name).IsRequired();
            builder.Property(p => p.Deleted).HasDefaultValue(false).IsRequired();
            builder.Property(p => p.Created_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");

            builder.HasMany(build => build.Zones)
                .WithOne(build => build.Floor)
                .HasForeignKey(p => p.Floor_Id)
                .IsRequired();
            builder.HasOne(build => build.Building)
                .WithMany(build => build.Floors)
                .HasForeignKey(p => p.Building_Id)
                .IsRequired();
        }
    }
}