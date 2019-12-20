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
    public class EmpleadoController : Controller
    {
        private MiSistemaEntities db = new MiSistemaEntities();

        // GET: Empleado
        [AuthorizeUser(idOperacion: 1017)]
        public ActionResult Index()
        {
            var empleado = db.Empleado.Include(e => e.Empresa).Include(e => e.rol);
            return View(empleado.ToList());
        }

        // GET: Empleado/Details/5
        [AuthorizeUser(idOperacion: 1019)]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // GET: Empleado/Create
        [AuthorizeUser(idOperacion: 1021)]
        public ActionResult Create()
        {
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa");
            ViewBag.idRol_Empleado = new SelectList(db.rol, "id", "nombre");
            return View();
        }

        // POST: Empleado/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_Empleado,nombre_Empleado,email_empleado,password_Empleado,fecha_Empleado,idRol_Empleado,Cedula_Empleado,Telefono_Empleado,Direccion_Empleado,Estado,Nit_Empresa")] Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                db.Empleado.Add(empleado);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", empleado.Nit_Empresa);
            ViewBag.idRol_Empleado = new SelectList(db.rol, "id", "nombre", empleado.idRol_Empleado);
            return View(empleado);
        }

        // GET: Empleado/Edit/5
        [AuthorizeUser(idOperacion: 1020)]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", empleado.Nit_Empresa);
            ViewBag.idRol_Empleado = new SelectList(db.rol, "id", "nombre", empleado.idRol_Empleado);
            return View(empleado);
        }

        // POST: Empleado/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_Empleado,nombre_Empleado,email_empleado,password_Empleado,fecha_Empleado,idRol_Empleado,Cedula_Empleado,Telefono_Empleado,Direccion_Empleado,Estado,Nit_Empresa")] Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleado).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", empleado.Nit_Empresa);
            ViewBag.idRol_Empleado = new SelectList(db.rol, "id", "nombre", empleado.idRol_Empleado);
            return View(empleado);
        }

        // GET: Empleado/Delete/5
        [AuthorizeUser(idOperacion: 1018)]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // POST: Empleado/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Empleado empleado = db.Empleado.Find(id);
            db.Empleado.Remove(empleado);
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
