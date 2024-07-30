using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class TeamsConfig : IEntityTypeConfiguration<Team>
    {
        public void Configure(EntityTypeBuilder<Team> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.Name).IsRequired();
            builder.Property(p => p.Created_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");
            builder.Property(p => p.Deleted).HasDefaultValue(false).IsRequired();

            builder.HasMany(build => build.Users)
                .WithOne(build => build.Team)
                .HasForeignKey(p => p.Team_Id);
        }
    }
}