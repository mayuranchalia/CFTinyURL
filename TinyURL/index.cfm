<!--- Please insert your code here 				<cfoutput >#application.redisTinyURL.getTinyURL("www.yahoo.com")#</cfoutput> --->
<cfparam name="form.submitted" default="0" />
<cfparam name="form.longUrl" default="" />
<cfparam name="form.shortUrl" default="" />
<cfparam name="form.redirected" default="0" />
<cfparam name="form.days" default="0" />
<cfparam name="form.hours" default="0" />
<cfparam name="form.minutes" default="0" />
<cfparam name="form.seconds" default="0" />
<cfparam name="form.gettinyurlsubmit" default="0" />
<cfparam name="form.getlongurlsubmit" default="0" />
<cfparam name="form.getlongurl" default="" />
<cfparam name="form.gettinyurl" default="" />
<cfimport taglib="customtags/" prefix="layout" />

<layout:page section="home">
	<div class="container-fluid">
	<div class="page-header">
		<h1>
			Adobe Tiny URL <small>Make URLs Short !!!</small>
		</h1>
	</div>
	<cfoutput >
	 <div id="respond">

	   <table class="table-condensed" >
	   	 <tbody>
	   	 	 <tr>
	   	 		 	<cfset ok = true />
		<cfif form.submitted>
			
			<cfif NOT len(trim(form.longUrl))>
				<cfset ok = false />
				<p><font color="red">Please enter long url.</font></p>
			</cfif>
			<cfif (len(trim(form.days)) GTE 1 AND len(trim(form.days)) LTE 3) AND  (NOT isNumeric(form.days))>
				<cfset ok = false />
				<p><font color="red">Days field should be numeric.</font></p>
			</cfif>
			<cfif (len(trim(form.hours)) GTE 1 AND len(trim(form.hours)) LTE 2) AND  (NOT isNumeric(form.hours))>
				<cfset ok = false />
				<p><font color="red">Hours field should be numeric.</font></p>
			</cfif>
			<cfif (len(trim(form.minutes)) GTE 1 AND len(trim(form.minutes)) LTE 2) AND  (NOT isNumeric(form.minutes))>
				<cfset ok = false />
				<p><font color="red">Minutes field should be numeric.</font></p>
			</cfif>
			<cfif (len(trim(form.seconds)) GTE 1 AND len(trim(form.seconds)) LTE 2) AND  (NOT isNumeric(form.seconds))>
				<cfset ok = false />
				<p><font color="red">Seconds field should be numeric.</font></p>
			</cfif>
			<cfif !ok>
				<p><font color="red">Please resolve the above errors.</font></p>
			  <cfelse>
		
			   <cfscript>
			   	tinyURL=application.redisTinyURL.shortenURL(form.longUrl,form.days,form.hours,form.minutes,form.seconds);
			   </cfscript>

			   <cfif NOT IsNull(tinyURL)>
			   <p><font color="blue">#tinyURL#</font></p>
			   <cfelse>
			   <p><font color="red">URL not found</font></p>
			   </cfif>
			</cfif>							
	   </cfif>	 	
      <form id ="form" action="index.cfm" class ="form-inline" method="post">
        <div class="control-group">
        	<td >
          <label class="control-label" for="text">Enter Long Url to shorten :</label>
          	</td>
          	<td>
             <input type="text" class="form-control" id ="longUrl" name="longUrl"  value="#form.longUrl#"/>
          	</td>
          	<td>
          		<label class="control-label" for="text">Time to live from now.</label>
          	</td>
          		
          	<td >
          		
			<table style="width:250px; border: 2px solid black">
				<thead>
      			<tr style="border: 2px solid black;">
        		<th>Days</th>
        		<th>Hours</th>
        		<th>Minutes</th>
         		<th>Seconds</th>
     			 </tr>
    			</thead>
    		<tbody>
          		<tr>		
          	<td >
				 <input  type="text" class="form-control" id ="days" name="days" maxlength="3" value="#form.days#" />
			</td>
			<td >
				 <input  type="text" class="form-control" id ="hours" name="hours" maxlength="2" value="#form.hours#" />
			</td>
			<td >				
				 <input  type="text" class="form-control" id ="minutes" name="minutes" maxlength="2"  value="#form.minutes#"/>
			</td>
			<td >				
				 <input  type="text" class="form-control" id ="seconds" name="seconds" maxlength="2" value="#form.seconds#" />
			</td>
			 	
          		</tr>
          		</tbody>
          	</table>
         <td >
	       		 <button type="submit" class="btn btn-primary">Make Url Tiny !!</button>        	
	       		 </td>

	          	 
	</td>
       		
        	<input type="hidden" name="submitted" value="1" />
        </div>
      </form>
      </tr>
	<tr>
	      <cfif form.redirected>
			<cfif NOT len(trim(form.shortUrl))>
				<cfset ok = false />
			</cfif>
			<cfif !ok>
			<p><font color="red">Please enter tiny url.</font></p>
			  <cfelse>
			   <cfscript>
			   	longURL="http://"&application.redisTinyURL.getLongURL(#trim(form.shortUrl)#);
			   </cfscript>
			   <cfif NOT IsNull(longURL)>
			   	<cflocation url=#longURL# statuscode="302" />
			   #longURL#
			   <cfelse>
			   <p><font color="red">URL not found</font></p>
			   </cfif>
			</cfif>							
	   </cfif>

         <form id ="form" action="index.cfm" class ="form-inline" method="post">
        <div class="control-group">
        	<td>
          <label class="control-label" for="text">Enter Tiny Url to redirect :</label> 		
        	</td>
        	<td >        	
          <input type="text" class="form-control" id ="shortUrl" name="shortUrl"  value="#form.shortUrl#"/>
            </td>
            <td >            
        <button type="submit" class="btn btn-primary">Redirect !!</button>
            </td>
        <input type="hidden" name="redirected" value="1" />
        </div>
      </form>
      </tr>
      
      <tr>
	      <cfif form.gettinyurlsubmit>
			<cfif NOT len(trim(form.getlongurl))>
				<cfset ok = false />
			</cfif>
			<cfif !ok>
			<p><font color="red">Please enter long url.</font></p>
			  <cfelse>
			   <cfscript>
			   	shortUrl=application.redisTinyURL.getTinyURL(#trim(form.getlongurl)#);
			   </cfscript>
			   <cfif NOT IsNull(shortUrl)>
			   <p><font color="blue">#shortUrl#</font></p>
			   <cfelse>
			   <p><font color="red">URL not found</font></p>
			   </cfif>
			</cfif>							
	   </cfif>

         <form id ="form" action="index.cfm" class ="form-inline" method="post">
        <div class="control-group">
        	<td>
          <label class="control-label" for="text">Enter Long Url :</label> 		
        	</td>
        	<td >        	
          <input type="text" class="form-control" id ="getlongurl" name="getlongurl"  value="#form.getlongurl#"/>
            </td>
            <td >            
        <button type="submit" class="btn btn-primary">Get Tiny Url !!</button>
            </td>
        <input type="hidden" name="gettinyurlsubmit" value="1" />
        </div>
      </form>
      </tr>
       <tr>
	      <cfif form.getlongurlsubmit>
			<cfif NOT len(trim(form.gettinyurl))>
				<cfset ok = false />
			</cfif>
			<cfif !ok>
			<p><font color="red">Please enter tiny url.</font></p>
			  <cfelse>
			   <cfscript>
			   	longUrl=application.redisTinyURL.getLongURL(#trim(form.gettinyurl)#);
			   </cfscript>
			   <cfif NOT IsNull(longUrl)>
			   <p><font color="blue">#longUrl#</font></p>
			   <cfelse>
			   <p><font color="red">URL not found</font></p>
			   </cfif>
			</cfif>							
	   </cfif>

         <form id ="form" action="index.cfm" class ="form-inline" method="post">
        <div class="control-group">
        	<td>
          <label class="control-label" for="text">Enter Tiny Url :</label> 		
        	</td>
        	<td >        	
          <input type="text" class="form-control" id ="gettinyurl" name="gettinyurl"  value="#form.gettinyurl#"/>
            </td>
            <td >            
        <button type="submit" class="btn btn-primary">Get Long Url !!</button>
            </td>
        <input type="hidden" name="getlongurlsubmit" value="1" />
        </div>
      </form>
      </tr>
      </tbody>
      </table>
   	</cfoutput>
      </div>
	</div>
</layout:page>