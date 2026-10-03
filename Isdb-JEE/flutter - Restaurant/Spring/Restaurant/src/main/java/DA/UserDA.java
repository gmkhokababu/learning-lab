package DA;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.TableInfo;
import model.User;

public class UserDA extends MysqlConnection{
	
	
	List<User> allUser = new ArrayList<>();
	public List<User> getAllUser() {
		String allUserStatement = "select * from user";
		try {
			
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(allUserStatement);

		rs = ps.executeQuery();
		
		while(rs.next()) {
			allUser.add(new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
		}

		ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
		return allUser;
	}
	
	
	public User userSigninById(int admin_id) {
		User s = new User();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement("select * from user where admin_id=" + admin_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}
	
	
	
	
	public User register(User a) {
		
		String registerStatement = "insert into	user(admin_id, admin_name, admin_email, admin_pass) values(?,?,?,?)";
		try {
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(registerStatement);
			ps.setInt(1, a.getAdmin_id());
			ps.setString(2, a.getAdmin_name());
			ps.setString(3, a.getAdmin_email());
			ps.setString(4, a.getAdmin_pass());
			
			ps.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return a;
	}
	
	
	
	
	public User login(int id, String password) {
		User e =null;
		try {
			
			String registerStatement = "select * from user where admin_id=? AND admin_pass=?";
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(registerStatement);
			ps.setInt(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while(rs.next()) {
				e = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}
			
			
//			PreparedStatement pst1 = con.prepareStatement("select * from employee where emp_id=? AND emp_password=?");
//			pst1.setInt(1, id);
//			pst1.setString(2, password);
//			ResultSet rs = pst1.executeQuery();
//			while (rs.next()) {
//				e=new Employee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
//			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}
		
}
