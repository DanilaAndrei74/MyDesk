using DataAccess;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Services.Validators;
using Shared.Services;
using System.Text;

namespace MyDesk
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);


            builder.Services.AddDbContext<DataContext>(options =>
            options.UseSqlServer(builder.Configuration["DracoDatabase"]));

			// Add services to the container.
			builder.Services.AddScoped<JwtService>();
			builder.Services.AddScoped<OutputService>();
            builder.Services.AddScoped<CryptographyService>();


            //Add validators
            builder.Services.AddScoped<BuildingValidator>();
            builder.Services.AddScoped<FloorValidator>();
            builder.Services.AddScoped<PasswordValidator>();
            builder.Services.AddScoped<ReservationValidator>();
            builder.Services.AddScoped<TeamsValidator>();
            builder.Services.AddScoped<TileValidator>();
            builder.Services.AddScoped<UserValidator>();
            builder.Services.AddScoped<ZoneValidator>();



            builder.Services.AddControllers();
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

			builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options => {
				options.TokenValidationParameters = new TokenValidationParameters
				{
					ValidateIssuer = true,
					ValidateAudience = true,
					ValidateLifetime = true,
					ValidateIssuerSigningKey = true,
					ValidIssuer = builder.Configuration["Jwt:Issuer"],
					ValidAudience = builder.Configuration["Jwt:Audience"],
					IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
				};
			});


			var app = builder.Build();

			app.UseCors(builder => builder
					.AllowAnyOrigin()
					.AllowAnyMethod()
					.AllowAnyHeader());

			// Configure the HTTP request pipeline.
			if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}