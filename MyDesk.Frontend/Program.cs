using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.Extensions.Hosting;
using MyDesk.Application.Services;
using MyDesk.Frontend.Data;
using MyDesk.Frontend.Services;
using MyDesk.Frontend.Validators;
using MyDesk.Validators;
using Radzen;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

builder.Services.AddScoped(x => {
     return new HttpClient();
});


builder.Services.AddScoped<ChangePasswordValidator>();
builder.Services.AddScoped<LoginValidator>();

builder.Services.AddScoped<IAccountService, AccountService>()
                .AddScoped<IHttpService, HttpService>()
                .AddScoped<IAlertService, AlertService>()
                .AddScoped<DialogService>();
var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
