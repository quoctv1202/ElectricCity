namespace ElectricCity.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ElectricCityOnlineDBContext : DbContext
    {
        public ElectricCityOnlineDBContext()
            : base("name=ElectricCityOnlineDBContext1")
        {
        }

        public virtual DbSet<Bill> Bills { get; set; }
        public virtual DbSet<BillDetail> BillDetails { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<FeedBack> FeedBacks { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Permisssion> Permisssions { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<SystemConfig> SystemConfigs { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Bill>()
                .Property(e => e.CustomerEmail)
                .IsUnicode(false);

            modelBuilder.Entity<Bill>()
                .Property(e => e.CustomerPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Bill>()
                .Property(e => e.PaymentType)
                .IsUnicode(false);

            modelBuilder.Entity<Bill>()
                .HasMany(e => e.BillDetails)
                .WithRequired(e => e.Bill)
                .HasForeignKey(e => e.IDBill)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Brand>()
                .Property(e => e.ImageLink)
                .IsUnicode(false);

            modelBuilder.Entity<Brand>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Brand>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Brand>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Contents)
                .IsFixedLength();

            modelBuilder.Entity<FeedBack>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<FeedBack>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Image>()
                .Property(e => e.ImageLink)
                .IsUnicode(false);

            modelBuilder.Entity<Permisssion>()
                .Property(e => e.PermissionName)
                .IsUnicode(false);

            modelBuilder.Entity<Permisssion>()
                .HasMany(e => e.Users)
                .WithOptional(e => e.Permisssion)
                .HasForeignKey(e => e.Permission);

            modelBuilder.Entity<Product>()
                .Property(e => e.ImageLink)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.PromotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.QuantityLeft)
                .IsFixedLength();

            modelBuilder.Entity<Product>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.BillDetails)
                .WithRequired(e => e.Product)
                .HasForeignKey(e => e.IDProduct)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<ProductCategory>()
                .HasMany(e => e.Products)
                .WithOptional(e => e.ProductCategory)
                .HasForeignKey(e => e.CategoryID);

            modelBuilder.Entity<SystemConfig>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);
        }
    }
}
