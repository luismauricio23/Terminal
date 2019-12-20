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
    public class ConductorController : Controller
    {
        private MiSistemaEntities db = new MiSistemaEntities();

        // GET: Conductor
        [AuthorizeUser(idOperacion: 1012)]
        public ActionResult Index()
        {
            var conductor = db.Conductor.Include(c => c.Empresa);
            return View(conductor.ToList());
        }

        // GET: Conductor/Details/5
        [AuthorizeUser(idOperacion: 1014)]
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conductor conductor = db.Conductor.Find(id);
            if (conductor == null)
            {
                return HttpNotFound();
            }
            return View(conductor);
        }

        // GET: Conductor/Create
        [AuthorizeUser(idOperacion: 1016)]
        public ActionResult Create()
        {
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa");
            return View();
        }

        // POST: Conductor/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Documento_Conductor,Nombre_Conductor,Apellido_Conductor,Correo_Conductor,Edad_Conductor,Telefono_Conductor,Nit_Empresa")] Conductor conductor)
        {
            if (ModelState.IsValid)
            {
                db.Conductor.Add(conductor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", conductor.Nit_Empresa);
            return View(conductor);
        }

        // GET: Conductor/Edit/5
        [AuthorizeUser(idOperacion: 1015)]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conductor conductor = db.Conductor.Find(id);
            if (conductor == null)
            {
                return HttpNotFound();
            }
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", conductor.Nit_Empresa);
            return View(conductor);
        }

        // POST: Conductor/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Documento_Conductor,Nombre_Conductor,Apellido_Conductor,Correo_Conductor,Edad_Conductor,Telefono_Conductor,Nit_Empresa")] Conductor conductor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(conductor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", conductor.Nit_Empresa);
            return View(conductor);
        }

        // GET: Conductor/Delete/5
        [AuthorizeUser(idOperacion: 1013)]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conductor conductor = db.Conductor.Find(id);
            if (conductor == null)
            {
                return HttpNotFound();
            }
            return View(conductor);
        }

        // POST: Conductor/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Conductor conductor = db.Conductor.Find(id);
            db.Conductor.Remove(conductor);
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
