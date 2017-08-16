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

	<cffunction name="searchSSN" access="remote" output="true" returntype="struct">
		<cfargument name="ssn" required="true" type="string">
		
		<!--- Get SSN token --->
		<cfstoredproc procedure="CreateTextTokenIfNotExists" datasource="SDS">
			<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" maxlength="9" value="#ssn#">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="1">
			<cfprocparam type="out" cfsqltype="CF_SQL_INTEGER" variable="ssnToken">	
		</cfstoredproc>

		<!--- Get Name and DOB token --->
		<cfstoredproc procedure="secure.SearchLoanApplicationSSN" datasource="ADS">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#ssnToken#">

			<cfprocresult name="ssnLoanResult">
		</cfstoredproc>

		<!--- Check that a result has been returned --->
		<cfif ssnLoanResult.recordCount EQ 0>
			<cfset ssnLoan={name="", dob=""}>
			<cfreturn ssnLoan>
		</cfif>

		<!--- Get the DOB using token --->
		<cfstoredproc procedure="GetDateValue" datasource="SDS">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#ssnLoanResult.DOBToken#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="2">

			<cfprocresult name="dob_ssnLoanResult">
		</cfstoredproc>

		<cfset ssnLoan={name=ssnLoanResult.name, dob=dob_ssnLoanResult.Data}>

		<cfreturn ssnLoan>
	</cffunction>

	<cffunction name="searchDOB" access="remote" output="true" returntype="struct">
		<cfargument name="dob" required="true" type="date">

		<!--- Get DOB token --->
		<cfstoredproc procedure="CreateDateTokenIfNotExists" datasource="SDS">
			<cfprocparam type="in" cfsqltype="CF_SQL_DATE" value="#dob#">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="2">
			<cfprocparam type="out" cfsqltype="CF_SQL_INTEGER" variable="dobToken">	
		</cfstoredproc>

		<!--- Get name and SSN token --->
		<cfstoredproc procedure="secure.SearchLoanApplicationDOB" datasource="ADS">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#dobToken#">

			<cfprocresult name="dobLoanResult">
		</cfstoredproc>

		<!--- Check that a result has been returned --->
		<cfif dobLoanResult.recordCount EQ 0>
			<cfset dobLoan={name="", ssn=""}>
			<cfreturn dobLoan>
		</cfif>

		<!--- Get the SSN using token --->
		<cfstoredproc procedure="GetTextValue" datasource="SDS">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#dobLoanResult.SSNToken#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="1">

			<cfprocresult name="ssn_dobLoanResult">
		</cfstoredproc>

		<cfset dobLoan={name=dobLoanResult.name, ssn=ssn_dobLoanResult.Data}>

		<cfreturn dobLoan>
	</cffunction>
</cfcomponent>