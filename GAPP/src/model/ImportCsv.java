package model;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import com.opencsv.CSVReader;

public class ImportCsv
{
	public static void main(String[] args)
	{
			readCsv();
			readCsvUsingLoad();
	}

	private static void readCsv()
	{

		try (CSVReader reader = new CSVReader(new FileReader("upload.csv"), ','); 
                     Connection connection = DBConnection.getConnection();)
		{
				String insertQuery = "Insert into user (id_user,pseudo,first_name,last_name,birth_date,is_admin,id_admin,is_responsible,id_responsible,is_tutor,id_tutor,is_student,id_student,password) values (null,?,?,?,?,?,null,?,null,?,null,?,null,?)";
				PreparedStatement pstmt = connection.prepareStatement(insertQuery);
				String[] rowData = null;
				int i = 0;
				while((rowData = reader.readNext()) != null)
				{
					for (String data : rowData)
					{
							pstmt.setString((i % 9) + 1, data);

							if (++i % 9 == 0)
									pstmt.addBatch();// add batch

							if (i % 90 == 0)// insert when the batch size is 10
									pstmt.executeBatch();
					}
				}
				System.out.println("Data Successfully Uploaded");
		}
		catch (Exception e)
		{
				e.printStackTrace();
		}

	}

	private static void readCsvUsingLoad()
	{
		try (Connection connection = DBConnection.getConnection())
		{

				String loadQuery = "LOAD DATA LOCAL INFILE '" + "C:\\upload.csv" + "' INTO TABLE user FIELDS TERMINATED BY ','" + " LINES TERMINATED BY '\n' (pseudo,first_name,last_name,birth_date,is_admin,is_responsible,is_tutor,is_student,password) ";
				System.out.println(loadQuery);
				Statement stmt = connection.createStatement();
				stmt.execute(loadQuery);
		}
		catch (Exception e)
		{
				e.printStackTrace();
		}
	}

}
