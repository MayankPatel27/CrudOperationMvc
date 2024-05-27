using Antlr.Runtime.Tree;
using CrudOperationMvc.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Runtime.InteropServices;

namespace CrudOperationMvc.Repository
{
    public class PersonRepository : IPersonRepository
    {

        public List<PersonInfo> GetAllPersonInfo()
        {
            DataTable dtProductDetails = new DataTable();
            try
            {
                DbConnnection con = new DbConnnection();
                SqlParameter[] para = new SqlParameter[]
                {

                };
                dtProductDetails = con.GetDataTable("GetAllPersonDetails", para);
                List<PersonInfo> PersonInfoList = new List<PersonInfo>();
                foreach (DataRow row in dtProductDetails.Rows)
                {
                    PersonInfo personInfo = new PersonInfo();
                    {
                        personInfo.Id=Convert.ToInt32(row["Id"]);
                        personInfo.Name=row["Name"].ToString();
                        personInfo.Email=row["Email"].ToString();
                        personInfo.Phone=row["Phone"].ToString();
                        personInfo.Address=row["Address"].ToString();
                        personInfo.City =row["City"].ToString();
                        personInfo.State =row["State"].ToString();
                        personInfo.Agree=Convert.ToBoolean(row["Agree"]);
                    };
                    PersonInfoList.Add(personInfo);
                }
                return PersonInfoList;


            }
            catch (Exception ex)
            {
                return null;
            }

        }
        public bool InsertPersonInfoRepo(PersonInfo _personInfo)
        {
            bool isSuccess = false;
            DataTable dtProductDetails = new DataTable();
            try
            {

                DbConnnection con = new DbConnnection();
                SqlParameter[] para = new SqlParameter[]
                {
                    new SqlParameter("@Name", (_personInfo.Name)),
                    new SqlParameter("@Email", (_personInfo.Email)),
                    new SqlParameter("@Phone", (_personInfo.Phone)),
                    new SqlParameter("@Address", Convert.ToString(_personInfo.Address)),
                    new SqlParameter("@State", (_personInfo.State)),
                    new SqlParameter("@City", (_personInfo.City)),
                    new SqlParameter("@Agree", (_personInfo.Agree)),

                };
                dtProductDetails = con.GetDataTable("AddPersonInfo", para);
                if (dtProductDetails.Rows.Count>0)
                {
                    return true;

                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public bool UpdatePersonInfoRepo(PersonInfo _personInfo)
        {
            bool isSuccess = false;
            DataTable dtProductDetails = new DataTable();
            try
            {
                DbConnnection con = new DbConnnection();
                SqlParameter[] para = new SqlParameter[]
                {
                    new SqlParameter("@Id", (_personInfo.Id)),
                    new SqlParameter("@Name", (_personInfo.Name)),
                    new SqlParameter("@Email", (_personInfo.Email)),
                    new SqlParameter("@Phone", (_personInfo.Phone)),
                    new SqlParameter("@Address", (_personInfo.Address)),
                    new SqlParameter("@State", (_personInfo.State)),
                    new SqlParameter("@City", (_personInfo.City)),


                };
                dtProductDetails = con.GetDataTable("UpdatePersonInfo", para);
                if (dtProductDetails.Rows.Count>0)
                {
                    return true;

                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public bool DeletePersonInfoRepo(PersonInfo _personInfo)
        {
            bool isSuccess = false;
            DataTable dtProductDetails = new DataTable();
            try
            {
                DbConnnection con = new DbConnnection();
                SqlParameter[] para = new SqlParameter[]
                {
                    new SqlParameter("@Id", (_personInfo.Id)),
                   

                };
                dtProductDetails = con.GetDataTable("DeletePersonInfo", para);
                if (dtProductDetails.Rows.Count>0)
                {
                    return false;

                }
                else
                {
                    return true;
                }


            }
            catch (Exception ex)
            {
                return false;
            }
        }





    }
}