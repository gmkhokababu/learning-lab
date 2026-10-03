package DA;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.CustomerLogin;
import model.User;

public class CustomerLoginDA extends MysqlConnection{


	List<CustomerLogin> allCustomer = new ArrayList<>();
	public List<CustomerLogin> getAllCustomerLogin() {
		String allCustomerLoginStatement = "select * from customer_login";
		try {
			
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(allCustomerLoginStatement);

		rs = ps.executeQuery();
		
		while(rs.next()) {
			allCustomer.add(new CustomerLogin(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
		}

		ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
		return allCustomer;
	}
	
	
	public CustomerLogin customerSigninById(int customer_id) {
		CustomerLogin s = new CustomerLogin();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement("select * from customer_login where customer_id=" + customer_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new CustomerLogin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}
	
public CustomerLogin register(CustomerLogin a) {
		
		String registerStatement = "insert into	customer_login(customer_id, customer_name, customer_email, customer_pass) values(?,?,?,?)";
		try {
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(registerStatement);
			ps.setInt(1, a.getCustomer_id());
			ps.setString(2, a.getCustomer_name());
			ps.setString(3, a.getCustomer_email());
			ps.setString(4, a.getCustomer_pass());
			
			ps.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return a;
	}

public CustomerLogin login(int id, String password) {
	CustomerLogin e =null;
	try {
		
		String registerStatement = "select * from customer_login where customer_id=? AND customer_pass=?";
		con = DriverManager.getConnection(url,user,pass);
		ps = con.prepareStatement(registerStatement);
		ps.setInt(1, id);
		ps.setString(2, password);
		rs = ps.executeQuery();
		while(rs.next()) {
			e = new CustomerLogin(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
		}
		
		
//		PreparedStatement pst1 = con.prepareStatement("select * from employee where emp_id=? AND emp_password=?");
//		pst1.setInt(1, id);
//		pst1.setString(2, password);
//		ResultSet rs = pst1.executeQuery();
//		while (rs.next()) {
//			e=new Employee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
//		}

	} catch (Exception ex) {
		// TODO: handle exception
	}

	return e;
}
	
	
	
	
}
