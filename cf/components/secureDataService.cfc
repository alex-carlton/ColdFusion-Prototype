<cfcomponent output="false">
	<cffunction name="insertTextToken" access="remote" output="true" returntype="numeric">
		<cfargument name="text" required="true" type="string">
		<cfargument name="type" required="true" type="numeric">

		<cfstoredproc procedure="usp_InsTextTokenIfNotExists" datasource="SDS">
			<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" maxlength="9" value="#text#">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="#type#">
			<cfprocparam type="out" cfsqltype="CF_SQL_INTEGER" variable="textToken">	
		</cfstoredproc>

		<cfreturn textToken>
	</cffunction>

	<cffunction name="insertDateToken" access="remote" output="true" returntype="numeric">
		<cfargument name="date" required="true" type="date">
		<cfargument name="type" required="true" type="numeric">
		
		<cfstoredproc procedure="usp_InsDateTokenIfNotExists" datasource="SDS">
			<cfprocparam type="in" cfsqltype="CF_SQL_DATE" value="#date#">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="#type#">
			<cfprocparam type="out" cfsqltype="CF_SQL_INTEGER" variable="dateToken">	
		</cfstoredproc>

		<cfreturn dateToken>
	</cffunction>

	<cffunction name="getDate" access="remote" output="true" returntype="date">
		<cfargument name="token" required="true" type="numeric">
		<cfargument name="type" required="true" type="numeric">

		<cfstoredproc procedure="usp_GetDateValue" datasource="SDS">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#ssnLoanResult.DOBToken#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#application.secureTypes.dob#">

			<cfprocresult name="qDate">
		</cfstoredproc>

		<cfreturn qDate.SecureData>
	</cffunction>

	<cffunction name="getText" access="remote" output="true" returntype="string">
		<cfargument name="token" required="true" type="numeric">
		<cfargument name="type" required="true" type="numeric">

		<cfstoredproc procedure="usp_GetTextValue" datasource="SDS">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#token#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#type#">

			<cfprocresult name="qText">
		</cfstoredproc>

		<cfreturn qDate.SecureData>
	</cffunction>
</cfcomponent>