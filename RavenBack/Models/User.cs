using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace RavenBack.Models
{
    public class User
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }
        [StringLength(maximumLength: 24, MinimumLength = 1)]
        [BsonElement("Name")]
        public string? FirstName { get; set; }
        [StringLength(maximumLength: 24, MinimumLength = 1)]
        public string? LastName { get; set; }
        [StringLength(maximumLength: 255, MinimumLength = 4)]
        public string? Email { get; set; }
        [StringLength(maximumLength: 30, MinimumLength = 8)]
        public string? Password { get; set; }
        public Address Address { get; set; } = null!;
    }
}