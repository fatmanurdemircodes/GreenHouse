using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreenHouse.DTO.UyeDTO
{
    public class UyeLoginDTO
    {
        [Required, EmailAddress]
        public string MailAdresi { get; set; }

        [Required]
        public string UyeSifre { get; set; }
    }
}
