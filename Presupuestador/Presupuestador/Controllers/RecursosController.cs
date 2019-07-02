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
    public class RecursosController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Recursos
        public ActionResult Index()
        {
            var recursos = db.Recursos.Include(r => r.Rango).Include(r => r.Role);
            return View(recursos.ToList());
        }

        // GET: Recursos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso recurso = db.Recursos.Find(id);
            if (recurso == null)
            {
                return HttpNotFound();
            }
            return View(recurso);
        }

        // GET: Recursos/Create
        public ActionResult Create()
        {
            ViewBag.rango_id = new SelectList(db.Rangos, "id", "descripcion");
            ViewBag.rol_id = new SelectList(db.Roles, "id", "descripcion");
            return View();
        }

        // POST: Recursos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,descripcion,valorHora,rango_id,rol_id")] Recurso recurso)
        {
            if (ModelState.IsValid)
            {
                db.Recursos.Add(recurso);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.rango_id = new SelectList(db.Rangos, "id", "descripcion", recurso.rango_id);
            ViewBag.rol_id = new SelectList(db.Roles, "id", "descripcion", recurso.rol_id);
            return View(recurso);
        }

        // GET: Recursos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso recurso = db.Recursos.Find(id);
            if (recurso == null)
            {
                return HttpNotFound();
            }
            ViewBag.rango_id = new SelectList(db.Rangos, "id", "descripcion", recurso.rango_id);
            ViewBag.rol_id = new SelectList(db.Roles, "id", "descripcion", recurso.rol_id);
            return View(recurso);
        }

        // POST: Recursos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,descripcion,valorHora,rango_id,rol_id")] Recurso recurso)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recurso).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.rango_id = new SelectList(db.Rangos, "id", "descripcion", recurso.rango_id);
            ViewBag.rol_id = new SelectList(db.Roles, "id", "descripcion", recurso.rol_id);
            return View(recurso);
        }

        // GET: Recursos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso recurso = db.Recursos.Find(id);
            if (recurso == null)
            {
                return HttpNotFound();
            }
            return View(recurso);
        }

        // POST: Recursos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Recurso recurso = db.Recursos.Find(id);
            db.Recursos.Remove(recurso);
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
