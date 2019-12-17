using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TerminalTransporte.Models;

namespace TerminalTransporte.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Acceso
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string User, string Pass)
        {
            try



            {
                using (Models.MiSistemaEntities db = new Models.MiSistemaEntities())
                {


                    var oUser = (from d in db.Empleado

                                 where d.email_empleado == User.Trim() && d.password_Empleado == Pass.Trim()
                                 select d).FirstOrDefault();

                    if (oUser == null)
                    {
                        ViewBag.Error = "Usuario o contraseña invalida";
                        return View();
                    }

                    Session["User"] = oUser;

                }
                return RedirectToAction("Empleados", "RedireccionEmpleados");



            }

            catch (Exception ex)

            {

                ViewBag.Error = ex.Message;
                return View();

            }


        }

        


        
    }


    }
