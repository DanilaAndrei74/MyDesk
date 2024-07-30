using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class ReservationsConfig : IEntityTypeConfiguration<Reservation>
    {
        public void Configure(EntityTypeBuilder<Reservation> builder)
        {

            builder.HasKey(x => x.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.User_Id).IsRequired();
            builder.Property(p => p.Desk_Id).IsRequired();
            builder.Property(p => p.Date).IsRequired();
            builder.Property(p => p.Created_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Deleted).HasDefaultValue(false).IsRequired();

            builder.HasOne(build => build.User)
                .WithMany(build => build.Reservations)
                .HasForeignKey(p => p.User_Id)
                .IsRequired();
            builder.HasOne(build => build.Tile)
                .WithMany(build => build.Reservations)
                .HasForeignKey(p => p.Desk_Id)
                .IsRequired();
        }
    }
}