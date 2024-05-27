using CrudOperationMvc.Models;
using CrudOperationMvc.Repository;
using Microsoft.Win32.SafeHandles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CrudOperationMvc.Controllers
{
    public class HomeController : Controller
    {
        //public readonly PersonRepository _personInfo = null;
        public readonly IPersonRepository _personInfo ;

        public HomeController()
        {
            _personInfo=new PersonRepository();
        }

         public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetPersonInfos()

        {
            List<PersonInfo> personInfos = new List<PersonInfo>();
            personInfos = _personInfo.GetAllPersonInfo();
            return View(personInfos);
        }
        [HttpPost]
        public Boolean InsertPersonInfo(PersonInfo personInfo)
        {
            bool status = false;
            status=_personInfo.InsertPersonInfoRepo(personInfo);
            return status;
        }
        [HttpPost]
        public Boolean UpdatePersonInfo(PersonInfo personInfo)
        {
            bool status = false;
            status=_personInfo.UpdatePersonInfoRepo(personInfo);
            return status;
        }

        [HttpPost]
        public Boolean DeletePersonInfo(PersonInfo personInfo)
        {
            bool status = false;
            status=_personInfo.DeletePersonInfoRepo(personInfo);
            return status;
        }



        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}