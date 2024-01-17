using System;
using System.ComponentModel.DataAnnotations;


namespace WebApi.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }


        [RegularExpression(@"^\d{8}$", ErrorMessage = "El campo Documento de Identidad debe tener 8 dígitos.")]
        public string DocumentoIdentidad { get; set; }

        [Required(ErrorMessage = "El campo Nombres es obligatorio.")]
        public string Nombres { get; set; }

        [RegularExpression(@"^\d{9}$", ErrorMessage = "El campo Teléfono debe tener 9 dígitos.")]
        //[Range(0, 9, ErrorMessage = "El campo Telefono debe ser un número del 0 al 9.")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "El campo Correo es obligatorio.")]
        [EmailAddress(ErrorMessage = "El campo Correo no tiene un formato de correo electrónico válido.")]
        public string Correo { get; set; }

        [Required(ErrorMessage = "El campo Ciudad es obligatorio.")]
        public string Ciudad { get; set; }

        public DateTime FechaRegistro { get; set; }
    }
}