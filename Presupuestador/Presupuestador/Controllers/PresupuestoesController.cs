using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Presupuestador.Models;

namespace Presupuestador.Views
{
    public class PresupuestosController : Controller
    {
        private Entities1 db = new Entities1();

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
            ViewBag.estado_id = new SelectList(db.Presupuestos_Estados, "id", "descripcion");
            ViewBag.proyecto_id = new SelectList(db.Proyectos, "id", "nombre");
            return View();
        }

        // POST: Presupuestos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,descripcion,ciclos_test,tiempo_test,fecha_creacion,fecha_vencimiento,cargas_sociales,markup,costo_base,creador,proyecto_id,estado_id")] Presupuesto presupuesto)
        {
            if (ModelState.IsValid)
            {
                db.Presupuestos.Add(presupuesto);
                db.SaveChanges();
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
    }
}
