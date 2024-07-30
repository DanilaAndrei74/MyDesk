using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public static class Helper
    {
        public static bool BeAValidGuid(Guid guid)
        {
            return !Guid.Empty.Equals(guid);
        }

        public static bool BeNotInPast(DateTime dateTime)
        {
            return dateTime >= DateTime.Now;
        }

        public static bool FitsInZone(Zone zone, Tile tile) 
        {
            return zone.Size_X > tile.X_Position && zone.Size_Y > tile.Y_Position;
        }

    }
}
