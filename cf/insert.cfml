<cf_header>
	<cfif StructKeyExists(form, "loanSubmit")>
		<cfset result = application.dataService.insertLoan(form.name, form.ssn, form.dob) >
	
		<cfif result>
			<cfset message="Loan inserted successful.">
		<cfelse>
			<cfset message="Loan inserted failed.">
		</cfif>
	<cfelseif structKeyExists(form, "creditSubmit")>
		<cfset result = application.dataService.insertCreditCheck(form.name, form.xml) >
		<cfif result >
			<cfset message="Credit check inserted successfully.">
		<cfelse>
			<cfset message="Credit check inserted failed.">
		</cfif>
	<cfelse>
		<cfset message="">
	</cfif>
	
	<div class="row">
		<h1>Insert</h1>
		<ul id="tabs-swipe-demo" class="tabs">
		    <li class="tab col s3"><a class="active"href="#test-swipe-1">Loan</a></li>
		    <li class="tab col s3"><a href="#test-swipe-2">Credit Check</a></li>
		</ul>
		<div id="test-swipe-1" class="col s12">
			<form name="loanForm" method="post">
				<label>Name:</label>
				<input type="text" name="name" required>
				<label>SSN:</label>
				<input type="text" name="ssn" placeholder="12345678" required>
				<label>DOB:</label>
				<input type="date" name="dob" required>
				<input class="btn" type="submit" name="loanSubmit" value="Submit">
			</form>
		</div>
		<div id="test-swipe-2" class="col s12">
			<form name="xmlForm" method="post">
				<label>Name:</label>
				<input type="text" name="name" required>
				<label>Credit Check XML:</label>
				<input type="text" name="xml" value="<credit><card>1234</card></credit>" required>
				<input class="btn" type="submit" name="creditSubmit" value="Submit">
			</form>
		</div>
	</div>

	<div class="row">
		<div id="message" class="col s12 center-align"><cfoutput>#message#</cfoutput></div>
	</div>
</cf_header>