<cf_header>
	<cfset qAds = {datasource="ADS"}>
	<cfset qSds = {datasource="SDS"}>

	<cfif structKeyExists(URL, "adaToSds")>
		<cfset myquery=queryExecute("SELECT * FROM SecureDataStore.dbo.SecureTexts", [], qAds)>
		<cfdump var="#myquery#">
	<cfelseif structKeyExists(URL, "sdsToAds")>
		<cfset myquery=queryExecute("SELECT * FROM ApplicationDataStore.dbo.CreditChecks", [], qSds)>
		<cfdump var="#myquery#">
	<cfelseif structKeyExists(URL, "selectFromSds")>
		<cfset myquery=queryExecute("SELECT * FROM SecureDates", [], qSds)>
		<cfdump var="#myquery#">
	</cfif>

	<h1>Test Privileges</h1>
	<div class="row">
		<form>
			<p>Test if application database can access secure data store</p>
			<input class="btn" type="submit" name="adaToSds" value="Test">	
		</form>
	</div>
	<div class="row">
		<form>
			<p>Test if secure data store can access application database</p>
			<input class="btn" type="submit" name="sdsToAds" value="Test">	
		</form>
	</div>
	<div class="row">
		<form>
			<p>Select from secure data store</p>
			<input class="btn" type="submit" name="selectFromSds" value="Test">	
		</form>
	</div>
</cf_header>