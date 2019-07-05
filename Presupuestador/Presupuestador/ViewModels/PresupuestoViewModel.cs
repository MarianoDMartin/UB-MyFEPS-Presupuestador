using System;
using System.Collections.Generic;

namespace Presupuestador.ViewModels
{
  public class PresupuestoViewModel
  {
    public int id { get; set; }
    public string descripcion { get; set; }
    public int ciclos_test { get; set; }
    public int tiempo_test { get; set; }
    public DateTime fecha_creacion { get; set; }
    public DateTime? fecha_vencimiento { get; set; }
    public double? cargas_sociales { get; set; }
    public double? markup { get; set; }
    public double? costo_base { get; set; }
    public string creador { get; set; }
    public int proyecto_id { get; set; }
    public int estado_id { get; set; }
    public int Tareas { get; set; }
    public int Recursos { get; set; }
    public int valorHora { get; set; }
    public List<TareaViewModel> TareasAsignadas { get; set; } = new List<TareaViewModel>();
  }
}