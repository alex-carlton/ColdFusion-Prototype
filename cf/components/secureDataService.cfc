<cfcomponent output="false">
	<cffunction name="insertTextTokenIfNotExists" access="remote" output="true" returntype="string">
		<cfargument name="text" required="true" type="string">
		<cfargument name="type" required="true" type="numeric">

		<cfstoredproc procedure="usp_InsTextTokenIfNotExists" datasource="SDS">
			<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" maxlength="9" value="#text#">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="#type#">
			<cfprocparam type="out" cfsqltype="CF_SQL_IDSTAMP" variable="textToken">	
		</cfstoredproc>

		<cfreturn textToken>
	</cffunction>

	<cffunction name="insertDateTokenIfNotExists" access="remote" output="true" returntype="string">
		<cfargument name="date" required="true" type="date">
		<cfargument name="type" required="true" type="numeric">
		
		<cfstoredproc procedure="usp_InsDateTokenIfNotExists" datasource="SDS">
			<cfprocparam type="in" cfsqltype="CF_SQL_DATE" value="#date#">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="#type#">
			<cfprocparam type="out" cfsqltype="CF_SQL_IDSTAMP" variable="dateToken">	
		</cfstoredproc>

		<cfreturn dateToken>
	</cffunction>

	<cffunction name="getDate" access="remote" output="true" returntype="string">
		<cfargument name="token" required="true" type="string">
		<cfargument name="type" required="true" type="numeric">

		<cfstoredproc procedure="usp_GetDateValue" datasource="SDS">
			<cfprocparam cfsqltype="CF_SQL_IDSTAMP" value="#token#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#type#">

			<cfprocresult name="qDate">
		</cfstoredproc>

		<cfreturn qDate.SecureData>
	</cffunction>

	<cffunction name="getText" access="remote" output="true" returntype="string">
		<cfargument name="token" required="true" type="string">
		<cfargument name="type" required="true" type="numeric">

		<cfstoredproc procedure="usp_GetTextValue" datasource="SDS">
			<cfprocparam cfsqltype="CF_SQL_IDSTAMP" value="#token#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#type#">

			<cfprocresult name="qText">
		</cfstoredproc>

		<cfreturn qText.SecureData>
	</cffunction>
</cfcomponent>