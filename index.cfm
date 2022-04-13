
<html>
    <head>
        <link rel="stylesheet" href = "css/style.css">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Task 20</title>
    </head>
<cffunction name="makeRandomString" returnType="string" output="false">
	<cfset var chars = "23456789ABCDEFGHJKMNPQRS">
	<cfset var length = randRange(4,7)>
	<cfset var result = "">
	<cfset var i = "">
	<cfset var char = "">	
	<cfscript>
	for(i=1; i <= length; i++) {
		char = mid(chars, randRange(1, len(chars)),1);
		result&=char;
	}
	</cfscript>
		
	<cfreturn result>
</cffunction>
  <body style="background-color:#d7b2d7;">
        <section>
            <div class="main_container">
              <h3>Task 20 </h3>
                    <hr>
<cfset showForm = true>
<cfparam name="form.name" default="">
<cfparam name="form.comments" default="">
<cfparam name="form.captcha" default="">
<cfparam name="form.captchaHash" default="">

<cfif isDefined("form.send")>
	<cfset errors = "">
	
	<cfif not len(trim(form.name))>
		<cfset errors = errors & "You must include your name.<br />">
	</cfif>



	<cfif hash(ucase(form.captcha)) neq form.captchaHash>
		<cfset errors = errors & "You did not enter the right text. Are you a spammer?<br />">
	</cfif>
		
	<cfif errors is "">
		<!--- do something here --->
		<cfset showForm = false>
	</cfif>
	
</cfif>

<cfif showForm>

	<cfset captcha = makeRandomString()>
	<cfset captchaHash = hash(captcha)>

	<cfoutput>
	<p>
	Please fill the form below.
	</p>
	
	<cfif isDefined("errors")>
	<p>
	<b>Correct these errors:<br />#errors#</b>
	</p>
	</cfif>
	
	<form action="#cgi.script_name#" method="post" >
	<table>
		<tr>
			<td>Email:</td>
			<td><input name="name" type="text" value="#form.name#"></td>
		</tr>

		<tr>
			<td>Enter Text Below:</td>
			<td><input type="text" name="captcha"></td>
		</tr>
		<tr>
			<td colspan="2">
			<cfimage action="captcha" width="300" height="75" text="#captcha#">
			<input type="hidden" name="captchaHash" value="#captchaHash#">
			</td>
		</tr>		
		<tr>
			<td> </td>
			<td><input type="submit" name="send" value="Subscribe Newsletter"></td>
		</tr>
	</table>
	</form>
	</cfoutput>
	
<cfelse>

	<cfoutput>
	<p>
	Thank you for submitting your information, #form.name#.  successfully subscribe our newsletter.
	</p>
	</cfoutput>
	
</cfif>
</div>
</body>