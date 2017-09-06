package com.updaters;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import com.dao.DbConnection;
import com.data.Request;

public class RequestUpdater {
	ArrayList<Vector<Request>> res = new ArrayList<Vector<Request>>();
	Vector<Request> tempvect;
	Request tempreq;
	String q1="use youplus;";
	String q2="SET GLOBAL event_scheduler = ON;";
	String evnt;
	String getall = "select * from youplus.cabrequests;"; 
	String addreq = "insert into CabRequests(cid,Lx,Ly) values(?,?,?);";
	String waitingCount = "select count(*) from youplus.cabrequests where state like \"waiting\";";
	String driverReqs = "select count(*) from youplus.cabrequests where did = ? and state=\"Ongoing\";";
	String stateUpdate = "update youplus.cabrequests set did=?, state=\"Ongoing\", start_time=now() where id=?;";
	String req = "SELECT * from youplus.cabrequests where id=?";
	String wait = "select *, sqrt((lx-?)*(lx-?)+(ly-?)*(ly-?)) as distance from youplus.cabrequests  where state like \"waiting\" order by distance asc limit 3;";
	String ongoing = "SELECT * FROM youplus.cabrequests where state like \"ongoing\" and did=?;";
	String complete = "SELECT * FROM youplus.cabrequests where state like \"complete\" and did =?;";
	String driver = "select * from youplus.drivers where id=?;";
	public boolean addRequest(int cid, int lx, int ly) throws SQLException{
		Connection con = DbConnection.getInstance();
		ResultSet rs;
		PreparedStatement st = con.prepareStatement(waitingCount);
		rs=st.executeQuery();
		if(rs.next()){
			if(rs.getInt(1)>=10){
				return false;
			}
			else{
				st = con.prepareStatement(addreq);
				st.setInt(1, cid);
				st.setInt(2, lx);
				st.setInt(3, ly);
				st.executeUpdate();
				st.close();
				return true;
			}
		}		
		return true;
	}
	public boolean updateState(int id, int did){
		Connection con = DbConnection.getInstance();
		ResultSet rs;
		try{
			PreparedStatement st = con.prepareStatement(driverReqs);	
			st.setInt(1, did);
			rs=st.executeQuery();
			if(rs.next()){
				if(rs.getInt(1)>=1){
					return false;
				}
				else{
					st = con.prepareStatement(stateUpdate);
					st.setInt(1, did);
					st.setInt(2, id);
					st.executeUpdate();
					st = con.prepareStatement(q1);
					st.executeQuery();
					st = con.prepareStatement(q2);
					st.executeQuery();
					evnt = "CREATE EVENT setComplete_"+did + " ON SCHEDULE AT now()+ interval 5 minute DO UPDATE youplus.cabrequests set state=\"Complete\" where id="+id+";";
					st = con.prepareStatement(evnt);
					st.execute();
					st.close();
					return true;
				}
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<Vector<Request>> updateRequests(int did){		
		int lx,ly;
		Vector<Request> tempvect = new Vector<Request>();
		Connection con = DbConnection.getInstance();
		try{
			PreparedStatement st = con.prepareStatement(driver);
			st.setInt(1, did);
			ResultSet rs=st.executeQuery();
			if(rs.next()){
				lx=rs.getInt("location_x");
				ly=rs.getInt("location_y");
				st = con.prepareStatement(wait);
				st.setInt(1, lx);
				st.setInt(2, lx);
				st.setInt(3, ly);
				st.setInt(4, ly);
			}
			
			rs = st.executeQuery();
			while(rs.next()){
				tempreq = new Request();
				tempreq.setRid(rs.getInt("id"));
				tempreq.setCid(rs.getInt("cid"));
				tempreq.setDid(rs.getInt("did"));
				tempreq.setLocation_x(rs.getInt("lx"));
				tempreq.setLocation_y(rs.getInt("ly"));
				tempreq.setRequest_time(rs.getTime("request_time"));
				tempreq.setStart_time(rs.getTime("start_time"));
				tempreq.setStatus(rs.getString("state"));
				tempvect.add(tempreq);
			}
			res.add(tempvect);
			st = con.prepareStatement(ongoing);	
			st.setInt(1, did);
			rs = st.executeQuery();
			tempvect = new Vector<Request>();
			while(rs.next()){
				tempreq = new Request();
				tempreq.setRid(rs.getInt("id"));
				tempreq.setCid(rs.getInt("cid"));
				tempreq.setDid(rs.getInt("did"));
				tempreq.setLocation_x(rs.getInt("lx"));
				tempreq.setLocation_y(rs.getInt("ly"));
				tempreq.setRequest_time(rs.getTime("request_time"));
				tempreq.setStart_time(rs.getTime("start_time"));
				tempreq.setStatus(rs.getString("state"));
				tempvect.add(tempreq);
			}
			res.add(tempvect);
			st = con.prepareStatement(complete);	
			st.setInt(1, did);
			rs = st.executeQuery();
			tempvect = new Vector<Request>();
			while(rs.next()){
				tempreq = new Request();
				tempreq.setRid(rs.getInt("id"));
				tempreq.setCid(rs.getInt("cid"));
				tempreq.setDid(rs.getInt("did"));
				tempreq.setLocation_x(rs.getInt("lx"));
				tempreq.setLocation_y(rs.getInt("ly"));
				tempreq.setRequest_time(rs.getTime("request_time"));
				tempreq.setStart_time(rs.getTime("start_time"));
				tempreq.setStatus(rs.getString("state"));
				tempvect.add(tempreq);
			}
			res.add(tempvect);
			st.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}
	public Vector<Request> updateAll(){
		Vector<Request> res=new Vector<Request>();
		Request tempreq;
		Connection con = DbConnection.getInstance();
		try{
			ResultSet rs;
			PreparedStatement st = con.prepareStatement(getall);	
			rs=st.executeQuery();
			while(rs.next()){
				tempreq = new Request();
				tempreq.setRid(rs.getInt("id"));
				tempreq.setCid(rs.getInt("cid"));
				tempreq.setDid(rs.getInt("did"));
				tempreq.setLocation_x(rs.getInt("lx"));
				tempreq.setLocation_y(rs.getInt("ly"));
				tempreq.setRequest_time(rs.getTime("request_time"));
				tempreq.setStart_time(rs.getTime("start_time"));
				tempreq.setStatus(rs.getString("state"));
				res.add(tempreq);
			}
			st.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return res;
	}
}
