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
    public class TiqueteController : Controller
    {
        private MiSistemaEntities db = new MiSistemaEntities();

        // GET: Tiquete
        [AuthorizeUser(idOperacion: 1032)]
        public ActionResult Index()
        {
            var tiquete = db.Tiquete.Include(t => t.Bus).Include(t => t.Ciudad).Include(t => t.Ciudad1).Include(t => t.Cliente).Include(t => t.Conductor).Include(t => t.Empleado).Include(t => t.Empresa);
            return View(tiquete.ToList());
        }

        // GET: Tiquete/Details/5
        [AuthorizeUser(idOperacion: 1034)]
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tiquete tiquete = db.Tiquete.Find(id);
            if (tiquete == null)
            {
                return HttpNotFound();
            }
            return View(tiquete);
        }

        // GET: Tiquete/Create
        [AuthorizeUser(idOperacion: 1036)]
        public ActionResult Create()
        {
            ViewBag.Placa_bus = new SelectList(db.Bus, "Placa_bus", "Placa_bus");
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad");
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad");
            ViewBag.Cedula_Cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente");
            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor");
            ViewBag.id_Empleado = new SelectList(db.Empleado, "id_Empleado", "nombre_Empleado");
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa");
            return View();
        }

        // POST: Tiquete/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Codigo_factura,origen_ciudad,Documento_Conductor,Placa_bus,Cedula_Cliente,Nit_Empresa,fecha_factura,cantida_tiquetes,total_pagar_Tiquete,id_Empleado,Destino_ciudad")] Tiquete tiquete)
        {
            if (ModelState.IsValid)
            {
                db.Tiquete.Add(tiquete);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Placa_bus = new SelectList(db.Bus, "Placa_bus", "Placa_bus", tiquete.Placa_bus);
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", tiquete.Destino_ciudad);
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", tiquete.origen_ciudad);
            ViewBag.Cedula_Cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente", tiquete.Cedula_Cliente);
            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor", tiquete.Documento_Conductor);
            ViewBag.id_Empleado = new SelectList(db.Empleado, "id_Empleado", "nombre_Empleado", tiquete.id_Empleado);
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", tiquete.Nit_Empresa);
            return View(tiquete);
        }

        // GET: Tiquete/Edit/5
        [AuthorizeUser(idOperacion: 1035)]
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tiquete tiquete = db.Tiquete.Find(id);
            if (tiquete == null)
            {
                return HttpNotFound();
            }
            ViewBag.Placa_bus = new SelectList(db.Bus, "Placa_bus", "Placa_bus", tiquete.Placa_bus);
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", tiquete.Destino_ciudad);
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", tiquete.origen_ciudad);
            ViewBag.Cedula_Cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente", tiquete.Cedula_Cliente);
            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor", tiquete.Documento_Conductor);
            ViewBag.id_Empleado = new SelectList(db.Empleado, "id_Empleado", "nombre_Empleado", tiquete.id_Empleado);
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", tiquete.Nit_Empresa);
            return View(tiquete);
        }

        // POST: Tiquete/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Codigo_factura,origen_ciudad,Documento_Conductor,Placa_bus,Cedula_Cliente,Nit_Empresa,fecha_factura,cantida_tiquetes,total_pagar_Tiquete,id_Empleado,Destino_ciudad")] Tiquete tiquete)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tiquete).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Placa_bus = new SelectList(db.Bus, "Placa_bus", "Placa_bus", tiquete.Placa_bus);
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", tiquete.Destino_ciudad);
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", tiquete.origen_ciudad);
            ViewBag.Cedula_Cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente", tiquete.Cedula_Cliente);
            ViewBag.Documento_Conductor = new SelectList(db.Conductor, "Documento_Conductor", "Nombre_Conductor", tiquete.Documento_Conductor);
            ViewBag.id_Empleado = new SelectList(db.Empleado, "id_Empleado", "nombre_Empleado", tiquete.id_Empleado);
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", tiquete.Nit_Empresa);
            return View(tiquete);
        }

        // GET: Tiquete/Delete/5
        [AuthorizeUser(idOperacion: 1033)]
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tiquete tiquete = db.Tiquete.Find(id);
            if (tiquete == null)
            {
                return HttpNotFound();
            }
            return View(tiquete);
        }

        // POST: Tiquete/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Tiquete tiquete = db.Tiquete.Find(id);
            db.Tiquete.Remove(tiquete);
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
