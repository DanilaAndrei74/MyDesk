namespace Entities.DTO.Input;

public class ScheduleTeamInput
{
    public Guid TeamId { get; set; }
    public Guid BuildingId { get; set; }
    public DateTime Date { get; set; }
}