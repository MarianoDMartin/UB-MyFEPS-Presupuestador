﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Presupuestador.Models;
using Presupuestador.ViewModels;
using Tarea = Presupuestador.Models.Tarea;

namespace Presupuestador.Controllers
{
    public class PlantillasController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Plantillas
        public ActionResult Index()
        {
            return View(db.Plantillas.ToList());
        }

        // GET: Plantillas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Plantilla plantilla = db.Plantillas.Find(id);
            if (plantilla == null)
            {
                return HttpNotFound();
            }
            return View(plantilla);
        }

        // GET: Plantillas/Create
        public ActionResult Create()
        {
            ViewBag.Tareas = new SelectList(db.Tareas, "id", "titulo");
            ViewModels.PlantillaViewModel plantillaViewModel = new ViewModels.PlantillaViewModel();

            return View(plantillaViewModel);
        }

        // POST: Plantillas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PlantillaViewModel plantilla)
        {
            if (ModelState.IsValid)
            {
                //db.Plantillas.Add(plantilla);
                //db.SaveChanges();
                //return RedirectToAction("Index");
            }

            return View(plantilla);
        }

        // GET: Plantillas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Plantilla plantilla = db.Plantillas.Find(id);
            if (plantilla == null)
            {
                return HttpNotFound();
            }
            return View(plantilla);
        }

        // POST: Plantillas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nombre")] Plantilla plantilla)
        {
            if (ModelState.IsValid)
            {
                db.Entry(plantilla).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(plantilla);
        }

        // GET: Plantillas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Plantilla plantilla = db.Plantillas.Find(id);
            if (plantilla == null)
            {
                return HttpNotFound();
            }
            return View(plantilla);
        }

        // POST: Plantillas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Plantilla plantilla = db.Plantillas.Find(id);
            db.Plantillas.Remove(plantilla);
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

        public PartialViewResult AgregarTarea(int tareaId, string tareaTitulo)
        {
            Tarea tarea = new Tarea()
            {
                id = tareaId,
                titulo = tareaTitulo
            };
            return PartialView("_Tareas", tarea);
        }
    }
}
