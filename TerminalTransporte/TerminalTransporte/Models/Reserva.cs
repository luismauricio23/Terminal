//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TerminalTransporte.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reserva
    {
        public int Id_Reserva { get; set; }
        public string origen_ciudad { get; set; }
        public string Destino_ciudad { get; set; }
        public string Nit_Empresa { get; set; }
        public Nullable<System.DateTime> fecha_Reserva { get; set; }
        public string cantida_tiquetes_Reserva { get; set; }
        public string total_pagar_Reserva { get; set; }
        public string Cedula_cliente { get; set; }
    
        public virtual Ciudad Ciudad { get; set; }
        public virtual Ciudad Ciudad1 { get; set; }
        public virtual Cliente Cliente { get; set; }
        public virtual Empresa Empresa { get; set; }
    }
}
