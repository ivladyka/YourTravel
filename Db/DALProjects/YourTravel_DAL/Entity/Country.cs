
// Generated by MyGeneration Version # (1.3.0.3)

using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using VikkiSoft_BLL.DAL;

namespace VikkiSoft_BLL
{
	public class Country : _Country
	{
		public Country()
		{
		
		}

        public virtual bool LoadWithCapital()
        {
            return base.LoadFromSql("[" + this.SchemaStoredProcedure + "usp_Country_LoadWithCapital]");
        }

        public virtual bool LoadDetailInfo(int countryID)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@CountryID", SqlDbType.Int), countryID);

            return base.LoadFromSql("[" + this.SchemaStoredProcedure + "usp_Country_LoadDetailInfo]", parameters);
        }
	}
}
