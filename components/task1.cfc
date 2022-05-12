<cfcomponent displayname="task1" hint="ColdFusion Component for Customers">
    <cffunction name="makeRandomString" returnType="string" output="false">
        <cfset var local.chars="23456789ABCDEFGHJKMNPQRS">
        <cfset var local.length=randRange(4,7)>
        <cfset var local.result="">
        <cfset var local.i="">
        <cfset var local.char="">
        <cfscript> for(i=1; i <= length; i++) 
			{ char=mid(chars, randRange(1, len(chars)),1); result&=char; } 
		</cfscript>
        <cfreturn local.result>
    </cffunction>

    <cffunction name="check_info" access="remote">
        <cfargument name="name" type="string" required="true">
        <cfargument name="captcha" type="string" required="true">
        <cfargument name="captchaHash" type="string" required="true">
        <cfset local.errors="">
        <cfif not len(trim(Arguments.name))>
            <cfset local.errors=1>
        </cfif>
        <cfif hash(ucase(Arguments.captcha)) neq Arguments.captchaHash>
            <cfset var local.errors="2">
        </cfif>
        <cfif local.errors is "">
            <!--- do something here --->
            <cflocation url="../index.cfm?success=1">
        </cfif>
        <cfif local.errors>
            <!--- do something here --->
            <cflocation url="../index.cfm?errors=#local.errors#">
        </cfif>
    </cffunction>
</cfcomponent>