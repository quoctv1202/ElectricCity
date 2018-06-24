namespace ElectricCity.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SystemConfig")]
    public partial class SystemConfig
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(100)]
        public string Type { get; set; }

        [StringLength(200)]
        public string Value { get; set; }

        public bool? Status { get; set; }
    }
}
