<cfcomponent rest="true" restpath="service"  >     
    <cffunction name="getTinyUrl" restPath="getTinyUrl/{longUrl}" access="remote"  returntype="String" httpmethod="GET" > 
    	<cfargument name="longUrl" type="string" restargsource="Path"> 
        <cfset rest = application.redisTinyURL.getTinyURL(longUrl)> 
        <cfif NOT isDefined("rest")>
        	<cfreturn "NA">
        </cfif>
        <cfreturn rest>  
    </cffunction> 
    <cffunction name="getLongUrl" restPath="getLongUrl/{tinyUrl}" access="remote" returntype="String" httpmethod="GET" output="true"  > 
    	<cfargument name="tinyUrl" type="string" restargsource="Path"  > 
        <cfset rest = application.redisTinyURL.getLongURL(tinyUrl)> 
        <cfif NOT isDefined("rest")>
        	<cfreturn "NA">
        </cfif>
        <cfreturn rest> 
    </cffunction>
    <cffunction name="deleteLongUrl" restPath="deleteLongUrl/{longUrl}" access="remote" returntype="String" httpmethod="GET"> 
    	<cfargument name="longUrl" type="string" restargsource="Path"> 
        <cfset rest = application.redisTinyURL.deleteLongURL(longUrl)> 
        <cfif NOT isDefined("rest")>
        	<cfreturn "NA">
        </cfif>
        <cfreturn rest> 
    </cffunction>
    <cffunction name="deleteTinyUrl" restPath="deleteTinyUrl/{tinyUrl}" access="remote" returntype="String" httpmethod="GET" reponses=[{},{}]> 
    	<cfargument name="tinyUrl" type="string" restargsource="Path" > 
        <cfset rest = application.redisTinyURL.deleteTinytURL(tinyUrl)> 
        <cfif NOT isDefined("rest")>
        	<cfreturn "NA">
        </cfif>
        <cfreturn rest> 
    </cffunction>
    <cffunction name="getMessage" restPath="getMessage" access="remote" returntype="Any" httpmethod="GET"> 
    	<cfargument name="targetUser" type="string" restargsource="Query"> 
        <cfset rest = #targetUser#> 
        <cfif NOT isDefined("rest")>
        	<cfreturn "NA">
        </cfif>
        <cfreturn rest> 
    </cffunction>
    <cffunction name="makeTinyUrl" restPath="makeTinyUrl" access="remote" returntype="String" httpmethod="GET"> 

    	<cfargument name="longUrl" type="string" restargsource="Query"> 
    	<cfargument name="days" type="numeric" restargsource="Query"> 
    	<cfargument name="hours" type="numeric" restargsource="Query"> 
    	<cfargument name="minutes" type="numeric" restargsource="Query">   
    	<cfargument name="seconds" type="numeric" restargsource="Query">  	 
    	<cfif NOT isdefined("days")>
    		<cfset days=0>
    	</cfif>
    	<cfif NOT isdefined("hours")>
    		<cfset hours=0>
    	</cfif>
    	<cfif NOT isdefined("minutes")>
    		<cfset minutes=0>
    	</cfif>
    	<cfif NOT isdefined("seconds")>
    		<cfset seconds=0>
    	</cfif>
        <cfset rest = application.redisTinyURL.shortenURL(longUrl,days,hours,minutes,seconds)> 
        <cfif NOT isDefined("rest")>
        	<cfreturn "NA">
        </cfif>
        <cfreturn rest> 
    </cffunction>
</cfcomponent>