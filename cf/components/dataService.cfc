<cfcomponent output="false">
	<cffunction name="insertLoan" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">
		<cfargument name="ssn"	required="true" type="string">
		<cfargument name="dob" required="true" type="date">

		<cfstoredproc procedure="InsertLoanApplication" datasource="SDS" returncode="true" result="loanResult">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">
			<cfprocparam cfsqltype="CF_SQL_DATE" value="#dob#">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="9" value="#ssn#">
			
			<cfprocresult name="loanResult">
		</cfstoredproc>

		<cfif loanResult.statusCode NEQ 0>
			<cfreturn false>
		</cfif>

		<cfreturn true>
	</cffunction>

	<cffunction name="insertCreditCheck" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">
		<cfargument name="xml"	required="true" type="xml">

		<cfstoredproc procedure="insertCreditCheck" datasource="SDS" returncode="true" result="creditCheckResult">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#name#">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#xml#">

			<cfprocresult name="creditCheckResult">
		</cfstoredproc>


		<cfif creditCheckResult.statusCode NEQ 0>
			<cfreturn false>
		</cfif>

		<cfreturn true>
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