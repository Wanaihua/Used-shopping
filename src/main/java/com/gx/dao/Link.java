package com.gx.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.gx.domain.Goods;
import com.gx.domain.User;
import com.gx.domain.message;

public class Link {
	public Connection getConnection() {
        Connection conn = null; // 数据库连接
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // 加载数据库驱动，注册到驱动管理器
            // 数据库连接字符串
            String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String username = "root"; // 数据库用户名
            String password = "wanaihua"; // 数据库密码
            // 创建Connection连接
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn; // 返回数据库连接
    }

    /**
     * 分页查询所有商品信息
     * 
     * @param page
     *            页数
     * @return List<Book>
     */
    public List<Goods> find(int page) {
        List<Goods> list = new ArrayList<>(); // 创建List
        Connection conn = getConnection(); // 获取数据库连接
        // 分页查询的SQL语句
        String sql = "select * from goods order by id asc limit ?,? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql); // 获取PreparedStatement
            ps.setInt(1, (page - 1) * Goods.PAGE_SIZE); // 对SQL语句中的第1个参数赋值
            ps.setInt(2, Goods.PAGE_SIZE); // 对SQL语句中的第2个参数赋值
            ResultSet rs = ps.executeQuery(); // 执行查询操作
            while (rs.next()) { // 光标向后移动，并判断是否有效
                Goods b = new Goods(); // 实例化BookBean
                b.setId(rs.getInt("id")); // 对id属性赋值
                b.setNname(rs.getString("nname")); // 对name属性赋值
                b.setPrice(rs.getDouble("price")); // 对price属性赋值
                b.setClassify(rs.getString("classify")); // 对bookCount属性赋值
                b.setDdescribe(rs.getString("ddescribe")); // 对author属性赋值
                b.setUseid(rs.getInt("useid")); // 对author属性赋值
                list.add(b); // 将BookBean添加到List集合中
            }
            rs.close(); // 关闭ResultSet
            ps.close(); // 关闭PreparedStatement
            conn.close(); // 关闭Connection
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<User> findmyself(int id) {
        List<User> list = new ArrayList<>(); // 创建List
        Connection conn = getConnection(); // 获取数据库连接
        // 分页查询的SQL语句
        String sql = "select * from user where id='"+id+"'";
        try {
            PreparedStatement ps = conn.prepareStatement(sql); // 获取PreparedStatement          
            ResultSet rs = ps.executeQuery(); // 执行查询操作
            while (rs.next()) { // 光标向后移动，并判断是否有效
            	User b = new User(); // 实例化BookBean
            	b.setId(rs.getInt("id"));
                b.setNname(rs.getString("nname")); // 对name属性赋值
                b.setUsename(rs.getString("usename"));
                b.setSsex(rs.getString("ssex")); // 对price属性赋值
                b.setPhone(rs.getString("phone")); // 对bookCount属性赋值
                b.setEmail(rs.getString("email")); // 对author属性赋值
                b.setAddress(rs.getString("address")); // 对author属性赋值
				b.setBirthday(rs.getString("birthday"));
                list.add(b); // 将BookBean添加到List集合中
            }
            rs.close(); // 关闭ResultSet
            ps.close(); // 关闭PreparedStatement
            conn.close(); // 关闭Connection
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Goods> findmyshopcar(int id) {
        List<Goods> list = new ArrayList<>(); // 创建List
        Connection conn = getConnection(); // 获取数据库连接
        // 分页查询的SQL语句
        String sql = "select id,nname,classify,price from goods where id in (select goodsid from shopcar where useid='"+id+"')";
        try {
            PreparedStatement ps = conn.prepareStatement(sql); // 获取PreparedStatement          
            ResultSet rs = ps.executeQuery(); // 执行查询操作
            while (rs.next()) { // 光标向后移动，并判断是否有效
            	Goods b = new Goods(); // 实例化BookBean
            	b.setId(rs.getInt("id"));
                b.setNname(rs.getString("nname")); 
                b.setClassify(rs.getString("classify")); 
                b.setPrice(rs.getDouble("price"));
                list.add(b); // 将BookBean添加到List集合中
            }
            rs.close(); // 关闭ResultSet
            ps.close(); // 关闭PreparedStatement
            conn.close(); // 关闭Connection
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Goods> mygoods(int page,int id) {
        List<Goods> list = new ArrayList<>(); // 创建List
        Connection conn = getConnection(); // 获取数据库连接
        // 分页查询的SQL语句
        String sql = "select * from goods where useid='"+id+"' order by id asc limit ?,? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql); // 获取PreparedStatement
            ps.setInt(1, (page - 1) * Goods.PAGE_SIZE); // 对SQL语句中的第1个参数赋值
            ps.setInt(2, Goods.PAGE_SIZE); // 对SQL语句中的第2个参数赋值
            ResultSet rs = ps.executeQuery(); // 执行查询操作
            while (rs.next()) { // 光标向后移动，并判断是否有效
                Goods b = new Goods(); // 实例化BookBean
                b.setId(rs.getInt("id")); // 对id属性赋值
                b.setNname(rs.getString("nname")); // 对name属性赋值
                b.setPrice(rs.getDouble("price")); // 对price属性赋值
                b.setClassify(rs.getString("classify")); // 对bookCount属性赋值
                b.setDdescribe(rs.getString("ddescribe")); // 对author属性赋值
                b.setUseid(rs.getInt("useid")); // 对author属性赋值
                list.add(b); // 将BookBean添加到List集合中
            }
            rs.close(); // 关闭ResultSet
            ps.close(); // 关闭PreparedStatement
            conn.close(); // 关闭Connection
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean Seekgoods(HttpServletRequest request) {
    	Connection conn = getConnection();
    	boolean a=false;
    	String nname=request.getParameter("goodsname");
    	try{
    	String sql = "select * from goods where nname like '"+nname+"'";
    	Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);			
		List<Goods> list = new ArrayList<>();		
		while(rs.next()){								
			Goods g = new Goods();					
			g.setId(rs.getInt("id"));				
			g.setNname(rs.getString("nname"));		
			g.setPrice(rs.getDouble("price"));
			g.setClassify(rs.getString("classify"));	
			g.setDdescribe(rs.getString("ddescribe"));		
			list.add(g); 							
		}
		request.setAttribute("list", list); 			
		rs.close();									
		stmt.close();									
		conn.close();	
		a=true;
	} catch (Exception e) {
		e.printStackTrace();
	}
    	return a;
   }
    
    public List<Goods> findgoods(int page,String name) {
        List<Goods> list = new ArrayList<>();
        Connection conn = getConnection(); 
        String sql = "select * from goods where nname='"+name+"' order by id asc limit ?,?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql); 
            ps.setInt(1, (page - 1) * Goods.PAGE_SIZE);
            ps.setInt(2, Goods.PAGE_SIZE); 
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) { 
                Goods b = new Goods(); 
                b.setId(rs.getInt("id")); 
                b.setNname(rs.getString("nname")); 
                b.setPrice(rs.getDouble("price"));
                b.setClassify(rs.getString("classify"));
                b.setDdescribe(rs.getString("ddescribe")); 
                list.add(b); 
            }
            rs.close(); 
            ps.close();
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<User> findUser(int useid) {
        List<User> list = new ArrayList<>(); 
        Connection conn = getConnection(); 
        String sql = "select * from user where id='"+useid+"'";
        try {
            PreparedStatement ps = conn.prepareStatement(sql); 
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) { 
                User b = new User(); 
                b.setId(rs.getInt("id")); 
                b.setNname(rs.getString("nname")); 
                b.setPhone(rs.getString("phone")); 
                b.setEmail(rs.getString("email")); 
                b.setAddress(rs.getString("address"));
                list.add(b); 
            }
            rs.close(); 
            ps.close(); 
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<User> findUuser(int useid) {
        List<User> list = new ArrayList<>(); 
        Connection conn = getConnection(); 
        String sql = "select * from user where id!='"+useid+"' and judge=0 ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql); 
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) { 
                User b = new User(); 
                b.setId(rs.getInt("id")); 
                b.setNname(rs.getString("nname")); 
                b.setUsename(rs.getString("usename")); 
                b.setPhone(rs.getString("phone")); 
                b.setEmail(rs.getString("email")); 
                b.setAddress(rs.getString("address"));
                list.add(b); 
            }
            rs.close(); 
            ps.close(); 
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 查询总记录数
     * 
     * @return 总记录数
     */
    public int findCount() {
        int count = 0; 
        Connection conn = getConnection(); 
        String sql = "select count(*) from goods"; 
        try {
            Statement stmt = conn.createStatement(); 
            ResultSet rs = stmt.executeQuery(sql); 
            if (rs.next()) { 
                count = rs.getInt(1); 
            }
            rs.close(); 
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public boolean add(HttpServletRequest request) {
    	Connection conn = getConnection(); 
    	boolean a=false;
		String Nname=request.getParameter("nname");
		String Usename=request.getParameter("usename");
		String Password=request.getParameter("password");
		String Ssex=request.getParameter("ssex");
		String Phone=request.getParameter("phone");
		String Email=request.getParameter("email");
		String Address=request.getParameter("address");
    	String sql = "insert into user(nname,usename,password,ssex,phone,email,address) values(?,?,?,?,?,?,?)";
    	try{
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, Nname);
		ps.setString(2, Usename);
		ps.setString(3,Password);
		ps.setString(4,Ssex);
		ps.setString(5, Phone);
		ps.setString(6, Email);
		ps.setString(7,Address);
		int row=ps.executeUpdate();
		if(row>0)
			a=true;
		ps.close();
		conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
    }
    public boolean addshopcar(HttpServletRequest request) {
    	Connection conn = getConnection(); 
    	boolean a=false;
		String id=request.getParameter("id");
		String useid=request.getParameter("uuid");
    	String sql = "insert into shopcar(useid,goodsid) values(?,?)";
    	try{
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, useid);
		ps.setString(2, id);
		int row=ps.executeUpdate();
		if(row>0)
			a=true;
		ps.close();
		conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
    }
    public boolean addgoods(HttpServletRequest request) {
    	Connection conn = getConnection(); 
    	boolean a=false;
    	try{
		String Nname=request.getParameter("nname");
		String Price=request.getParameter("price");
		String Classify=request.getParameter("classify");
		String Describe=request.getParameter("ddescribe");
		String Useid=request.getParameter("id");
		int id=Integer.parseInt(Useid);
    	String sql = "insert into goods(nname,price,classify,ddescribe,useid) values(?,?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, Nname);
		ps.setString(2,Price);
		ps.setString(3,Classify);
		ps.setString(4, Describe);
		ps.setInt(5,id);
		int row=ps.executeUpdate();
		if(row>0)
			a=true;
		ps.close();
		conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
    }
    public boolean login(HttpServletRequest request) {
    	Connection conn = getConnection(); 
    	boolean a=false;
		String Usename=request.getParameter("usename");
		String Password=request.getParameter("password");
    	String sql = "select * from user where usename='"+Usename+"' and password='"+Password+"'";
    	try{
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet row=ps.executeQuery();
		if(row.next())
			a=true;
		ps.close();
		conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
    }
    public int findid(HttpServletRequest request) {
        	Connection conn = getConnection(); 
        	int a = 0;
    		String Usename=request.getParameter("usename");
    		String Password=request.getParameter("password");
        	String sql = "select id from user where usename='"+Usename+"' and password='"+Password+"'";
        	try{
    		PreparedStatement ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next()) {
    			a=rs.getInt("id");
    		}
    		ps.close();
    		conn.close();
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        	return a;
    }
    public int finduseid(HttpServletRequest request) {
    	Connection conn = getConnection(); 
    	int a = 0;
		String Usename=request.getParameter("usename");
		String Password=request.getParameter("password");
    	String sql = "select judge from user where usename='"+Usename+"' and password='"+Password+"'";
    	try{
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			a=rs.getInt("judge");
		}
		ps.close();
		conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
}
    public boolean change(HttpServletRequest request) {
    	Connection conn = getConnection();
    	boolean a=false;
    	String id=request.getParameter("id");
    	String Price=request.getParameter("price");
		String Bookcount=request.getParameter("bookCount");
		try{
			int bookCount=Integer.parseInt(Bookcount);
			double price=Double.parseDouble(Price);
			String sql = "update tb_book set price='"+price+"', bookCount='"+bookCount+"' where id='"+id+"'";
					PreparedStatement ps=conn.prepareStatement(sql);
			int row=ps.executeUpdate();
			if(row>0)
				a=true;
			ps.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
        	return a;
    }
    public boolean changeAll(HttpServletRequest request) {
    	Connection conn = getConnection();
    	boolean a=false;
    	String Id=request.getParameter("id");
    	String Nname=request.getParameter("nname");
    	String Usename=request.getParameter("usename");
		String Ssex=request.getParameter("ssex");
		String Phone=request.getParameter("phone");
		String Email=request.getParameter("email");
		String Address=request.getParameter("address");
		try{
			String sql = "update user set nname='"+Nname+"', usename='"+Usename+"',ssex='"+Ssex+"',phone='"+Phone+"',email='"+Email+"',address='"+Address+"' where id='"+Id+"'";
			PreparedStatement ps=conn.prepareStatement(sql);
			int row=ps.executeUpdate();
			if(row>0)
				a=true;
			ps.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
        	return a;
    }
    public boolean update(HttpServletRequest request) {
    	Connection conn = getConnection();
    	boolean a=false;
    	int id = Integer.valueOf(request.getParameter("id"));
		int bookCount = Integer.valueOf(request.getParameter("price"));
		try{
			String sql = "update goods set price=? where id=?";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setInt(1, bookCount);
					ps.setInt(2, id);
			int row=ps.executeUpdate();
			if(row>0)
				a=true;
			ps.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
        	return a;
    }
    public boolean updatename(HttpServletRequest request) {
    	Connection conn = getConnection();
    	boolean a=false;
    	int id = Integer.valueOf(request.getParameter("id"));
		String nname = request.getParameter("nname");
		try{
			String sql = "update user set nname='"+nname+"' where id='"+id+"'";
			PreparedStatement ps=conn.prepareStatement(sql);
			int row=ps.executeUpdate();
			if(row>0)
				a=true;
			ps.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
        	return a;
    }
    public boolean delete(HttpServletRequest request) {
    	Connection conn = getConnection();
    	boolean a=false;
    	int id = Integer.valueOf(request.getParameter("id"));
    	try{
    	String sql = "delete from goods where id='"+id+"'";
    		PreparedStatement ps=conn.prepareStatement(sql);
    		int row=ps.executeUpdate();
    		if(row>0)
    			a=true;
    		ps.close();
    		conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
    }
    public boolean deleteshopcar(HttpServletRequest request) {
    	Connection conn = getConnection();
    	boolean a=false;
    	try{
    		int id = Integer.valueOf(request.getParameter("id"));
    		int goodsid = Integer.valueOf(request.getParameter("goodsid"));
    	String sql = "delete from shopcar where useid='"+id+"' and goodsid='"+goodsid+"'";
    		PreparedStatement ps=conn.prepareStatement(sql);
    		int row=ps.executeUpdate();
    		if(row>0)
    			a=true;
    		ps.close();
    		conn.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
    }

    public List<User> findUserMessage(int toId,HttpServletRequest request) {
		List<User> list = new ArrayList<>();
		Connection conn=getConnection();
		try {
			String sql="select * from user where id in (select FromId from message where ToId='"+toId+"' )";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while (rs.next()){
				User b=new User();
				b.setId(rs.getInt("id"));
				b.setNname(rs.getString("nname"));
				list.add(b);
			}
			rs.close();
			ps.close();
			conn.close();
		}catch (Exception e){
			e.printStackTrace();
		}
		request.setAttribute("ToId",toId);
		return list;
    }
}
