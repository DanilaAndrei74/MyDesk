using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class UsersConfig : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.Email).IsRequired();
            builder.Property(p => p.First_Name).IsRequired();
            builder.Property(p => p.Last_Name).IsRequired();
            builder.Property(p => p.Is_Admin).HasDefaultValue(false).IsRequired();
            builder.Property(p => p.Deleted).HasDefaultValue(false).IsRequired();
            builder.Property(p => p.Created_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");

            builder.HasMany(build => build.Reservations)
                .WithOne(build => build.User)
                .HasForeignKey(p => p.User_Id)
                .IsRequired();

            builder.HasOne(build => build.Team)
                .WithMany(buid => buid.Users)
                .HasForeignKey( p => p.Team_Id)
                .IsRequired();

            builder.HasOne(build => build.Photo)
                .WithOne(buid => buid.User)
                .IsRequired();
        }
    }
}