# Solutions for Common Errors

>## SQLException
>
>```java
>could not extract ResultSet; nested exception is org.hibernate.exception.GenericJDBCException: could not extract ResultSet
>```
>
> **Solution**  
> Run create_schema_extentions.sql on pgAdmin or psql cli `# \i src/create_schema_extensions.sql`.

>## Not Indexing Modules
>Rigth click on pom.xml then "Maven" then "Reload Project"
