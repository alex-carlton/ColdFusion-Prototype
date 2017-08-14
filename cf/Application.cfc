<cfcomponent output="false">
	<cfset this.customTagPaths = expandPath('/ColdFusion-Prototype/cf/customTags') />
	<!---<cfset application.dsname="">--->
	<!---<cfset request.dsname="">--->

	<cffunction name="onApplicationStart" returntype="boolean" >
		<cfset application.dataService = createObject("component",'ColdFusion-Prototype.cf.components.dataService') />

		<cfreturn true />
	</cffunction>

	<cffunction name="onMissingTemplate">
		<cfoutput><p>Cannot get template.</p></cfoutput>
	</cffunction>

	<cffunction name="onRequestStart">
	</cffunction>			

	
</cfcomponent>