<cf_header>	
	<cfif StructKeyExists(form, "ssnSearchSubmit")>
		<cfset result = application.dataService.searchSSN(form.ssn) >
		<cfif result EQ "">
			<cfset message="No loan details found.">
		<cfelse>
			<cfset message="Found: #result#">
		</cfif>
	<cfelseif structKeyExists(form, "dobSearchSubmit")>
		<cfset result = application.dataService.searchDOB(form.dob) >
		<cfif result EQ "">
			<cfset message="No loan details found.">
		<cfelse>
			<cfset message="Found: #result#">
		</cfif>
	<cfelse>
		<cfset message="">
	</cfif>
	
	<div class="row">
		<h1>Search</h1>
		<ul id="tabs-swipe-demo" class="tabs">
		    <li class="tab col s3"><a class="active"href="#test-swipe-1">SSN</a></li>
		    <li class="tab col s3"><a href="#test-swipe-2">DOB</a></li>
		</ul>
		<div id="test-swipe-1" class="col s12">
			<form name="ssnForm" method="post">
				<label>SSN:</label>
				<input type="text" name="ssn" placeholder="12345678" required>
				<input class="btn" type="submit" name="ssnSearchSubmit" value="Submit">
			</form>
		</div>
		<div id="test-swipe-2" class="col s12">
			<form name="xmlForm" method="post">
				<label>DOB:</label>
				<input type="date" name="dob" required>
				<input class="btn" type="submit" name="dobSearchSubmit" value="Submit">
			</form>
		</div>
	</div>

	<div class="row">
		<div id="message" class="col s12 center-align"><cfoutput>#message#</cfoutput></div>
	</div>
</cf_header>