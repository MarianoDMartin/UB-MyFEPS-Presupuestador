namespace Presupuestador.ViewModels
{
  public class Tarea
  {
    public int TareaId { get; set; }

    public string Descripcion { get; set; }

    public int RecursoId { get; set; }

    public string Recurso { get; set; }

    public string Rol { get; set; }

    public string Rango { get; set; }

    public int Tiempo { get; set; }
  }
}