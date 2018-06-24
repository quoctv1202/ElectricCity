namespace ElectricCity.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            BillDetails = new HashSet<BillDetail>();
            Images = new HashSet<Image>();
        }

        public int ID { get; set; }

        [StringLength(200)]
        public string Name { get; set; }

        [StringLength(500)]
        public string Description { get; set; }

        [StringLength(100)]
        public string ImageLink { get; set; }

        public decimal? Price { get; set; }

        public decimal? PromotionPrice { get; set; }

        [StringLength(10)]
        public string QuantityLeft { get; set; }

        public int? CategoryID { get; set; }

        public int? BrandID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }

        public bool? PromotedItem { get; set; }

        public bool? HotItem { get; set; }

        [StringLength(200)]
        public string MetaTitle { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillDetail> BillDetails { get; set; }

        public virtual Brand Brand { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Image> Images { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
    }
}
