using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectricCity.Common
{
    public static class Result
    {
        public  enum LoginResult
        {
            DangNhapThanhCong,
            TaiKhoanKhongTonTai,
            TaiKhoanBiKhoa,
            MatKhauSai,
            KhongCoQuyen,
        }
        public enum InsertResult
        {
            ThemThanhCong,
            TaiKhoanTonTai,
            MatKhauKhongKhop,
        }
    }
}