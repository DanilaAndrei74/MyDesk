using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.DTO.Output
{
    public class TeamOutput
    {
        public Guid Id { get; set; }  
        public string Name { get; set; }
        public DateTime Updated_At { get; set; }
    }
}
