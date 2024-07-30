namespace Entities.DTO.Output
{
    public class ReservationOutput
    {
        public Guid Id { get; set; }
        public Guid User_Id { get; set; }
        public Guid Desk_Id { get; set; }
        public DateTime Date { get; set; }
        public DateTime Updated_At { get; set; }
    }
}
