<cfcomponent displayname="task1" hint="ColdFusion Component for Customers">
    <cffunction name="makeRandomString" returnType="string" output="false">
        <cfset var chars="23456789ABCDEFGHJKMNPQRS">
        <cfset var length=randRange(4,7)>
        <cfset var result="">
        <cfset var i="">
        <cfset var char="">
        <cfscript> for(i=1; i <= length; i++) 
			{ char=mid(chars, randRange(1, len(chars)),1); result&=char; } 
		</cfscript>
        <cfreturn result>
    </cffunction>
    <cffunction name="check_info" access="remote">
        <cfargument name="name">
        <cfargument name="captcha">
        <cfargument name="captchaHash">
        <cfset errors="">
        <cfif not len(trim(Arguments.name))>
            <cfset errors=1>
        </cfif>
        <cfif hash(ucase(Arguments.captcha)) neq Arguments.captchaHash>
            <cfset var errors="2">
        </cfif>
        <cfif errors is "">
            <!--- do something here --->
            <cflocation url="../index.cfm?success=1">
        </cfif>
        <cfif errors>
            <!--- do something here --->
            <cflocation url="../index.cfm?errors=#errors#">
        </cfif>
    </cffunction>
</cfcomponent>