using System;
using System.Configuration;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for database
/// </summary>
public class Database
{
    protected static readonly int COMMAND_TIMEOUT = 3600;

    protected static string GetDatabaseConnectionString()
    {
        string dbConnectionString = ConfigurationManager.AppSettings["DBConnection"].ToString();
        if (dbConnectionString == null || dbConnectionString.Equals(""))
        {
            throw new Exception("Invalid or Missing Database connection string");
        }
        return dbConnectionString;
    }


    public static SqlConnection GetDatabaseConnection()
    {
        SqlConnection connection = new SqlConnection(GetDatabaseConnectionString());
        return connection;
    }

    public static DataSet RunSP(string spName, ArrayList parameters, ArrayList values)
    {
        SqlConnection conn = GetDatabaseConnection();
        return RunSP(conn, spName, parameters, values, null);
    }

    public static DataSet RunSP(SqlConnection connection, string spName, ArrayList parameters, ArrayList values, SqlTransaction trans)
    {
        if (spName == null || spName.Equals(""))
        {
            throw new Exception("Stored Proceedure name cannot be null or blank");
        }
        if (parameters == null || values == null)
        {
            throw new Exception("List of parameters and values cannot be null");
        }
        if ((parameters.Count != values.Count))
        {
            throw new Exception("Parameter names count does not match parameter values count");
        }

        if (connection.State != ConnectionState.Open)
            connection.Open();
        SqlCommand cmd = connection.CreateCommand();
        cmd.CommandText = spName;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = COMMAND_TIMEOUT;
        cmd.Transaction = trans;
        // parameters
        for (int i = 0; i < parameters.Count; i++)
        {
            if (values[i] == null)
                values[i] = DBNull.Value;
            cmd.Parameters.Add(new SqlParameter(parameters[i].ToString(), values[i]));
        }

        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);

        da.Dispose();
        cmd.Dispose();
        if (trans == null)
            connection.Close();

        return ds;
    }

    public static object RunScalar(string spName, ArrayList parameters, ArrayList values)
    {
        SqlConnection conn = GetDatabaseConnection();
        return RunScalar(conn, spName, parameters, values, null);
    }

    public static object RunScalar(SqlConnection connection, string spName, ArrayList parameters, ArrayList values, SqlTransaction trans)
    {
        if (spName == null || spName.Equals(""))
        {
            throw new Exception("Stored Proceedure name cannot be null or blank");
        }
        if (parameters == null || values == null)
        {
            throw new Exception("List of parameters and values cannot be null");
        }
        if ((parameters.Count != values.Count))
        {
            throw new Exception("Parameter names count does not match parameter values count");
        }

        if (connection.State != ConnectionState.Open)
            connection.Open();
        SqlCommand cmd = connection.CreateCommand();
        cmd.CommandText = spName;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = COMMAND_TIMEOUT;
        cmd.Transaction = trans;
        // parameters
        for (int i = 0; i < parameters.Count; i++)
        {
            if (values[i] == null)
                values[i] = DBNull.Value;
            if (values[i].GetType() == typeof(string))
            {
                cmd.Parameters.Add(new SqlParameter(parameters[i].ToString(), values[i].ToString()));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter(parameters[i].ToString(), values[i]));
            }
        }

        object val = cmd.ExecuteScalar();

        cmd.Dispose();
        if (trans == null)
            connection.Close();

        return val;
    }

    public static DataSet RunSQL(string sqlText, params object[] sqlParams)
    {
        SqlConnection conn = GetDatabaseConnection();
        return RunSQL(conn, null, sqlText, sqlParams);
    }

    public static DataSet RunSQL(SqlConnection connection, SqlTransaction trans, string sqlText, params object[] sqlParams)
    {
        if (sqlText == null || sqlText.Equals(""))
        {
            throw new Exception("SQL name cannot be null or blank");
        }

        if (connection.State != ConnectionState.Open)
            connection.Open();

        SqlCommand cmd = connection.CreateCommand();
        cmd.CommandText = sqlText;
        cmd.CommandType = CommandType.Text;
        cmd.CommandTimeout = COMMAND_TIMEOUT;
        cmd.Transaction = trans;
        // parameters
        for (int i = 0; i < sqlParams.Length; i++)
        {
            if (sqlParams[i] == null)
                sqlParams[i] = DBNull.Value;
            cmd.Parameters.Add(new SqlParameter("?", sqlParams[i]));
        }

        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);

        da.Dispose();
        cmd.Dispose();
        if (trans == null)
            connection.Close();

        return ds;
    }

    public static int RunNonQuery(string spName, ArrayList parameters, ArrayList values)
    {
        SqlConnection conn = Database.GetDatabaseConnection();
        return Database.RunNonQuery(conn, spName, parameters, values, null);
    }

    public static int RunNonQuery(SqlConnection connection, string spName, ArrayList parameters, ArrayList values, SqlTransaction trans)
    {
        if (spName == null || spName.Equals(""))
        {
            throw new Exception("Stored Proceedure name cannot be null or blank");
        }
        if (parameters == null || values == null)
        {
            throw new Exception("List of parameters and values cannot be null");
        }
        if ((parameters.Count != values.Count))
        {
            throw new Exception("Parameter names count does not match parameter values count");
        }

        if (connection.State != ConnectionState.Open)
            connection.Open();
        SqlCommand cmd = connection.CreateCommand();
        cmd.CommandText = spName;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = Database.COMMAND_TIMEOUT;
        cmd.Transaction = trans;
        // parameters
        for (int i = 0; i < parameters.Count; i++)
        {
            if (values[i] == null)
                values[i] = DBNull.Value;
            if (values[i].GetType() == typeof(string))
            {
                cmd.Parameters.Add(new SqlParameter(parameters[i].ToString(), values[i].ToString()));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter(parameters[i].ToString(), values[i]));
            }

        }

        int rows = cmd.ExecuteNonQuery();

        cmd.Dispose();
        if (trans == null)
            connection.Close();
        return rows;
    }
    //ADD SP for Return New DataSet 

    public static DataSet RunNonQuery(SqlConnection connection, string spName, ArrayList parameters, ArrayList values, SqlTransaction trans, string l_ReturnDS)
    {
        if (spName == null || spName.Equals(""))
        {
            throw new Exception("Stored Proceedure name cannot be null or blank");
        }
        if (parameters == null || values == null)
        {
            throw new Exception("List of parameters and values cannot be null");
        }
        if ((parameters.Count != values.Count))
        {
            throw new Exception("Parameter names count does not match parameter values count");
        }

        if (connection.State != ConnectionState.Open)
            connection.Open();
        SqlCommand cmd = connection.CreateCommand();
        cmd.CommandText = spName;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = Database.COMMAND_TIMEOUT;
        cmd.Transaction = trans;
        // parameters
        for (int i = 0; i < parameters.Count; i++)
        {
            if (values[i] == null)
                values[i] = DBNull.Value;
            if (values[i].GetType() == typeof(string))
            {
                cmd.Parameters.Add(new SqlParameter(parameters[i].ToString(), values[i].ToString()));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter(parameters[i].ToString(), values[i]));
            }
        }

        DataSet dsNew = new DataSet();
        DataTable dt = new DataTable();
        SqlDataReader reader = cmd.ExecuteReader();

        dsNew.Tables.Add(dt);
        dsNew.Load(reader, LoadOption.OverwriteChanges, dsNew.Tables[0]);
        cmd.Dispose();
        if (trans == null)
            connection.Close();
        return dsNew;
    }
}