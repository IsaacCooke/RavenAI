using System.Collections.DataAnnotations;
using MongoDB.Bson;

public class Address{

    [BsonId(ObjectId)]
    public string id { get; set; }
    
    public string? Street { get; set; }
    
    public int HouseNumber { get; set; } = null!;
    
    public string? HouseName { get; set; }
}
