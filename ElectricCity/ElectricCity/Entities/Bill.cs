namespace ElectricCity.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bill")]
    public partial class Bill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bill()
        {
            BillDetails = new HashSet<BillDetail>();
        }

        public long ID { get; set; }

        [StringLength(100)]
        public string CustomerName { get; set; }

        [StringLength(100)]
        public string CustomerEmail { get; set; }

        [StringLength(20)]
        public string CustomerPhone { get; set; }

        [StringLength(200)]
        public string CustomerAddress { get; set; }

        [StringLength(50)]
        public string PaymentType { get; set; }

        [StringLength(200)]
        public string PaymentInfo { get; set; }

        public DateTime? CreatedDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillDetail> BillDetails { get; set; }
    }
}
