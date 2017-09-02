package com.dao;

import java.sql.*;

public class ValidateDriver {
	public boolean validate(int id, String pass){
		String query = "select id, password from drivers where id=? and password=?";
		String url="jdbc:mysql://localhost:3306/youplus?zeroDateTimeBehavior=convertToNull";
		String uname="root";
		String password="faeem";
		try{
			Class.forName("com.mysql.jdbc.Driver"); 			
			Connection con = DriverManager.getConnection(url,uname,password);
			PreparedStatement st = con.prepareStatement(query);	
			st.setInt(1, id);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.next()){
				//Logic for updating waiting, completed and ongoing requests for this DID
				return true;
			}
			st.close();
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
}
