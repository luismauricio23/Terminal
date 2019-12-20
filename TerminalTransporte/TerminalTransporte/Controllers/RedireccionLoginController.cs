using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TerminalTransporte.Controllers
{
    public class RedireccionLoginController : Controller
    {
        // GET: RedireccionLogin
        public ActionResult Redireccion()
        {
          
            return View();
        }

        [HttpPost]
        public ActionResult Usuario(String Usuario)
        {
            
            return RedirectToAction("Delete", "Clientes");


        }
    }
}