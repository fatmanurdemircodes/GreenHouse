using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DTO.UyeDTO
{
    public class UyeRegisterDTO
    {
        [Required]
        public string UyeAdi { get; set; }

        [Required]
        public string UyeSoyadi { get; set; }

        [Required, EmailAddress]
        public string MailAdresi { get; set; }

        [Required, MinLength(6)]
        public string UyeSifre { get; set; }
    }
}
