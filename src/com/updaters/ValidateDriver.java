package com.updaters;

import java.sql.*;

import com.dao.DbConnection;

public class ValidateDriver {
	public boolean validate(int id, String pass){
		String query = "select id, password from drivers where id=? and password=?";
		Connection con = DbConnection.getInstance();
		try{
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
