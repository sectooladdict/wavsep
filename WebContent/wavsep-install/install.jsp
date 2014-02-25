<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.sectooladdict.database.ConnectionPoolManager"%>
<%@page import="com.sectooladdict.constants.DatabaseConstants"%>
<%@page import="org.apache.derby.jdbc.EmbeddedConnectionPoolDataSource40"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WAVSEP DATABASE INSTALLATION</title>
</head>
<body>

<b><u>Prerequisite:</u></b><br>MySQL 5.5.x database must be installed, before proceeding with the WAVSEP installation process.<br>
The installation should be performed according to the following guidelines:<br>
(A) Install a "clean"" database instance.<br>
(B) Install the database for a Developer Machine, and with Multi-language support.<br>
(C) Leave the installation default choices intact <br>
(unless the mysql server is remote, which will require enabling remote root login for the installation process to work).<br>
(D) It's best to install the mysql server in the same host as the wavsep application (only tested locally)<br>

<br>  

<%
if (request.getParameter("username") == null
	&& request.getParameter("password") == null	) {
%>
	<b><u>Installation</u></b><br>
	Provide the username and password of the root database user (mysql):<br>
	<form name="frmInstallation" id="frmInstallation" action="install.jsp" method="POST">
		username: <input type="text" name="username" id="username" value="root"><br>
		password: <input type="password" name="password" id="password"><br>
		host: <input type="text" name="host" id="host" value="localhost"><br>
		port: <input type="text" name="port" id="port" value="3306"><br>
		wavsep_username (<b>optional</b> - set to default if left empty): <input type="text" name="wavsep_username" id="wavsep_username" size="50" value=""><br>
		wavsep_password (<b>optional</b> - set to default if left empty): <input type="text" name="wavsep_password" id="wavsep_password" size="50" value=""><br>
		<input type=submit value="submit">
	</form>
<%
} else {
	int installFlag = 1;
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String host = request.getParameter("host");
	int port = 0;
	String wavsepUsername = request.getParameter("wavsep_username");
	String wavsepPassword = request.getParameter("wavsep_password");
	
	//constant, for now
	String wavsepDB = "wavsepDB";
	
	try {
		port = Integer.parseInt(request.getParameter("port"));
	} catch (Exception e){throw e;}
	
	if(username == null || password == null || host == null || port == 0) {
		installFlag = 0;
	} else if(username.length() == 0 || password.length() == 0 || host.length() == 0 || port <= 0){
		installFlag = 0;
	}
	
	if(wavsepUsername == null || wavsepPassword == null) {
		wavsepUsername = "wavsep";
		wavsepPassword = "wavsepPass782";
	} else if(wavsepUsername.length() == 0 || wavsepUsername.length() == 0 ||
			wavsepPassword.length() >= 50 || wavsepPassword.length() >= 50) {
		wavsepUsername = "wavsep";
		wavsepPassword = "wavsepPass782";
	} else {
		//leave the user's choices of wavsep username & password intact
	}
	
	
	
	//******************************************************
	//** Derby Installation - MySQL Configuration Storage **
	//******************************************************
		
	out.println("<u><b>Installing apache derby DB (configuration storage)</b></u><br>");
		
	try {
		//Initial creation of an apache derby database (configuration storage)
		String databaseName = DatabaseConstants.DERBY_DATABASE_NAME;
		EmbeddedConnectionPoolDataSource40 dataSource = 
				new EmbeddedConnectionPoolDataSource40();
		dataSource.setDatabaseName(databaseName);
		dataSource.setCreateDatabase("create");
		dataSource.setLogWriter(new PrintWriter(System.out));
		dataSource.getConnection();
		
		out.println("Derby Config DB Database Created Successfuly <br>");
		System.out.println("Derby Config DB Database Created Successfuly\n");
	} catch (Exception e) {
		out.println(e.toString());
	}
	
	//Variable Decleration
	Connection conn = null;
	String SqlString = null;
	String SqlString2 = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	
	try {
		conn = ConnectionPoolManager.getDerbyConnection();
		
	 	
	 	//#############################################
		//## Derby MySQLConfiguration Table Creation ##
		//#############################################
		
		try {
			//drop previous table if still exists
			SqlString = "DROP TABLE mysqlconfiguration";
			pstmt = conn.prepareStatement(SqlString);	
		 	pstmt.executeUpdate(); 
	 		out.println("Previous Configuration Table Erased Successfuly <br>");
	 		System.out.println("Previous Configuration Table Erased Successfuly \n");
		} catch(Exception e) {
			//do nothing
		}
		
		//create mysql configuration table in the derby database
		SqlString = 
	          "CREATE TABLE mysqlconfiguration "
	        + "(id INT NOT NULL CONSTRAINT MySQLConfigID_PK PRIMARY KEY, " +
	           "useMysqlFlag INT NOT NULL DEFAULT 0, " + 
	           "host VARCHAR(50) NOT NULL, port INT NOT NULL DEFAULT 0, " +
	           "wavsep_username VARCHAR(50) NOT NULL, wavsep_password VARCHAR(50) NOT NULL)";
		
		pstmt = conn.prepareStatement(SqlString);	
		result = pstmt.executeUpdate();
	 		 
	 	out.println("Derby MySQL-Configuration Table Created Successfuly <br>");
	 	System.out.println("Derby MySQL-Configuration Table Created Successfuly\n");
	 	
	 	//insert the current mysql configuration to the derby mysqlconfiguration table
	 	SqlString2 = 
	          "INSERT INTO mysqlconfiguration "
	        + "(id,useMysqlFlag,host,port,wavsep_username,wavsep_password) " 
	        + "VALUES(1,0,?,?,?,?)";
	 	pstmt = conn.prepareStatement(SqlString2);
	 	pstmt.setString(1, host);
	 	pstmt.setInt(2, port);
	 	pstmt.setString(3, wavsepUsername);
	 	pstmt.setString(4, wavsepPassword);
		result = pstmt.executeUpdate();
	 	
		out.println("Mysql Configuration Generated Successfuly <br>");
	 	System.out.println("Mysql Configuration Generated Successfuly\n");
	 	
		conn.close();
		
		conn = null;
	
	
	//*********************************
	//** MySQL Database Installation **
	//*********************************
	    if (installFlag == 1) {
		
	    	out.println("<u><b>Installing mysql database (WAVSEP data storage)</b></u><br>");
	    	
		    String rootConnectionString =
        	    "jdbc:mysql://" + host + ":" + port +
        	    "/information_schema?user=" + username + "&password=" + password;
		
		    /* Load the MySQL driver */
	        String driver = DatabaseConstants.DATABASE_DRIVER;
            Class.forName(driver).newInstance();
    
            /* Test the MySQL connection */
            conn = DriverManager.getConnection(rootConnectionString);
        
            //#############################
		    //## MySQL Database Creation ##
		    //#############################
		
			try {
				//drop previous mysql database if exists
				SqlString = "drop database IF EXISTS " + wavsepDB;
				pstmt = conn.prepareStatement(SqlString);	
			 	result = pstmt.executeUpdate(); 
		 		out.println("Previous MySQL Database Dropped Successfuly <br>");
		 		System.out.println("Previous MySQL Database Dropped Successfuly \n");
			} catch(Exception e) {
				//do nothing
			}
			
			//create the mysql database
			SqlString = "create database " + wavsepDB;
			
			pstmt = conn.prepareStatement(SqlString);	
			result = pstmt.executeUpdate();
		 		 
		 	out.println("MySQL Database Created Successfuly <br>");
		 	System.out.println("MySQL Database Created Successfuly\n");
			
		 	//close connections in order to switch DB without using the "use" clause
		 	try {
        		conn.close();
		 	} catch(Exception err){}
		 
		 	//reconnect to the wavsep database that was just created
		 	rootConnectionString =
        	    "jdbc:mysql://" + host + ":" + port +
        	    "/" + wavsepDB + 
        	    "?user=" + username + "&password=" + password;
		
		 	/* Load the MySQL driver */
	        driver = DatabaseConstants.DATABASE_DRIVER;
            Class.forName(driver).newInstance();
    
            /* Test the MySQL connection */
            conn = DriverManager.getConnection(rootConnectionString);
			
			//#########################
			//## User Table Creation ##
			//#########################
			
			try {
				//drop previous table if exists
				SqlString = "DROP TABLE IF EXISTS users";
				pstmt = conn.prepareStatement(SqlString);	
			 	result = pstmt.executeUpdate(); 
		 		out.println("Previous User Table Erased Successfully - MySQL <br>");
		 		System.out.println("Previous User Table Erased Successfully - MySQL\n");
			} catch(Exception e) {
				//do nothing
			}
			
			//create user table
			SqlString = 
		          "CREATE TABLE users "
		        + "(userid INT NOT NULL, PRIMARY KEY(userid)," 
		        + "username VARCHAR(25) NOT NULL, "
		        + "password VARCHAR(25) NOT NULL, "
		        + "privilege INT)";
			
			pstmt = conn.prepareStatement(SqlString);	
			result = pstmt.executeUpdate();
		 		 
		 	out.println("User Table Created Successfuly - MySQL<br>");
		 	System.out.println("User Table Created Successfuly - MySQL\n");
		 	
		 	//insert users
		 	SqlString2 = 
		          "INSERT INTO users(userid ,username, password, privilege) "
		 		   + "VALUES(1,'user1','password',1)";
		 	pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO users(userid ,username, password, privilege) "
			 		+ "VALUES(2,'david','goodboy',1)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO users(userid ,username, password, privilege) "
			 		+ "VALUES(3,'admin','mastermold',5)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO users(userid ,username, password, privilege) "
			 		+ "VALUES(4,'user4','password4',1)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO users(userid ,username, password, privilege) "
			 		+ "VALUES(5,'user5','password5',2)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO users(userid ,username, password, privilege) "
			 		+ "VALUES(6,'user6','password6',1)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO users(userid ,username, password, privilege) "
			 		+ "VALUES(7,'user7','password7',1)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
		 	
			out.println("Sample Users Were Generated Successfully <br>");
		 	System.out.println("Sample Users Were Generated Successfully\n");
			
		 	//#############################
			//## Accounts Table Creation ##
			//#############################
			
			try {
				//drop previous accounts table if exists
				SqlString = "DROP TABLE IF EXISTS accounts";
				pstmt = conn.prepareStatement(SqlString);	
			 	result = pstmt.executeUpdate(); 
		 		out.println("Previous Accounts Table Erased Successfully - MySQL <br>");
		 		System.out.println("Previous Accounts Table Erased Successfully - MySQL\n");
			} catch(Exception e) {
				//do nothing
			}
			
		 	
			//create accounts table
			SqlString = 
		          "CREATE TABLE accounts "
		         + "(userid INT NOT NULL, PRIMARY KEY(userid),"  
		         + "account INT NOT NULL)";
			
			pstmt = conn.prepareStatement(SqlString);	
			result = pstmt.executeUpdate();
		 		 
		 	out.println("Accounts Table Created Successfuly - MySQL <br>");
		 	System.out.println("Accounts Table Created Successfuly - MySQL\n");
		 	
		 	//insert accounts
		 	SqlString2 = 
		              "INSERT INTO accounts(userid, account) " 
		            + "VALUES(1,10000)";
		 	pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
		 	SqlString2 = 
			          "INSERT INTO accounts(userid, account) " 
			        + "VALUES(2,12000)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO accounts(userid, account) " 
			        + "VALUES(3,30000)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO accounts(userid, account) " 
			        + "VALUES(4,40000)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO accounts(userid, account) " 
			        + "VALUES(5,50000)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO accounts(userid, account) " 
			        + "VALUES(6,60000)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			          "INSERT INTO accounts(userid, account) " 
			        + "VALUES(7,70000)";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
					 	
			out.println("Accounts Created Successfuly <br>");
		 	System.out.println("Accounts Created Successfuly\n");
		 	
		 	
		 	//#############################
			//## Messages Table Creation ##
			//#############################
			
			try {
				//drop previous table if exists
				SqlString = "DROP TABLE IF EXISTS messages";
				pstmt = conn.prepareStatement(SqlString);	
			 	result = pstmt.executeUpdate(); 
		 		out.println("Previous Messages Table Erased Successfully - MySQL <br>");
		 		System.out.println("Previous Messages Table Erased Successfully - MySQL\n");
			} catch(Exception e) {
				//do nothing
			}
			
			//create messages table
			SqlString = 
		          "CREATE TABLE messages "
		        + "(msgid INT NOT NULL, PRIMARY KEY(msgid), " 
		        + "title VARCHAR(50) NOT NULL, "
		        + "message VARCHAR(50) NOT NULL)";
			
			pstmt = conn.prepareStatement(SqlString);	
			result = pstmt.executeUpdate();
		 		 
		 	out.println("Messages Table Created Successfully - MySQL <br>");
		 	System.out.println("Messages Table Created Successfully - MySQL\n");
		 	
		 	//insert messages
		 	SqlString2 = 
		          "INSERT INTO messages(msgid, title, message) " 
		        + "VALUES(1,'Welcome to the web site','Enjoy yourself')";
		 	pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			      "INSERT INTO messages(msgid, title, message) " 
			    + "VALUES(2,'Remember to change your password','Invest in your security!')";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
			      "INSERT INTO messages(msgid, title, message) " 
			    + "VALUES(3,'Your account is about to expire','Please renew it in the next two weeks')";
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();	
		 	
			out.println("Messages Created Successfully - MySQL <br>");
		 	System.out.println("Messages Orders Created Successfully - MySQL\n");
		 	
		 	
		 	//#################################
			//## Transactions Table Creation ##
			//#################################
			
			try {
				//drop previous transactions table if exists
				SqlString = "DROP TABLE IF EXISTS transactions";
				pstmt = conn.prepareStatement(SqlString);	
			 	result = pstmt.executeUpdate(); 
		 		out.println("Previous Transactions Table Erased Successfully - MySQL <br>");
		 		System.out.println("Previous Transactions Table Erased Successfully - MySQL\n");
			} catch(Exception e) {
				//do nothing
			}
			
		 	
			//create transactions table
			SqlString = 
		          "CREATE TABLE transactions "
		         + "(userid INT NOT NULL, PRIMARY KEY(userid), "  
		         + "transactionId INT NOT NULL, " 
		         + "sum INT NOT NULL, " 
		         + "description VARCHAR(50) NOT NULL, " 
		         + "transactionDate DATE NOT NULL)";
			
			pstmt = conn.prepareStatement(SqlString);	
			result = pstmt.executeUpdate();
		 		 
		 	out.println("Transactions Table Created Successfully - MySQL <br>");
		 	System.out.println("Transactions Table Created Successfully - MySQL\n");
		 	
		 	//insert transactions
		 	SqlString2 = 
		         "INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
		 	   + "VALUES(1,132,1000,'Simple Transaction','2010-01-01')"; 
		 	pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
		 	SqlString2 = 
		 			"INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
		 		  + "VALUES(2,133,1200,'Simple Transaction','2010-01-01')"; 
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
					"INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
				  + "VALUES(3,135,3000,'Simple Transaction','2010-01-01')"; 
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
					"INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
				  + "VALUES(4,223,4000,'Simple Transaction','2010-01-01')"; 
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
					"INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
				  + "VALUES(5,423,5000,'Simple Transaction','2010-01-01')"; 
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
					"INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
				  + "VALUES(6,456,6000,'Simple Transaction','2010-01-01')"; 
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			
			SqlString2 = 
					"INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
				  + "VALUES(7,789,7012,'Expensive Transaction','2010-01-01')"; 
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
			

			SqlString2 = 
					"INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) " 
				  + "VALUES(8,895,8000,'Expensive Transaction','2010-02-02')"; 
			pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
					 	
			out.println("Transactions Created Successfuly <br>");
		 	System.out.println("Transactions Created Successfuly\n");
		 	
		 	
		 	
		 	//#############################################
			//## WAVSEP Dedicated Database User Creation ##
			//#############################################
			
			try {
				//drop previous wavsep database user if exists
				SqlString = "DROP USER '" + wavsepUsername + "'@'" + host + "'"; 
				//since some versions of mysql do not support "if exists" functionality for drop user,
				//this code will often throw an exception
				pstmt = conn.prepareStatement(SqlString);	
			 	result = pstmt.executeUpdate(); 
		 		out.println("Previous Wavsep Database User Erased Successfuly - MySQL <br>");
		 		System.out.println("Previous Wavsep Database User Erased Successfuly - MySQL\n");
			} catch(Exception e) {
				//do nothing
			}

			//create wavsep database user
			SqlString = 
		          "CREATE USER '" + wavsepUsername + "'@'" + host + "' " + 
		          "IDENTIFIED BY '" + wavsepPassword + "';";
			pstmt = conn.prepareStatement(SqlString);	
			result = pstmt.executeUpdate();
		 		 
		 	out.println("Wavsep Database User Account Created Successfuly - MySQL<br>");
		 	System.out.println("Wavsep Database User Account Created Successfuly - MySQL\n");
		 	
		 	//grant privileges to the wavsep user account on the wavsep database
			SqlString = 
		          "GRANT ALL PRIVILEGES ON " + wavsepDB + ".* to '" + wavsepUsername + "'@'" + host + "';";
			pstmt = conn.prepareStatement(SqlString);	
			result = pstmt.executeUpdate();
		 		 
		 	out.println("Permissions Granted to Wavsep Database User Successfuly - MySQL<br>");
		 	System.out.println("Permissions Granted to Wavsep Database User Successfuly - MySQL\n");
		 	
		 	
		 	//***********************************
			//** Installation End - Successful **
			//***********************************		 	
		 	
		 	//close connections in order to use the derby DB again
		 	try {
        		conn.close();
		 	} catch(Exception err){}
		 	
		 	
	 		//***********************************
			//** POST Installation Config Code **
			//***********************************
			
			out.println("<u><b>Updating mysql configuration in derby storage </b></u><br>");
			
			conn = ConnectionPoolManager.getDerbyConnection();
			
	 		//If all was successful - use mysql, and define the usage flag in the derby DB
		
			//delete the previous configuration row instead of update (workaround for a bug in derby)
	 		//insert a new line to the table with useMysqlFlag set 1
			SqlString2 = 
	          	"DELETE FROM mysqlconfiguration "
	        	+ "WHERE id=1";
	 		pstmt = conn.prepareStatement(SqlString2);
			result = pstmt.executeUpdate();
		
			out.println("previous mysqlconfiguration rows deleted <br>");
	 		System.out.println("previous mysqlconfiguration rows deleted\n");
		
	 		//insert the current mysql configuration to the derby mysqlconfiguration table
		 	SqlString2 = 
		          "INSERT INTO mysqlconfiguration "
		        + "(id,useMysqlFlag,host,port,wavsep_username,wavsep_password) " 
		        + "VALUES(?,0,?,?,?,?)";
		 	pstmt = conn.prepareStatement(SqlString2);
		 	pstmt.setInt(1,DatabaseConstants.DERBY_DATABASE_CONFIGURATION_ID);
		 	pstmt.setString(2, host);
		 	pstmt.setInt(3, port);
		 	pstmt.setString(4, wavsepUsername);
		 	pstmt.setString(5, wavsepPassword);
			result = pstmt.executeUpdate();
	 	
			out.println("Mysql configuration rows replaced to reflect a successful installation <br>");
	 		System.out.println("Mysql configuration rows replaced to reflect a successful installation\n");
	 	
	 	}
	 	
		out.flush();
		
		if(conn != null) {
	    	ConnectionPoolManager.closeConnection(conn);
	    }
	} catch (Exception e) {
		if(conn != null) {
			ConnectionPoolManager.closeConnection(conn);
   		}
		
		throw e;
	} //end of try-catch block
	
}
	
%>

</body>
</html>