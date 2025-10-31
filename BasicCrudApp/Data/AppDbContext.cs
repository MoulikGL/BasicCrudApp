using Microsoft.EntityFrameworkCore;
using BasicCrudApp.Models;

namespace BasicCrudApp.Data;
public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
    public DbSet<Product> Products { get; set; } = null!;
}