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
    public class ReservaController : Controller
    {
        private MiSistemaEntities db = new MiSistemaEntities();

        // GET: Reserva
        [AuthorizeUser(idOperacion: 1027)]
        public ActionResult Index()
        {
            var reserva = db.Reserva.Include(r => r.Ciudad).Include(r => r.Ciudad1).Include(r => r.Cliente).Include(r => r.Empresa);
            return View(reserva.ToList());
        }

        // GET: Reserva/Details/5
        [AuthorizeUser(idOperacion: 1029)]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reserva reserva = db.Reserva.Find(id);
            if (reserva == null)
            {
                return HttpNotFound();
            }
            return View(reserva);
        }

        // GET: Reserva/Create
       
        public ActionResult Create()
        {
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad");
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad");
            ViewBag.Cedula_cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente");
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa");
            return View();
        }

        // POST: Reserva/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Reserva,origen_ciudad,Destino_ciudad,Nit_Empresa,fecha_Reserva,cantida_tiquetes_Reserva,total_pagar_Reserva,Cedula_cliente")] Reserva reserva)
        {
            if (ModelState.IsValid)
            {
                db.Reserva.Add(reserva);
                db.SaveChanges();
                return RedirectToAction("Contact","Home");
            }

            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.origen_ciudad);
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.Destino_ciudad);
            ViewBag.Cedula_cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente", reserva.Cedula_cliente);
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", reserva.Nit_Empresa);
            return View(reserva);
        }

        // GET: Reserva/Edit/5
        [AuthorizeUser(idOperacion: 1030)]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reserva reserva = db.Reserva.Find(id);
            if (reserva == null)
            {
                return HttpNotFound();
            }
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.origen_ciudad);
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.Destino_ciudad);
            ViewBag.Cedula_cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente", reserva.Cedula_cliente);
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", reserva.Nit_Empresa);
            return View(reserva);
        }

        // POST: Reserva/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Reserva,origen_ciudad,Destino_ciudad,Nit_Empresa,fecha_Reserva,cantida_tiquetes_Reserva,total_pagar_Reserva,Cedula_cliente")] Reserva reserva)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reserva).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.origen_ciudad);
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.Destino_ciudad);
            ViewBag.Cedula_cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente", reserva.Cedula_cliente);
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", reserva.Nit_Empresa);
            return View(reserva);
        }

        // GET: Reserva/Delete/5
        [AuthorizeUser(idOperacion: 1028)]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reserva reserva = db.Reserva.Find(id);
            if (reserva == null)
            {
                return HttpNotFound();
            }
            return View(reserva);
        }

        // POST: Reserva/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reserva reserva = db.Reserva.Find(id);
            db.Reserva.Remove(reserva);
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
        [AuthorizeUser(idOperacion: 1038)]
        public ActionResult Create2()
        {
            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad");
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad");
            ViewBag.Cedula_cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente");
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa");
            return View();
        }

        // POST: Reserva/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create2([Bind(Include = "Id_Reserva,origen_ciudad,Destino_ciudad,Nit_Empresa,fecha_Reserva,cantida_tiquetes_Reserva,total_pagar_Reserva,Cedula_cliente")] Reserva reserva)
        {
            if (ModelState.IsValid)
            {
                db.Reserva.Add(reserva);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.origen_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.origen_ciudad);
            ViewBag.Destino_ciudad = new SelectList(db.Ciudad, "Codigo_ciudad", "Nombre_ciudad", reserva.Destino_ciudad);
            ViewBag.Cedula_cliente = new SelectList(db.Cliente, "Cedula_Cliente", "Nombre_Cliente", reserva.Cedula_cliente);
            ViewBag.Nit_Empresa = new SelectList(db.Empresa, "Nit_Empresa", "Nombre_Empresa", reserva.Nit_Empresa);
            return View(reserva);
        }

    }
}
