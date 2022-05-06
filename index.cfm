<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Task 20</title>
    </head>
    <body>
        <section>
            <div class="main_container">
                <h3>Task 20 </h3>
                <hr>
                <cfif structKeyExists(url,"success")>
                    <cfoutput>
                        <p> Thank you for submitting your information,successfully subscribe our newsletter. </p>
                    </cfoutput>
                </cfif>
                <cfset showForm=true>
                <cfparam name="form.name" default="">
                <cfif showForm>
                    <cfinvoke component="components/task1" method="makeRandomString" returnVariable="myReturn">
                    <cfset captcha=myReturn>
                    <cfset captchaHash=hash(captcha)>
                    <cfif structKeyExists(url,"errors")>
                        <cfif errors eq 1>
                            <p>"You must include your name." </p>
                        </cfif>
                        <cfif errors eq 2>
                            <b>Correct these errors: <br />You did not enter the right text. Are you a spammer? </b>
                        </cfif>
                        <cfif errors eq 3>
                            <b>Correct these errors: <br />You must include your name. <br />You did not enter the right text. Are you a spammer? </b>
                        </cfif>
                    </cfif>
                    <cfoutput>
                        <p> Please fill the form below. </p>
                        <form action="components/task1.cfc?method=check_info" method="post">
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
                                	<td></td>
                                    <td>
                                    	<input type="submit" name="send" value="Subscribe Newsletter">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </cfoutput>
                    <cfelse>
                </cfif>
            </div>
	    </section>		
    </body>
 </html>   