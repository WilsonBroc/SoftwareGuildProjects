using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ContactListWithWebApi.Models;

namespace ContactListWithWebApi.Controllers
{
    public class ContactsController : ApiController
    {

        public List<Contact> Get()
        {
            var repo = new FakeContactDatabase();
            return repo.GetAll();
        }

        public Contact Get(int id)
        {
            var repo = new FakeContactDatabase();
            return repo.GetById(id);
        }

        public HttpResponseMessage Post(Contact newContact)
        {
            var repo = new FakeContactDatabase();
            repo.Add(newContact);
            var response = Request.CreateResponse(HttpStatusCode.Created);
            string uri = Url.Link("DefaultApi", new {id = newContact.ContactId});
            response.Headers.Location = new Uri(uri);

            return response;
        }

    }
}
