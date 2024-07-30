using MyDesk.API;
using MyDesk.Frontend.Services;
using System.Net.Http.Headers;

namespace MyDesk.Application.Services
{
    public interface IHttpService
    {
        //Task<UserOutput> GetAllUsers();
        Task<UserOutput> GetUserById(Guid userId);
        Task<bool> ChangePassword(Guid userId, string oldPassword, string newPassword);
        Task<List<BuildingOutput>> GetAllBuildings();
        Task<List<TeamOutput>> GetAllTeams();
        Task<List<FloorOutput>> GetAllFloors();
        Task<List<ZoneOutput>> GetAllZones();
        Task<List<TileOutput>> GetZoneTiles(Guid zone_Id);
        Task UpdateTile(TileInput tile, Guid tile_Id);

        Task<List<TileExtendedOutput>> GetZoneTilesWithReservations(Guid zone_Id, DateTime date);
        Task<LoginOutput> Login(LoginInput input);
        Task<ReservationOutput> CreateReservation(ReservationInput input);
        Task CancelReservation(Guid reservationId);
        Task<ScheduleTeamOutput> ScheduleTeamReservation(ScheduleTeamInput input);
        Task<MetricsOutput> GetMetrics(MetricsInput input);

	}

    public class HttpService : IHttpService
    {
        private HttpClient _httpClient;
        private readonly IAccountService _storage;
        public const string BASE_URL = "https://localhost:5064";
        public HttpService(HttpClient httpClient, IAccountService storage)
        {
            _httpClient = httpClient;
            _storage = storage;
        }

        public MyDeskAPI CreateClient()
        {
            _storage.Get();
            var jwt = string.Empty;
            if (_storage.User != null) jwt = _storage.User.JWT;
			_httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", jwt);
			return new MyDeskAPI(BASE_URL, _httpClient);
        }

        #region Teams

        public async Task<List<TeamOutput>> GetAllTeams()
        {
            var client = CreateClient();
            var output = await client.TeamsAllAsync().ConfigureAwait(true);
            return output as List<TeamOutput>;
        }
        #endregion

        #region Users
        //public async Task<UserOutput> GetAllUsers()
        //{
        //    var client = CreateClient();
        //    return (List<UserOutput>)await client.UserAllAsync().ConfigureAwait(true);
        //}
        public async Task<UserOutput> GetUserById(Guid userId)
        {
            var client = CreateClient();
            var output = await client.UsersAllAsync().ConfigureAwait(true);
            return output.FirstOrDefault(x => x.User_Id == userId);
        }

        public async Task<bool> ChangePassword(Guid userId, string oldPassword, string newPassword)
        {
            var client = CreateClient();
            return await client.PasswordAsync(userId,oldPassword,newPassword).ConfigureAwait(true);
        }
        #endregion

        #region Buldings
        public async Task<List<BuildingOutput>> GetAllBuildings()
        {
            var client = CreateClient();
            return (List<BuildingOutput>)await client.BuildingsAllAsync().ConfigureAwait(true);
        }
        #endregion

        #region Floors
        public async Task<List<FloorOutput>> GetAllFloors()
        {
            var client = CreateClient();
            return (List<FloorOutput>)await client.FloorsAllAsync().ConfigureAwait(true);
        }
        #endregion

        #region Zones
        public async Task<List<ZoneOutput>> GetAllZones()
        {
            var client = CreateClient();
            return (List<ZoneOutput>)await client.ZoneAllAsync().ConfigureAwait(true);
        }
        #endregion

        #region Tiles
        public async Task<List<TileOutput>> GetZoneTiles(Guid zone_Id)
        {
            var client = CreateClient();
            return (List<TileOutput>)await client.TilesAll2Async(zone_Id).ConfigureAwait(true);
        }

        public async Task<List<TileExtendedOutput>> GetZoneTilesWithReservations(Guid zone_Id, DateTime date)
            {
             var client = CreateClient();
             return (List<TileExtendedOutput>)await client.TilesAll3Async(zone_Id,date).ConfigureAwait(true);
        }

        public async Task UpdateTile(TileInput tile, Guid tile_Id)
        {
            var client = CreateClient();
            await client.TilesPUTAsync(tile_Id, tile).ConfigureAwait(true);
        }

    #endregion

        #region Login
    public async Task<LoginOutput> Login(LoginInput input)
        {
            var client = CreateClient();
            return await client.LoginAsync(input).ConfigureAwait(true);
        }

        #endregion

        #region Reservations
        public async Task<ReservationOutput> CreateReservation(ReservationInput input)
        {
            var client = CreateClient();
            var response = await client.ReservationPOSTAsync(input).ConfigureAwait(true);
            return response;
        }

        public async Task CancelReservation(Guid reservationId)
        {
            var client = CreateClient();
            await client.ReservationDELETEAsync(reservationId).ConfigureAwait(true);
        }

        public async Task<ScheduleTeamOutput> ScheduleTeamReservation(ScheduleTeamInput input)
        {
            var client = CreateClient();
            var response = await client.ScheduleTeamAsync(input).ConfigureAwait(true);
            return response;
        }
        #endregion
        
        #region Metrics
        public async Task<MetricsOutput> GetMetrics(MetricsInput input)
        {
            var client = CreateClient();
            return await client.MetricsAsync(input).ConfigureAwait(true);
        }
        #endregion
    }
}
