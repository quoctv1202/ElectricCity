namespace ElectricCity.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Image")]
    public partial class Image
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string ImageLink { get; set; }

        public bool? Status { get; set; }

        public int? ProductID { get; set; }

        public virtual Product Product { get; set; }
    }
}
