using Entities.DTO.Output;
using Entities.Models;

namespace Shared.Services
{
    public class OutputService
    {
        #region User
        public List<UserOutput> Users(IEnumerable<User> users)
        {
            var output = new List<UserOutput>();
            foreach (var user in users)
            {
                output.Add(new UserOutput
                {
                    User_Id = user.Id,
                    Email = user.Email,
                    First_Name = user.First_Name,
                    Last_Name = user.Last_Name,
                    Team = user.Team.Name,
                    Updated_At = user.Updated_At,
                });
            }
            return output;
        }

        public UserOutput User(User user)
        {
            return new UserOutput()
            {
                User_Id = user.Id,
                Email = user.Email,
                First_Name = user.First_Name,
                Last_Name = user.Last_Name,
                Team = user.Team!.Name,
                Updated_At = user.Updated_At,
            };
        }
        #endregion
        #region Building
        public List<BuildingOutput> Buildings(IEnumerable<Building> buildings)
        {
            var output = new List<BuildingOutput>();
            foreach (var building in buildings)
            {
                output.Add(new BuildingOutput
                {
                    Id = building.Id,
                    Name = building.Name,
                    Address = building.Address,
                    Updated_At = building.Updated_At,
                });
            }
            return output;
        }

        public BuildingOutput Building(Building building)
        {
            return new BuildingOutput()
            {
                Id = building.Id,
                Name = building.Name,
                Address = building.Address,
                Updated_At = building.Updated_At,
            };
        }
        #endregion
        #region Floor
        public List<FloorOutput> Floors(IEnumerable<Floor> floors)
        {
            var output = new List<FloorOutput>();
            foreach (var floor in floors)
            {
                output.Add(new FloorOutput
                {
                    Id = floor.Id,
                    Building_Id = floor.Building_Id,
                    Name = floor.Name,
                    Updated_At = floor.Updated_At,
                });
            }
            return output;
        }

        public FloorOutput Floor(Floor floor)
        {
            return new FloorOutput()
            {
                Id = floor.Id,
                Building_Id = floor.Building_Id,
                Name = floor.Name,
                Updated_At= floor.Updated_At,
            };
        }
        #endregion
        #region Zone
        public List<ZoneOutput> Zones(IEnumerable<Zone> zones)
        {
            var output = new List<ZoneOutput>();
            foreach (var zone in zones)
            {
                output.Add(new ZoneOutput
                {
                    Id = zone.Id,
                    Name = zone.Name,
                    FloorId = zone.Floor_Id,
                    Updated_At = zone.Updated_At,
                    Size_X = zone.Size_X,
                    Size_Y = zone.Size_Y,
                });
            }
            return output;
        }

        public ZoneOutput Zone(Zone zone)
        {
            return new ZoneOutput()
            {
                Id = zone.Id,
                Name = zone.Name,
                FloorId = zone.Floor_Id,
                Updated_At = zone.Updated_At,
                Size_X = zone.Size_X,
                Size_Y = zone.Size_Y,
            };
        }
        #endregion
        #region ParkingSpot
        public List<TileOutput> Tiles(IEnumerable<Tile> tiles)
        {
            var output = new List<TileOutput>();
            foreach (var tile in tiles)
            {
                output.Add(new TileOutput
                {
                    Id = tile.Id,
                    Zone_Id = tile.Zone_Id,
                    Type = tile.Type,
                    Updated_At = tile.Updated_At,
                    X_Position = tile.X_Position,
                    Y_Position = tile.Y_Position,
                });
            }
            return output;
        }

        public TileOutput Tile(Tile tile)
        {
            return new TileOutput()
            {
                Id = tile.Id,
                Zone_Id = tile.Zone_Id,
                Type = tile.Type,
                Updated_At = tile.Updated_At,
                X_Position = tile.X_Position,
                Y_Position = tile.Y_Position,
            };
        }

        #endregion
        #region Reservation
        public List<ReservationOutput> Reservations(IEnumerable<Reservation> reservations)
        {
            var output = new List<ReservationOutput>();
            foreach (var reservation in reservations)
            {
                output.Add(new ReservationOutput
                {
                    Id = reservation.Id,
                    Desk_Id = reservation.Desk_Id,
                    User_Id = reservation.User_Id,
                    Date = reservation.Date,
                    Updated_At = reservation.Updated_At,
                    
                });
            }
            return output;
        }

        public ReservationOutput Reservation(Reservation reservation)
        {
            return new ReservationOutput()
            {
                Id = reservation.Id,
                Desk_Id = reservation.Desk_Id,
                User_Id = reservation.User_Id,
                Date = reservation.Date,
                Updated_At = reservation.Updated_At,
            };
        }
        #endregion

        #region TEAMS
        public List<TeamOutput> Teams(IEnumerable<Team> teams)
        {
            var output = new List<TeamOutput>();
            foreach (var team in teams)
            {
                output.Add(new TeamOutput
                {
                    Id = team.Id,
                    Name = team.Name,
                    Updated_At = team.Updated_At,

                });
            }
            return output;
        }

        public TeamOutput Team(Team team)
        {
            return new TeamOutput()
            {
                Id = team.Id,
                Name = team.Name,
                Updated_At = team.Updated_At,
            };
        }
        #endregion
    }
}
