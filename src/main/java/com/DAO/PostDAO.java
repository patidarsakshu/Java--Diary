package com.DAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.User.Post;

public class PostDAO {

	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}

public  boolean AddNotes(String title,String content,int uid)
{
	boolean f=false;
	try {
		
		String query="insert into post(title,content,uid) values(?,?,?)";
	    PreparedStatement ps=conn.prepareStatement(query);
	    ps.setString(1,title);
	    ps.setString(2,content);
	    ps.setInt(3, uid);
	    
	    int i=ps.executeUpdate();
	    if(i==1)
	    {
	    	f=true;
	    }
	    
	}
	catch(Exception e)
	{
		  e.printStackTrace();
	}
	
	return f;
}

public List<Post> getData(int id)
{
	List<Post> list=new ArrayList<Post>();
	Post po=null;
	try {
		String q="select * from post where uid=? order by id DESC";
		PreparedStatement ps=conn.prepareStatement(q);
	    ps.setInt(1, id);
	    
	    ResultSet rs=ps.executeQuery();   //Jaise hi yeh line execute hoti hai, database se query execute hoti hai aur 
                                         // resultset mein rows aa jate hain jo query ke criteria ko satisfy karte hain.
	    while(rs.next())
	    {   po=new Post();  //Yeh code ek Post object banata hai, jismein database se retrieve ki gayi data ko store kiya jata hai.
	    	
	    
	        po.setId(rs.getInt(1));    //rs.getInt(1) abhi current row se database 
	                                    //mein pehle column ki value ko retrieve karta hai.Yeh value Post object po ke id attribute mein set ki jati hai.
	        
	        po.setTitle(rs.getString(2));   //current row se database mein doosre column ki value ko retrieve karta hai.
	                                      //  Yeh value Post object po ke title attribute mein set ki jati hai.
	        po.setContent(rs.getString(3));
	        
	        
	        po.setUdate(rs.getTimestamp(4));
	        list.add(po);
	    }
	    
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return list;
}
public  Post getDataById(int noteId)
{
	Post p=null;
	try {
		String qu="select * from post where id=?";
		PreparedStatement ps=conn.prepareStatement(qu);
	    ps.setInt(1, noteId);
	    
	    ResultSet rs=ps.executeQuery();
	    if(rs.next())
	    {   p=new Post();
	    	p.setId(rs.getInt(1));
	        p.setTitle(rs.getString(2));
	        p.setContent(rs.getString(3));
	     
	    }
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return p;
}
public boolean PostUpdate(int nid,String ntitle,String ncontent)
{
	boolean f=false;
	try {
		String qu="update post set title=?, content=? where id=?";
		PreparedStatement ps=conn.prepareStatement(qu);
	    ps.setString(1, ntitle);
	    ps.setString(2, ncontent);
		ps.setInt(3, nid);
	   int k=ps.executeUpdate();
	   if(k==1)
	   {
		   f=true;
	   }
	   
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return f;
}
public boolean DeleteNotes(int nid)
{
	boolean f=false;
	try {
		String qu="delete from post  where id=?";
		PreparedStatement ps=conn.prepareStatement(qu);
		ps.setInt(1, nid);
		 int k=ps.executeUpdate();
		   if(k==1)
		   {
			   f=true;
		   }
		   
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return f;
}
}
