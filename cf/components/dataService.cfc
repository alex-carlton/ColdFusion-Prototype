<cfcomponent output="false">
	<!---
	<cfproperty name="greeting" type="string">
	<cfproperty name="notGreeting" type="string">
	<cfset this.greeting = "Hello" />
	<cfset variables.notGreeting = "No hello" />
	
	<cffunction name="insertReview" access="remote" output="true" returntype="boolean">
		<cfargument name="reviewName" required="true" type="string">
		<cfargument name="reviewFeedback" required="true" type="string">
		<cfargument name="reviewRating" required="true" type="numeric">
		<cfargument name="reviewProductId" required="true" type="numeric">

		<cfstoredproc procedure="uspAddReview" datasource="AllStar">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="50" value="#reviewName#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#reviewProductId#">
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" maxlength="3850" value="#reviewFeedback#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#reviewRating#">
		</cfstoredproc>

		<cfreturn true>
	</cffunction>
	--->
</cfcomponent>