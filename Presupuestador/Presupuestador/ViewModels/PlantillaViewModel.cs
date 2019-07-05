using Presupuestador.Models;
using System.Collections.Generic;

namespace Presupuestador.ViewModels
{
    public class PlantillaViewModel
    {
        public Plantilla Plantilla { get; set; }
        public int Tarea_id { get; set; }
        public string tareaSeleccionada;
        public List<Tarea> TareasAsignadas { get; set; } = new List<Tarea>();
    }
}