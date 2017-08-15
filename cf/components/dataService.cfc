<cfcomponent output="false">
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

		<cfreturn false>
	</cffunction>

	<cffunction name="insertCreditCheck" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">
		<cfargument name="xml"	required="true" type="xml">

		<!--- <cfstoredproc procedure="" datasource="">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#xml#">

			<cfprocresult name="creditCheckResult">
		</cfstoredproc> --->

		<cfreturn false>
	</cffunction>

	<cffunction name="searchSSN" access="remote" output="true" returntype="boolean">
		<cfargument name="ssn" required="true" type="string">

		<!--- <cfstoredproc procedure="" datasource="">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">

			<cfprocresult name="loanSearchResult">
		</cfstoredproc> --->

		<cfreturn false>
	</cffunction>

	<cffunction name="searchDOB" access="remote" output="true" returntype="boolean">
		<cfargument name="dob" required="true" type="date">

		<!--- <cfstoredproc procedure="" datasource="">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">

			<cfprocresult name="creditSearchResult">
		</cfstoredproc> --->

		<cfreturn false>
	</cffunction>
</cfcomponent>