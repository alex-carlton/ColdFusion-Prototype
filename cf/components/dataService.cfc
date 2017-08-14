<cfcomponent output="false">
	<!--- Not sure what the type mapping is yet.
	<cfset this.textType = "1">
	<cfset this.dateType = "2">
	<cfset this.complexType = "3"> --->

	<cffunction name="insertLoan" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">
		<cfargument name="ssn"	required="true" type="numeric">
		<cfargument name="dob" required="true" type="date">

		<!--- <cfstoredproc procedure="" datasource="">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="100" value="#ssn#">
			<cfprocparam cfsqltype="CF_SQL_DATE" value="#dob#">

			<cfprocresult name="loanResult">
		</cfstoredproc> --->

		<cfreturn true>
	</cffunction>

	<cffunction name="insertCreditCheck" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">
		<cfargument name="xml"	required="true" type="xml">

		<!--- <cfstoredproc procedure="" datasource="">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#xml#">

			<cfprocresult name="creditCheckResult">
		</cfstoredproc> --->

		<cfreturn true>
	</cffunction>

	<cffunction name="searchLoan" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">

		<!--- <cfstoredproc procedure="" datasource="">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">

			<cfprocresult name="loanSearchResult">
		</cfstoredproc> --->

		<cfreturn true>
	</cffunction>

	<cffunction name="searchCreditCheck" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">

		<!--- <cfstoredproc procedure="" datasource="">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">

			<cfprocresult name="creditSearchResult">
		</cfstoredproc> --->

		<cfreturn true>
	</cffunction>
</cfcomponent>