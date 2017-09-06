package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	private static String url="jdbc:mysql://localhost:3306/youplus?zeroDateTimeBehavior=convertToNull";
	private static String uname="root";
	private static String password="faeem";
	private static final DbConnection instance = new DbConnection();
    private Connection con;
    private DbConnection(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection(url,uname,password);
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    }

    public static Connection getInstance(){
        return instance.con;
    }
}