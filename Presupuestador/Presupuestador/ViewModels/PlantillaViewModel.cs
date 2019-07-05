using System;
using System.Collections.Generic;

namespace Presupuestador.ViewModels
{
  public class PlantillaViewModel
  {
    public int id { get; set; }
    public string nombre { get; set; }
    public int tarea_id { get; set; }
    public List<TareaViewModel> TareasAsignadas { get; set; } = new List<TareaViewModel>();
  }
}