using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class CredentialsConfig : IEntityTypeConfiguration<Credential>
    {
        public void Configure(EntityTypeBuilder<Credential> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.User_Id).IsRequired();
            builder.Property(p => p.Password).IsRequired();
            builder.Property(p => p.Salt).IsRequired();
            builder.Property(p => p.Number_Of_Tries).HasDefaultValue(0).IsRequired();
            builder.Property(p => p.Is_Active).HasDefaultValue(true).IsRequired();
            builder.Property(p => p.TOTP).IsRequired().HasDefaultValue("");
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");

            builder.HasOne(build => build.User)
                    .WithOne(buid => buid.Credential)
                    .HasForeignKey<Credential>(p => p.User_Id)
                    .IsRequired();
        }
    }
}