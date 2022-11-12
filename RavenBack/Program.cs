using Microsoft.EntityFrameworkCore;
using RavenBack.Models;

var CorsPolicy = "_corsPolicy";
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.Configure<RavenDatabaseSettings>(
    builder.Configuration.GetSection("MongoDB")
);

builder.Services.AddCors(options =>
    {
    options.AddPolicy(name: CorsPolicy,
    policy =>
    {
        policy.WithOrigins("http://localhost:64029");
    });
});

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(CorsPolicy);

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
