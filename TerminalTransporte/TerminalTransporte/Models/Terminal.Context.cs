﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MiSistemaEntities : DbContext
    {
        public MiSistemaEntities()
            : base("name=MiSistemaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Bus> Bus { get; set; }
        public virtual DbSet<Ciudad> Ciudad { get; set; }
        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<Conductor> Conductor { get; set; }
        public virtual DbSet<Empleado> Empleado { get; set; }
        public virtual DbSet<Empresa> Empresa { get; set; }
        public virtual DbSet<modulo> modulo { get; set; }
        public virtual DbSet<operaciones> operaciones { get; set; }
        public virtual DbSet<Reserva> Reserva { get; set; }
        public virtual DbSet<rol> rol { get; set; }
        public virtual DbSet<rol_operacion> rol_operacion { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tiquete> Tiquete { get; set; }
    }
}
