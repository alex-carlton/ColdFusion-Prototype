<cfcomponent output="false">
	<cffunction name="insertLoan" access="remote" output="true" returntype="boolean">
		<cfargument name="name" required="true" type="string">
		<cfargument name="ssn"	required="true" type="string">
		<cfargument name="dob" required="true" type="date">

		<cfstoredproc procedure="usp_InsLoanApplication" datasource="SDS" returncode="true" result="loanResult">
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

		<cfstoredproc procedure="usp_InsCreditCheck" datasource="SDS" returncode="true" result="creditCheckResult">
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
		<cfset ssnToken = application.secureDataService.insertTextToken(ssn, application.secureTypes.ssn)>

		<!--- Get Name and DOB token --->
		<cfstoredproc procedure="usp_GetLoanApplicationBySSN" datasource="ADS">
			<cfprocparam cfsqltype="CF_SQL_IDSTAMP" value="#ssnToken#">

			<cfprocresult name="qLoan">
		</cfstoredproc>

		<!--- Check that a result has been returned --->
		<cfif qLoan.recordCount EQ 0>
			<cfset loan={name="", dob=""}>
			<cfreturn loan>
		</cfif>

		<!--- Get the DOB using token --->
		<cfset loanDOB = application.secureDataService.getDate(qLoan.DOBToken, application.secureTypes.dob) >

		<cfset loan={name=qLoan.ApplicantName, dob=loanDOB}>

		<cfreturn loan>
	</cffunction>

	<cffunction name="searchDOB" access="remote" output="true" returntype="struct">
		<cfargument name="dob" required="true" type="date">

		<!--- Get DOB token --->
		<cfset dobToken = application.secureDataService.insertDateToken(dob, application.secureTypes.dob)>

		<!--- Get name and SSN token --->
		<cfstoredproc procedure="usp_GetLoanApplicationByDOB" datasource="ADS">
			<cfprocparam cfsqltype="CF_SQL_IDSTAMP" value="#dobToken#">

			<cfprocresult name="qLoan">
		</cfstoredproc>

		<!--- Check that a result has been returned --->
		<cfif qLoan.recordCount EQ 0>
			<cfset loan={name="", ssn=""}>
			<cfreturn loan>
		</cfif>

		<!--- Get the SSN using token --->
		<cfset loanSSN = application.secureDataService.getText(qLoan.SSNToken, application.secureTypes.ssn) >

		<cfset loan={name=qLoan.ApplicantName, ssn=loanSSN}>

		<cfreturn loan>
	</cffunction>
</cfcomponent>