//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Presupuestador.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PresupuestosTareas_Recursos
    {
        public int id { get; set; }
        public Nullable<int> horas { get; set; }
        public int presupuesto_tarea_id { get; set; }
        public int recurso_id { get; set; }
    
        public virtual Presupuestos_Tareas Presupuestos_Tareas { get; set; }
        public virtual Recurso Recurso { get; set; }
    }
}
