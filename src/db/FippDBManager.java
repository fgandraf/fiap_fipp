package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FippDBManager {

    public static Connection obterConexao()
    {

        Connection conexao = null;

        try{

            conexao = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "fiap123");

        }catch(SQLException e){

            System.err.println(e.getMessage());
            e.printStackTrace();

        }

        return conexao;

    }

}