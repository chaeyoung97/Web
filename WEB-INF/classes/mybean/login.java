package mybean;

public class login {
	private String id;
	private String password;
	private String email;
	
	public void setId(String id)
	{
		this.id = id;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public void setEmail(String email)
	{
		this.email =email;
	}
	public String getId()
	{
		return id;
	}
	public String getPassword()
	{
		return password;
	}
	public String getEmail()
	{
		return email;
	}
}
