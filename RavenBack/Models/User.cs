using System.ComponentModel.DataAnnotations;

namespace RavenBack.Models
{
    public class User
    {
        public int UserId { get; set; }
        [StringLength(maximumLength: 24, MinimumLength = 1)]
        public string? FirstName { get; set; }
        [StringLength(maximumLength: 24, MinimumLength = 1)]
        public string? LastName { get; set; }
        [StringLength(maximumLength: 255, MinimumLength = 4)]
        public string? Email { get; set; }
        [StringLength(maximumLength: 30, MinimumLength = 8)]
        public string? Password { get; set; }
    }
}