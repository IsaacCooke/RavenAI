using RavenBack.Models;
using RavenBack.Services;

var CorsPolicy = "_corsPolicy";
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.Configure<RavenDatabaseSettings>(
    builder.Configuration.GetSection("RavenDatabase"));

builder.Services.AddSingleton<UserService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: CorsPolicy,
    policy =>
    {
        policy.WithOrigins
        (
            "exp://192.168.0.41:19000",
            "http://localhost:19006",
            "http://localhost:19000"
        )
        .AllowAnyHeader()
        .AllowAnyMethod();
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