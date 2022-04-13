<cfcomponent displayname="task1" hint="ColdFusion Component for Customers">
 <!--- This function retrieves all customers from the database --->
 <cffunction name="retrieveCustomers"
	hint="Gets all customer from the database" returntype="query">
   <cfquery name="getCustomers" datasource="newtech">
	 select * from sakila.test_user
   </cfquery>
   <cfreturn getCustomers>
 </cffunction>


</cfcomponent>