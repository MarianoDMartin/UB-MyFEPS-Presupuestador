using Presupuestador.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Presupuestador.Views
{
  public class PresupuestosController : Controller
  {
    private readonly Entities1 db = new Entities1();

    // GET: Presupuestos
    public ActionResult Index()
    {
      var presupuestos = db.Presupuestos.Include(p => p.Presupuestos_Estados).Include(p => p.Proyecto);
      return View(presupuestos.ToList());
    }

    // GET: Presupuestos/Details/5
    public ActionResult Details(int? id)
    {
      if (id == null)
      {
        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
      }
      Presupuesto presupuesto = db.Presupuestos.Find(id);
      if (presupuesto == null)
      {
        return HttpNotFound();
      }
      return View(presupuesto);
    }

    // GET: Presupuestos/Create
    public ActionResult Create()
    {
      ViewBag.proyecto_id = new SelectList(db.Proyectos, "id", "nombre");
      ViewBag.Tareas = new SelectList(db.Tareas, "id", "titulo");
      ViewBag.Recursos = new SelectList(db.Recursos, "id", "descripcion");
      ViewModels.Presupuesto prespuesto = new ViewModels.Presupuesto();

      return View(prespuesto);
    }

    // POST: Presupuestos/Create
    // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
    // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    //public ActionResult Create([Bind(Include = "id,descripcion,ciclos_test,tiempo_test,fecha_creacion,fecha_vencimiento,cargas_sociales,markup,costo_base,creador,proyecto_id,estado_id,TareasAsignadas")] Presupuestador.ViewModels.Presupuesto presupuesto)
    public ActionResult Create(Presupuestador.ViewModels.Presupuesto presupuesto)
    {
      if (ModelState.IsValid)
      {
        Presupuesto modelPresupuesto = new Presupuesto
        {
          cargas_sociales = presupuesto.cargas_sociales,
          ciclos_test = presupuesto.ciclos_test,
          creador = presupuesto.creador,
          descripcion = presupuesto.descripcion,
          tiempo_test = presupuesto.tiempo_test,
          fecha_creacion = DateTime.Now.Date,
          fecha_vencimiento = presupuesto.fecha_vencimiento,
          markup = presupuesto.markup,
          proyecto_id = presupuesto.proyecto_id,
          estado_id = 1
        };
        db.Presupuestos.Add(modelPresupuesto);
        db.SaveChanges();

        int presupuestos_tareas_id = 0;
        foreach (var tarea in presupuesto.TareasAsignadas)
        {
          // TODO: No funciona el select
          var presupTareas = db.Presupuestos_Tareas.FirstOrDefault(x => x.id == tarea.TareaId && x.presupuesto_id == modelPresupuesto.id);

          if (presupTareas != null)
          {
            presupuestos_tareas_id = presupTareas.id;
          }
          else
          {
            Presupuestos_Tareas presupuestos_tareas = new Presupuestos_Tareas
            {
              presupuesto_id = modelPresupuesto.id,
              tarea_id = tarea.TareaId
            };
            db.Presupuestos_Tareas.Add(presupuestos_tareas);
            db.SaveChanges();
            presupuestos_tareas_id = presupuestos_tareas.id;
          }

          PresupuestosTareas_Recursos presupuestos_tareas_recursos = new PresupuestosTareas_Recursos
          {
            presupuesto_tarea_id = presupuestos_tareas_id,
            recurso_id = tarea.RecursoId,
            horas = tarea.Tiempo
          };
          db.PresupuestosTareas_Recursos.Add(presupuestos_tareas_recursos);
          db.SaveChanges();
        }

        return RedirectToAction("Index");
      }

      ViewBag.estado_id = new SelectList(db.Presupuestos_Estados, "id", "descripcion", presupuesto.estado_id);
      ViewBag.proyecto_id = new SelectList(db.Proyectos, "id", "nombre", presupuesto.proyecto_id);
      return View(presupuesto);
    }

    // GET: Presupuestos/Edit/5
    public ActionResult Edit(int? id)
    {
      if (id == null)
      {
        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
      }
      Presupuesto presupuesto = db.Presupuestos.Find(id);
      if (presupuesto == null)
      {
        return HttpNotFound();
      }
      ViewBag.estado_id = new SelectList(db.Presupuestos_Estados, "id", "descripcion", presupuesto.estado_id);
      ViewBag.proyecto_id = new SelectList(db.Proyectos, "id", "nombre", presupuesto.proyecto_id);
      return View(presupuesto);
    }

    // POST: Presupuestos/Edit/5
    // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
    // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Edit([Bind(Include = "id,descripcion,ciclos_test,tiempo_test,fecha_creacion,fecha_vencimiento,cargas_sociales,markup,costo_base,creador,proyecto_id,estado_id")] Presupuesto presupuesto)
    {
      if (ModelState.IsValid)
      {
        db.Entry(presupuesto).State = EntityState.Modified;
        db.SaveChanges();
        return RedirectToAction("Index");
      }
      ViewBag.estado_id = new SelectList(db.Presupuestos_Estados, "id", "descripcion", presupuesto.estado_id);
      ViewBag.proyecto_id = new SelectList(db.Proyectos, "id", "nombre", presupuesto.proyecto_id);
      return View(presupuesto);
    }

    // GET: Presupuestos/Delete/5
    public ActionResult Delete(int? id)
    {
      if (id == null)
      {
        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
      }
      Presupuesto presupuesto = db.Presupuestos.Find(id);
      if (presupuesto == null)
      {
        return HttpNotFound();
      }
      return View(presupuesto);
    }

    // POST: Presupuestos/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public ActionResult DeleteConfirmed(int id)
    {
      Presupuesto presupuesto = db.Presupuestos.Find(id);
      db.Presupuestos.Remove(presupuesto);
      db.SaveChanges();
      return RedirectToAction("Index");
    }

    protected override void Dispose(bool disposing)
    {
      if (disposing)
      {
        db.Dispose();
      }
      base.Dispose(disposing);
    }

    public PartialViewResult AgregarTarea(int tareaId, string tareaNombre, int recursoId, string recursoNombre, int valorHora)
    {
      ViewModels.Tarea tarea = new ViewModels.Tarea
      {
        TareaId = tareaId,
        Descripcion = tareaNombre,
        RecursoId = recursoId,
        Recurso = recursoNombre,
        Rango = "TEST",
        Rol = "TEST",
        Tiempo = valorHora
      };
      return PartialView("_Tareas", tarea);
    }
  }
}