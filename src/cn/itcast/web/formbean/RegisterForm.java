package cn.itcast.web.formbean;

import java.util.HashMap;
import java.util.Map;

public class RegisterForm {
	
	private String username;
	private String password;
	private String password2;
	private Map errors = new HashMap();
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public Map getErrors() {
		return errors;
	}
	public void setErrors(Map errors) {
		this.errors = errors;
	}
	
	//用户名就是邮箱，不能为空，并且要是一个格式合法的邮箱
	//密码不能为空，并且是3-8位数字
	//确认密码不能为空，并且要和一次一致
	public boolean validate(){
		boolean isOK = true;
		
		//电子邮箱不能为空，并且要是一个格式合法的邮箱
		if(this.username==null || this.username.trim().equals("")){
			isOK = false;
			errors.put("username", "用户名不能为空！！");
		}else{
			// aaa@sina.com  aaa@sina.com.cn   aa_bb.cc@sina.com.cn
			//  \\w+@\\w+(\\.\\w+)+
			if(!this.username.matches("\\w+@\\w+(\\.\\w+)+")){
				isOK = false;
				errors.put("username", "邮箱格式不对！！！");
			}
		}
		
		//密码不能为空，并且是3-8位数字
		if(this.password==null || this.password.trim().equals("")){
			isOK = false;
			errors.put("password", "密码不能为空！！");
		}else{
			if(!this.password.matches("\\d{3,8}")){
				isOK = false;
				errors.put("password", "密码必须要是3-8位数字！！");
			}
		}
		
		//确认密码不能为空，并且要和一次一致
		if(this.password2==null || this.password2.trim().equals("")){
			isOK = false;
			errors.put("password2", "确认密码不能为空！！");
		}else{
			if(!this.password.equals(this.password2)){
				isOK = false;
				errors.put("password2", "两次密码要一致！！");
			}
		}
		
		
		return isOK;
	}
	
}
