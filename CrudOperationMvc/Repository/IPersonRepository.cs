using CrudOperationMvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls.WebParts;

namespace CrudOperationMvc.Repository
{
    public interface IPersonRepository
    {
        List<PersonInfo> GetAllPersonInfo();

        bool InsertPersonInfoRepo(PersonInfo _personInfo);
        bool DeletePersonInfoRepo(PersonInfo _personInfo);
        bool UpdatePersonInfoRepo(PersonInfo _personInfo);
    }
}
