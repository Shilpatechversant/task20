<cfcomponent output="false">
    <cfset this.name = "task17"/>
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.datasource = "newtech"/>
    <cfset this.sessionManagement = true />
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>
</cfcomponent>