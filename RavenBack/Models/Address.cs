using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace RavenBack.Models
{
    public class Address
    {
        [StringLength(maximumLength: 511, MinimumLength = 1)]
        public string? Street { get; set; }
        [StringLength(maximumLength: 511, MinimumLength = 1)]
        public string? Town { get; set; }
        public string? Country { get; set; }
        public int HouseNumber { get; set; }
        public string? HouseName { get; set; }
        public string? PostCode { get; set; }
    }

}