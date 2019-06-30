using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Presupuestador.Models;

namespace Presupuestador.Controllers
{
    public class TareasController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Tareas
        public ActionResult Index()
        {
            var tareas = db.Tareas.Include(t => t.Categoria).Include(t => t.Tipos_Tareas);
            return View(tareas.ToList());
        }

        // GET: Tareas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea tarea = db.Tareas.Find(id);
            if (tarea == null)
            {
                return HttpNotFound();
            }
            return View(tarea);
        }

        // GET: Tareas/Create
        public ActionResult Create()
        {
            ViewBag.categoria_id = new SelectList(db.Categorias, "id", "descripcion");
            ViewBag.tipo_tarea_id = new SelectList(db.Tipos_Tareas, "id", "descripcion");
            return View();
        }

        // POST: Tareas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,titulo,descripcion,tipo_tarea_id,categoria_id")] Tarea tarea)
        {
            if (ModelState.IsValid)
            {
                db.Tareas.Add(tarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.categoria_id = new SelectList(db.Categorias, "id", "descripcion", tarea.categoria_id);
            ViewBag.tipo_tarea_id = new SelectList(db.Tipos_Tareas, "id", "descripcion", tarea.tipo_tarea_id);
            return View(tarea);
        }

        // GET: Tareas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea tarea = db.Tareas.Find(id);
            if (tarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoria_id = new SelectList(db.Categorias, "id", "descripcion", tarea.categoria_id);
            ViewBag.tipo_tarea_id = new SelectList(db.Tipos_Tareas, "id", "descripcion", tarea.tipo_tarea_id);
            return View(tarea);
        }

        // POST: Tareas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,titulo,descripcion,tipo_tarea_id,categoria_id")] Tarea tarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categoria_id = new SelectList(db.Categorias, "id", "descripcion", tarea.categoria_id);
            ViewBag.tipo_tarea_id = new SelectList(db.Tipos_Tareas, "id", "descripcion", tarea.tipo_tarea_id);
            return View(tarea);
        }

        // GET: Tareas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea tarea = db.Tareas.Find(id);
            if (tarea == null)
            {
                return HttpNotFound();
            }
            return View(tarea);
        }

        // POST: Tareas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tarea tarea = db.Tareas.Find(id);
            db.Tareas.Remove(tarea);
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
