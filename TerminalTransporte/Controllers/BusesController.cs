using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TerminalTransporte.Filters;
using TerminalTransporte.Models;

namespace TerminalTransporte.Controllers
{
    public class BusesController : Controller
    {
        private MiSistemaEntities db = new MiSistemaEntities();

        [AuthorizeUser(idOperacion: 2)]
        public ActionResult Index()
        {
            var bus = db.Bus.Include(b => b.Conductor);
            return View(bus.ToList());
        }

        // GET: Buses/Details/5
        [AuthorizeUser(idOperacion: 4)]
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bus bus = db.Bus.Find(id);
            if (bus == null)
            {
                return HttpNotFound();
            }
            return View(bus);
        }

        // GET: Buses/Create
        [AuthorizeUser(idOperacion: 6)]
        public ActionResult Create()
        {
            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor");
            return View();
        }

        // POST: Buses/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Placa_bus,Tipo_bus,Cantidad_pasajeros_bus,Documento_Conductor")] Bus bus)
        {
            if (ModelState.IsValid)
            {
                db.Bus.Add(bus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor", bus.Documento_Conductor);
            return View(bus);
        }

        // GET: Buses/Edit/5
        [AuthorizeUser(idOperacion: 5)]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bus bus = db.Bus.Find(id);
            if (bus == null)
            {
                return HttpNotFound();
            }
            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor", bus.Documento_Conductor);
            return View(bus);
        }

        // POST: Buses/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Placa_bus,Tipo_bus,Cantidad_pasajeros_bus,Documento_Conductor")] Bus bus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor", bus.Documento_Conductor);
            return View(bus);
        }

        // GET: Buses/Delete/5
        [AuthorizeUser(idOperacion: 3)]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bus bus = db.Bus.Find(id);
            if (bus == null)
            {
                return HttpNotFound();
            }
            return View(bus);
        }

        // POST: Buses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Bus bus = db.Bus.Find(id);
            db.Bus.Remove(bus);
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
