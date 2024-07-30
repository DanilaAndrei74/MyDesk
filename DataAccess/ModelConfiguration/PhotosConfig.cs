using Entities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfiguration
{
    internal class PhotosConfig : IEntityTypeConfiguration<Photo>
    {
        public void Configure(EntityTypeBuilder<Photo> builder)
        {
            builder.HasKey(x => x.User_Id);
            builder.Property(p => p.PhotoUrl).IsRequired();
            builder.Property(p => p.Updated_At).IsRequired().HasDefaultValueSql("getdate()");

            builder.HasOne(build => build.User)
                .WithOne(build => build.Photo)
                .HasForeignKey<Photo>(p => p.User_Id)
                .IsRequired();
        }
    }
}