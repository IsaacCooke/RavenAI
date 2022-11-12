using RavenBack.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace RavenBack.Services;

public class UserService
{
    private readonly IMongoCollection<User> _usersCollection;

    public UserService(IOptions<RavenDatabaseSettings> ravenDatabaseSettings)
    {
        var mongoClient = new MongoClient(
            ravenDatabaseSettings.Value.ConnectionString);

        var mongoDatabase = mongoClient.GetDatabase(
            ravenDatabaseSettings.Value.DatabaseName);

        _usersCollection = mongoDatabase.GetCollection<User>(
            ravenDatabaseSettings.Value.UserCollectionName);
    }

    public async Task<List<User>> GetAsync() =>
        await _usersCollection.Find(_usersCollection => true).ToListAsync();

    public async Task<User?> GetAsync(string id) =>
        await _usersCollection.Find(x => x.Id == id).FirstOrDefaultAsync();
}