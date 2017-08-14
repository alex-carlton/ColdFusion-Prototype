<cf_header>	
	<cfif StructKeyExists(form, "loanSearchSubmit")>
		<cfset result = application.dataService.searchLoan(form.name) >
		<cfif result >
			<cfset message="Loan details to come...">
		</cfif>
	<cfelseif structKeyExists(form, "creditSearchSubmit")>
		<cfset result = application.dataService.searchCreditCheck(form.name) >
		<cfif result >
			<cfset message="Credit check details to come...">
		</cfif>
	<cfelse>
		<cfset message="">
	</cfif>
	
	<div class="row">
		<h1>Search</h1>
		<ul id="tabs-swipe-demo" class="tabs">
		    <li class="tab col s3"><a class="active"href="#test-swipe-1">Loan</a></li>
		    <li class="tab col s3"><a href="#test-swipe-2">Credit Check</a></li>
		</ul>
		<div id="test-swipe-1" class="col s12">
			<form name="loanForm" method="post">
				<label>Name:</label>
				<input type="text" name="name" required>
				<input class="btn" type="submit" name="loanSearchSubmit" value="Submit">
			</form>
		</div>
		<div id="test-swipe-2" class="col s12">
			<form name="xmlForm" method="post">
				<label>Name:</label>
				<input type="text" name="name" required>
				<input class="btn" type="submit" name="creditSearchSubmit" value="Submit">
			</form>
		</div>
	</div>

	<div class="row">
		<div id="message" class="col s12 center-align"><cfoutput>#message#</cfoutput></div>
	</div>
</cf_header>