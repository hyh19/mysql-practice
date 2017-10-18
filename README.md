# MySQL Practice

[MySQL Documentation](https://dev.mysql.com/doc/)

MySQL Reference Manual ([5.6](https://dev.mysql.com/doc/refman/5.6/en/), [5.7](https://dev.mysql.com/doc/refman/5.7/en/))

## Indexes ([5.6](https://dev.mysql.com/doc/refman/5.6/en/indexes.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/indexes.html))

## Example Databases

### [Employees Sample Database](https://dev.mysql.com/doc/employee/en/)

https://github.com/datacharmer/test_db

```bash
shell< mysql < employees.sql
```

[Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/)

---

## Chapter 2 Installing and Upgrading MySQL ([5.6](https://dev.mysql.com/doc/refman/5.6/en/installing.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/installing.html))

### 2.5 Installing MySQL on Linux ([5.6](https://dev.mysql.com/doc/refman/5.6/en/linux-installation.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/linux-installation.html))

#### 2.5.1 Installing MySQL on Linux Using the MySQL Yum Repository ([5.6](https://dev.mysql.com/doc/refman/5.6/en/linux-installation-yum-repo.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html))

[Download MySQL Yum Repository](https://dev.mysql.com/downloads/repo/yum/)

[A Quick Guide to Using the MySQL Yum Repository](https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/)

[install-mysql-server-56-yum-centos69.sh](https://gist.github.com/mrhuangyuhui/00b61205dd36cb6c27d63742f29adc4d#file-install-mysql-server-56-yum-centos69-sh)
    
[install-mysql-server-56-yum-centos73.sh](https://gist.github.com/mrhuangyuhui/00b61205dd36cb6c27d63742f29adc4d#file-install-mysql-server-56-yum-centos73-sh)

[install-mysql-server-57-yum-centos69.sh](https://gist.github.com/mrhuangyuhui/00b61205dd36cb6c27d63742f29adc4d#file-install-mysql-server-57-yum-centos69-sh)
    
[install-mysql-server-57-yum-centos73.sh](https://gist.github.com/mrhuangyuhui/00b61205dd36cb6c27d63742f29adc4d#file-install-mysql-server-57-yum-centos73-sh)

```bash
## CentOS 6.9/7.3 ##

shell> curl -L url | sh
# Check whether the data directory is initialiazed
shell> ls -al /var/lib/mysql
```

#### 2.5.3 Installing MySQL on Linux Using the MySQL APT Repository ([5.6](https://dev.mysql.com/doc/refman/5.6/en/linux-installation-apt-repo.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-apt-repo.html))

[Download MySQL APT Repository](https://dev.mysql.com/downloads/repo/apt/)

[A Quick Guide to Using the MySQL APT Repository](https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/)

```bash
## Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
shell> wget https://repo.mysql.com//mysql-apt-config_0.8.7-1_all.deb
shell> sudo dpkg -i mysql-apt-config_0.8.7-1_all.deb

## Configuring mysql-apt-config ##
# Ubuntu 16.04/17.04 only has MySQL >=5.7

shell> sudo apt-get update
shell> sudo apt-get install -y mysql-server

## Configuring mysql-community-server ##

## Switch to another supported major release series at any time ##
shell> sudo dpkg-reconfigure mysql-apt-config
shell> sudo apt-get update
```

### 2.10 Postinstallation Setup and Testing ([5.6](https://dev.mysql.com/doc/refman/5.6/en/postinstallation.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/postinstallation.html))

#### 2.10.1 Initializing the Data Directory ([5.6](https://dev.mysql.com/doc/refman/5.6/en/data-directory-initialization.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization.html))

##### MySQL 5.6

---

```bash
## CentOS 6.9/7.3 ##
shell> mysql_install_db --user=mysql

# Check whether the data directory is initialiazed.
shell> ls -al /var/lib/mysql
```

[`mysql_install_db`](https://dev.mysql.com/doc/refman/5.6/en/mysql-install-db.html) — Initialize MySQL Data Directory 

##### MySQL 5.7

---

###### [2.10.1.1 Initializing the Data Directory Manually Using mysqld](https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization-mysqld.html)

```bash
## CentOS 6.9/7.3 ##
shell> mysqld --initialize-insecure --user=mysql

# Check whether the data directory is initialiazed.
shell> ls -al /var/lib/mysql
```

###### [2.10.1.2 Initializing the Data Directory Manually Using mysql_install_db](https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization-mysql-install-db.html)

#### 2.10.2 Starting the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/starting-server.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/starting-server.html))

Start the server
```bash
## CentOS 6.9, Ubuntu 14.04, Debian 7.11/8.9(MySQL 5.6)/9.1(MySQL 5.6) ##
shell> mysqld_safe --user=mysql &

## CentOS 6.9, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
shell> service mysql start

## CentOS 7.3 ##
shell> systemctl start mysqld

## Ubuntu 16.04/17.04, Debian 8.9/9.1 ##
shell> systemctl start mysql
```

Shut down the server
```bash
## CentOS 6.9, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
shell> mysqladmin -u root shutdown

## CentOS 6.9, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
shell> service mysql stop

## CentOS 7.3 ##
shell> systemctl stop mysqld

## Ubuntu 16.04/17.04, Debian 8.9/9.1 ##
shell> systemctl stop mysql
```

`mysqld_safe` — MySQL Server Startup Script ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld-safe.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqld-safe.html))

#### 2.10.3 Testing the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/testing-server.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/testing-server.html))

Simple tests to check whether the server is up and responding to connections
```bash
## CentOS 6.9/7.3, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
shell> mysqladmin version
shell> mysqladmin variables
```

Verify that you can retrieve information from the server
```bash
## CentOS 6.9/7.3, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
shell> mysqlshow
shell> mysqlshow mysql
shell> mysql -e "SELECT User, Host, plugin FROM mysql.user" mysql
```

#### 2.10.4 Securing the Initial MySQL Accounts ([5.6](https://dev.mysql.com/doc/refman/5.6/en/default-privileges.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/default-privileges.html))

```bash
## CentOS 6.9/7.3, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
shell> mysql_secure_installation
```

`mysql_secure_installation` — Improve MySQL Installation Security ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-secure-installation.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysql-secure-installation.html))

---

## Chapter 3 Tutorial ([5.6](https://dev.mysql.com/doc/refman/5.6/en/tutorial.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/tutorial.html))

### 3.1 Connecting to and Disconnecting from the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/connecting-disconnecting.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/connecting-disconnecting.html))

```bash
shell> mysql -h host -u user -p
```

If you are logging in on the same machine that MySQL is running on, you can omit the host, and simply use the following:
```bash
shell> mysql -u user -p
```

After you have connected successfully, you can disconnect any time by typing QUIT (or \q) at the mysql> prompt:
```bash
mysql> QUIT
```

### 3.4 Getting Information About Databases and Tables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/getting-information.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/getting-information.html))

You have previously seen SHOW DATABASES, which lists the databases managed by the server. To find out which database is currently selected, use the DATABASE() function:
```bash
mysql> SELECT DATABASE();
```

```bash
mysql> SHOW TABLES;
```

```bash
mysql> DESCRIBE pet;
```

### 3.5 Using mysql in Batch Mode ([5.6](https://dev.mysql.com/doc/refman/5.6/en/batch-mode.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/batch-mode.html))

```bash
shell> mysql -h host -u user -p < batch-file
```

```bash
mysql> source filename;
mysql> \. filename
```

---

## Chapter 5 MySQL Server Administration ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-administration.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-administration.html))

### 5.1 The MySQL Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld-server.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqld-server.html))

#### 5.1.1 Configuring the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-configuration.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-configuration.html))

To determine the command option and system variable values used by the server, execute this command:
```bash
shell> mysqld --verbose --help
```

To see the current system variable values used by the server as it runs, connect to it and execute this statement:
```bash
mysql> SHOW VARIABLES;
```

To see some statistical and status indicators for a running server, execute this statement:
```bash
mysql> SHOW STATUS;
```

System variable and status information also is available using the mysqladmin command:
```bash
shell> mysqladmin variables
shell> mysqladmin extended-status
```

#### 5.1.2 Server Configuration Defaults ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-configuration-defaults.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html))

#### 5.1.3 Server Option and Variable Reference ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld-option-tables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqld-option-tables.html))

#### 5.1.4 Server Command Options ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-options.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-options.html))

```bash
shell> mysqld --verbose --help
```

#### 5.1.5 Server System Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html))

#### 5.1.6 Using System Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/using-system-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/using-system-variables.html))

**SET Syntax for Variable Assignment ([5.6](https://dev.mysql.com/doc/refman/5.6/en/set-variable.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/set-variable.html))**

**SHOW VARIABLES Syntax ([5.6](https://dev.mysql.com/doc/refman/5.6/en/show-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/show-variables.html))**

To display system variable names and values, use the `SHOW VARIABLES` statement:
```bash
mysql> SHOW VARIABLES;
```

With a `LIKE` clause, the statement displays only those variables that match the pattern. To obtain a specific variable name, use a `LIKE` clause as shown:
```bash
mysql> SHOW VARIABLES LIKE 'max_join_size';
mysql> SHOW SESSION VARIABLES LIKE 'max_join_size';
```

To get a list of variables whose name match a pattern, use the `%` wildcard character in a `LIKE` clause:
```bash
mysql> SHOW VARIABLES LIKE '%size%';
mysql> SHOW GLOBAL VARIABLES LIKE '%size%';
```

##### 5.1.6.2 Dynamic System Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/dynamic-system-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/dynamic-system-variables.html))

#### 5.1.7 Server Status Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-status-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-status-variables.html))

```bash
mysql> SHOW GLOBAL STATUS;
```

Many status variables are reset to 0 by the `FLUSH STATUS` statement.

### 5.2 The MySQL Data Directory ([5.6](https://dev.mysql.com/doc/refman/5.6/en/data-directory.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/data-directory.html))

### 5.3 The mysql System Database ([5.6](https://dev.mysql.com/doc/refman/5.6/en/system-database.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/system-database.html))

### 5.4 MySQL Server Logs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-logs.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-logs.html))

#### 5.4.1 Selecting General Query and Slow Query Log Output Destinations ([5.6](https://dev.mysql.com/doc/refman/5.6/en/log-destinations.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/log-destinations.html))

#### 5.4.2 The Error Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/error-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/error-log.html))

#### 5.4.3 The General Query Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/query-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/query-log.html))

#### 5.4.4 The Binary Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/binary-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/binary-log.html))

`log-bin` `max_binlog_size` `binlog-do-db` `binlog-ignore-db` `replicate-do-db` `replicate-ignore-db` `sync_binlog`

`mysqlbinlog`([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqlbinlog.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqlbinlog.html)) — Utility for Processing Binary Log Files

##### 5.4.4.1 Binary Logging Formats ([5.6](https://dev.mysql.com/doc/refman/5.6/en/binary-log-formats.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/binary-log-formats.html))

`--binlog-format={ROW|STATEMENT|MIXED}`

##### 5.4.4.2 Setting The Binary Log Format ([5.6](https://dev.mysql.com/doc/refman/5.6/en/binary-log-setting.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/binary-log-setting.html))

The logging format also can be switched at runtime. To specify the format globally for all clients, set the global value of the binlog_format system variable:
```bash
mysql> SET GLOBAL binlog_format = 'STATEMENT';
mysql> SET GLOBAL binlog_format = 'ROW';
mysql> SET GLOBAL binlog_format = 'MIXED';
```

An individual client can control the logging format for its own statements by setting the session value of binlog_format:
```bash
mysql> SET SESSION binlog_format = 'STATEMENT';
mysql> SET SESSION binlog_format = 'ROW';
mysql> SET SESSION binlog_format = 'MIXED';
```

#### 5.4.5 The Slow Query Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/slow-query-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/slow-query-log.html))

`long_query_time` `slow_query_log` `slow_query_log_file` `log-output`

`mysqldumpslow`([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqldumpslow.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqldumpslow.html)) — Summarize Slow Query Log Files

#### 5.4.7 Server Log Maintenance ([5.6](https://dev.mysql.com/doc/refman/5.6/en/log-file-maintenance.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/log-file-maintenance.html))

---

## Chapter 6 Security

### 6.2 The MySQL Access Privilege System ([5.6](https://dev.mysql.com/doc/refman/5.6/en/privilege-system.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/privilege-system.html))

#### 6.2.1 Privileges Provided by MySQL ([5.6](https://dev.mysql.com/doc/refman/5.6/en/privileges-provided.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html))

#### 6.2.3 Specifying Account Names ([5.6](https://dev.mysql.com/doc/refman/5.6/en/account-names.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/account-names.html))

#### 6.2.6 When Privilege Changes Take Effect ([5.6](https://dev.mysql.com/doc/refman/5.6/en/privilege-changes.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/privilege-changes.html))

To tell the server to reload the grant tables, perform a flush-privileges operation. This can be done by issuing a `FLUSH PRIVILEGES` statement or by executing a `mysqladmin flush-privileges` or `mysqladmin reload` command.

### 6.3 MySQL User Account Management ([5.6](https://dev.mysql.com/doc/refman/5.6/en/user-account-management.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/user-account-management.html))

#### 6.3.1 User Names and Passwords ([5.6](https://dev.mysql.com/doc/refman/5.6/en/user-names.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/user-names.html))

> MySQL stores accounts in the user table of the mysql system database. An account is defined in terms of a user name and the client host or hosts from which the user can connect to the server. 

To connect to a MySQL server with a command-line client, specify user name and password options as necessary for the account that you want to use:
```bash
shell> mysql --user=finley --password db_name
```

If you prefer short options, the command looks like this:
```bash
shell> mysql -u finley -p db_name
```

If you omit the password value following the --password or -p option on the command line (as just shown), the client prompts for one. Alternatively, the password can be specified on the command line:
```bash
shell> mysql --user=finley --password=password db_name
shell> mysql -u finley -ppassword db_name
```
If you use the -p option, there must be no space between -p and the following password value.

#### 6.3.2 Adding User Accounts ([5.6](https://dev.mysql.com/doc/refman/5.6/en/adding-users.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/adding-users.html ))

The following example uses CREATE USER and GRANT statements to set up four accounts:
```bash
mysql> CREATE USER 'finley'@'localhost' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'localhost'
    ->     WITH GRANT OPTION;
mysql> CREATE USER 'finley'@'%' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'%'
    ->     WITH GRANT OPTION;
mysql> CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_pass';
mysql> GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';
mysql> CREATE USER 'dummy'@'localhost';
```

To see the privileges for an account, use `SHOW GRANTS`:
```bash
mysql> SHOW GRANTS FOR 'admin'@'localhost';
```

To see nonprivilege properties for an account, use `SHOW CREATE USER`:
```bash
## MySQL 5.7 ##
mysql> SHOW CREATE USER 'admin'@'localhost'\G
```

The next examples create three accounts and grant them access to specific databases. Each of them has a user name of custom and password of obscure:
```bash
mysql> CREATE USER 'custom'@'localhost' IDENTIFIED BY 'obscure';
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP
    ->     ON bankaccount.*
    ->     TO 'custom'@'localhost';
mysql> CREATE USER 'custom'@'host47.example.com' IDENTIFIED BY 'obscure';
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP
    ->     ON expenses.*
    ->     TO 'custom'@'host47.example.com';
mysql> CREATE USER 'custom'@'%.example.com' IDENTIFIED BY 'obscure';
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP
    ->     ON customer.*
    ->     TO 'custom'@'%.example.com';
```

#### 6.3.3 Removing User Accounts ([5.6](https://dev.mysql.com/doc/refman/5.6/en/removing-users.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/removing-users.html))

To remove an account, use the DROP USER statement. For example:
```bash
mysql> DROP USER 'jeffrey'@'localhost';
```

#### 6.3.4 Setting Account Resource Limits ([5.6](https://dev.mysql.com/doc/refman/5.6/en/user-resources.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/user-resources.html))

To establish resource limits for an account, use the GRANT statement. Provide a WITH clause that names each resource to be limited. The default value for each limit is zero (no limit). For example, to create a new account that can access the customer database, but only in a limited fashion, issue these statements:
```bash
mysql> CREATE USER 'francis'@'localhost' IDENTIFIED BY 'frank';
mysql> GRANT ALL ON customer.* TO 'francis'@'localhost'
    ->     WITH MAX_QUERIES_PER_HOUR 20
    ->          MAX_UPDATES_PER_HOUR 10
    ->          MAX_CONNECTIONS_PER_HOUR 5
    ->          MAX_USER_CONNECTIONS 2;
```

To modify limits for an existing account, use a GRANT USAGE statement at the global level (ON `*.*`). The following statement changes the query limit for francis to 100:
```bash
mysql> GRANT USAGE ON *.* TO 'francis'@'localhost'
    ->     WITH MAX_QUERIES_PER_HOUR 100;
```
The statement modifies only the limit value specified and leaves the account otherwise unchanged.

To remove a limit, set its value to zero. For example, to remove the limit on how many times per hour francis can connect, use this statement:
```bash
mysql> GRANT USAGE ON *.* TO 'francis'@'localhost'
    ->     WITH MAX_CONNECTIONS_PER_HOUR 0;
```

#### 6.3.5 Assigning Account Passwords ([5.6](https://dev.mysql.com/doc/refman/5.6/en/assigning-passwords.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/assigning-passwords.html))

**To assign a password when you create a new account, use `CREATE USER` and include an `IDENTIFIED BY` clause:**
```bash
mysql> CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'mypass';
```

**To assign or change a password for an existing account, use one of the following methods:**

Use `SET PASSWORD` with the `PASSWORD()` function:
```
## 5.6 ##
mysql> SET PASSWORD FOR 'jeffrey'@'localhost' = PASSWORD('mypass');

# If you are not connected as an anonymous user, you can change your own password by omitting the FOR clause:
mysql> SET PASSWORD = PASSWORD('mypass');
```

Use the `ALTER USER` statement with an `IDENTIFIED BY` clause:
```bash
## 5.7 ##
mysql> ALTER USER 'jeffrey'@'localhost' IDENTIFIED BY 'mypass';

# If you are not connected as an anonymous user, you can change your own password without naming your own account literally:
mysql> ALTER USER USER() IDENTIFIED BY 'mypass';
```

Use a `GRANT USAGE` statement at the global level (ON `*.*`) to change an account password without affecting the account's current privileges:
```bash
## 5.6 ##
mysql> GRANT USAGE ON *.* TO 'jeffrey'@'localhost' IDENTIFIED BY 'mypass';
```

To change an account password from the command line, use the mysqladmin command:
```bash
shell> mysqladmin -u user_name -h host_name password "new_password"
```

#### 6.3.6 Password Expiration and Sandbox Mode ([5.6](https://dev.mysql.com/doc/refman/5.6/en/password-expiration-sandbox-mode.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/password-expiration-sandbox-mode.html))

To expire an account password, use the `ALTER USER` statement. For example:
```bash
mysql> ALTER USER 'myuser'@'localhost' PASSWORD EXPIRE;
```

## Chapter 11 Data Types ([5.6](https://dev.mysql.com/doc/refman/5.6/en/data-types.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/data-types.html))


