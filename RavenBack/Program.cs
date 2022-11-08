using Microsoft.EntityFrameworkCore;
using RavenBack.Data;

var CorsPolicy = "_corsPolicy";
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddDbContext<Context>(options => 
    options.UseSqlite(builder.Configuration.GetConnectionString("Sqlite")));

builder.Services.AddCors(options =>
    {
    options.AddPolicy(name: CorsPolicy,
    policy =>
    {
        policy.WithOrigins("");
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
