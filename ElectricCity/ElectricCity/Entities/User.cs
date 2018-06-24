namespace ElectricCity.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public int ID { get; set; }

        [StringLength(50)]
        [Display(Name ="Tên tài khoản")]
        [Required(ErrorMessage = "Nhập nội dung trước!.")]
        public string UserName { get; set; }

        [StringLength(50)]
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không trống!.")]
        public string Password { get; set; }

        [StringLength(100)]
        [Display(Name = "Tên Hiển thị")]
        public string NameDisplay { get; set; }

        [Display(Name = "Ngày sinh")]
        public DateTime? DoB { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(200)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [StringLength(20)]
        [Display(Name = "Số điện thoại")]
        public string PhoneNumber { get; set; }

        public bool? Status { get; set; }

        public int? Permission { get; set; }

        public virtual Permisssion Permisssion { get; set; }
    }
}
