using System;
using System.Data.SqlClient;

namespace ConsoleAppADOReader
{
    internal class Program
    {
        static SqlConnection con;
        static SqlCommand cmd;
        static SqlDataReader reader;
        static string conStr = "server=DESKTOP-PE7BHIE;database=OurDB; trusted_connection = true;";
        static void Main(string[] args)
        {
            try
            {
                con = new SqlConnection(conStr);
                cmd = new SqlCommand("select * from Employees", con);
                con.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine("ID" + reader["ID"]);
                    Console.WriteLine("FirstName" + reader["firstname"]);
                    Console.WriteLine("LastName" + reader["Lastname"]);
                    Console.WriteLine("Manager ID " + reader["ManagerID"]);
                    Console.WriteLine("---------------------------------------------------");
                }
            }
            catch (Exception ex) { Console.WriteLine("Error!!!" + ex.Message); }
            finally
            {
                con.Close();
                Console.ReadKey();

            }

        }
    }
}