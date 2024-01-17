using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApi.Data;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class UsuarioController : ApiController
    {
        // GET api/<controller>
        public List<Usuario> Get()
        {
            return UsuarioData.Listar();
        }

        // GET api/<controller>/5
        public Usuario Get(int id)
        {
            return UsuarioData.Obtener(id);
        }

        // POST api/<controller>
       // public bool Post([FromBody]Usuario oUsuario)
            public HttpResponseMessage Post([FromBody] Usuario oUsuario)
        {
            if (ModelState.IsValid)
            {
                bool registroExitoso = UsuarioData.Registrar(oUsuario);

                if (registroExitoso)
                {
        
                    return Request.CreateResponse(HttpStatusCode.OK, new {Mensaje = "Usuario registrado exitosamente" });
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Error al registrar el usuario.");
                }
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

        }

        // PUT api/<controller>/5


        [ResponseType(typeof(void))]
        public HttpResponseMessage Put(int id, [FromBody] Usuario oUsuario)
        {
            if (ModelState.IsValid)
            {
                oUsuario.IdUsuario = id;  // Asigna el ID del usuario a modificar


                    bool modificacionExitosa = UsuarioData.Modificar(oUsuario);

                    if (modificacionExitosa)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, new { Mensaje = "Usuario modificado exitosamente." });
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Error al modificar el usuario.");
                    }
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
            

        }

        // DELETE api/<controller>/5
     
        public HttpResponseMessage Delete(int id)
        {
            bool eliminacionExitosa = UsuarioData.Eliminar(id);

            if (eliminacionExitosa)
            {
                return Request.CreateResponse(HttpStatusCode.OK, new { Mensaje = "Usuario eliminado exitosamente." });
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Error al eliminar el usuario.");
            }
        }
    }
}