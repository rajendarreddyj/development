You can declare the JNDI resource in tomcat's server.xml using something like this:

`
<Resource auth="Container" connectionFactoryClassName="oracle.jdbc.pool.OracleDataSource" connectionPoolName="" description="Oracle UCP Pool in Tomcat" factory="oracle.ucp.jdbc.PoolDataSourceImpl" inactiveConnectionTimeout="500" maxPoolSize="15" minPoolSize="2" name="jdbc/dbcporacle" password="" type="oracle.ucp.jdbc.PoolDataSource" url="" user="" validateConnectionOnBorrow="true"/>
`

or without ucp

`
 <Resource name="jdbc/DatabaseName"
              auth="Container"
              type="javax.sql.DataSource"
              username=""
              password=""
              url=""
              driverClassName="oracle.jdbc.driver.OracleDriver"
              initialSize="5"
              maxWaitMillis="15000"
              maxTotal="15"
              maxIdle="10"
              maxAge="7200000"
              testOnBorrow="true"
              validationQuery="select 1 from dual"
              validateConnectionOnBorrow="true"
              />
`

You can reference the JNDI resource from Tomcat's web context.xml like this:

`
 <ResourceLink global="jdbc/dbcporacle" name="jdbc/dbcporacle" type="javax.sql.DataSource"/>
`

You can setup using simple bean configuration like this:

`
<bean id="DatabaseName" class="org.springframework.jndi.JndiObjectFactoryBean">
    <property name="jndiName" value="java:comp/env/jdbc/dbcporacle"/>
</bean>
`
