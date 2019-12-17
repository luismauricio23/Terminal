using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TerminalTransporte.Controllers
{
    public class AccesoClienteController : Controller
    {
        // GET: AccesoCliente
        public ActionResult LoginCliente()
        {
            return View();
        }


        [HttpPost]
        public ActionResult LoginCliente(string Usuario, string Contraseña)
        {
            try



            {
                using (Models.MiSistemaEntities db = new Models.MiSistemaEntities())
                {


                    var oUser = (
                                 from e in db.Cliente
                                 where e.Correo_Cliente == Usuario.Trim() && e.Cedula_Cliente == Contraseña.Trim()
                                 select e).FirstOrDefault();


                    if (oUser == null)
                    {
                        ViewBag.Error = "Usuario o contraseña invalida";
                        return View();
                    }

                    return RedirectToAction("Clientes", "RedireccionamientoClientes");

                }




            }

            catch (Exception ex)

            {

                ViewBag.Error = ex.Message;
                return View();

            }
        }


      }
}