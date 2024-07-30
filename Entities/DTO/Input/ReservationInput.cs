namespace Entities.DTO.Input
{
    public class ReservationInput
    {
        public Guid User_Id { get; set; }
        public Guid Desk_Id { get; set; }
        public DateTime Date { get; set; }
    }
}
