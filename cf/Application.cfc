<cfcomponent output="false">
	<cfset this.customTagPaths = expandPath('/ColdFusion-Prototype/cf/customTags') />
	<cfset application.ads="ADS">
	<cfset application.sds="SDS">

	<cffunction name="onApplicationStart" returntype="boolean" >
		<cfset application.dataService = createObject("component",'ColdFusion-Prototype.cf.components.dataService') />
		<cfset application.secureDataService = createObject('component', 'ColdFusion-Prototype.cf.components.secureDataService') />

		<cfset application.secureTypes = {
			ssn=1,
			dob=2,
			driversLicense=3,
			creditCardNumber=4,
			creditRequest=5
		}>	

		<cfreturn true />
	</cffunction>

	<cffunction name="onMissingTemplate">
		<cfoutput><p>Cannot get template.</p></cfoutput>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfif isDefined('url.restartApp')>
			<cfset this.onApplicationStart() />
		</cfif>
	</cffunction>			

	
</cfcomponent>