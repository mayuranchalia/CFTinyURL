<cfparam name="form.submitted1" default="0" />
<cfparam name="form.submitted2" default="0" />
<cfparam name="form.longUrl" default="" />
<cfparam name="form.shortUrl" default="" />
<cfimport taglib="customtags/" prefix="layout" />
<layout:page section="delete">
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
	      <cfif form.submitted1>
			<cfif NOT len(trim(form.shortUrl))>
				<cfset ok = false />
			</cfif>
			<cfif !ok>
			<p><font color="red">Please enter tiny url.</font></p>
			  <cfelse>
			   <cfscript>
			   	msg=application.redisTinyURL.deleteTinytURL(#trim(form.shortUrl)#);
			   </cfscript>
			   <cfif NOT IsNull(msg)>
			   #msg#
			   <cfelse>
			   <p><font color="red">URL not found</font></p>
			   </cfif>
			</cfif>							
	   </cfif>

         <form id ="form" action="delete.cfm" class ="form-inline" method="post">
        <div class="control-group">
        	<td>
          <label class="control-label" for="text">Enter Tiny Url :</label> 		
        	</td>
        	<td >        	
          <input type="text" class="form-control" id ="shortUrl" name="shortUrl"  value="#form.shortUrl#"/>
            </td>
            <td >            
        <button type="submit" class="btn btn-danger">Delete !!</button>
            </td>
        <input type="hidden" name="submitted1" value="1" />
        </div>
      </form>
      </tr>
      	   	 <tr>
	      <cfif form.submitted2>
			<cfif NOT len(trim(form.longUrl))>
				<cfset ok = false />
			</cfif>
			<cfif !ok>
			<p><font color="red">Please enter long url.</font></p>
			  <cfelse>
			   <cfscript>
			   	msg=application.redisTinyURL.deleteLongURL(#trim(form.longUrl)#);
			   </cfscript>
			   <cfif NOT IsNull(msg)>
			   #msg#
			   <cfelse>
			   <p><font color="red">URL not found</font></p>
			   </cfif>
			</cfif>							
	   </cfif>

         <form id ="form" action="delete.cfm" class ="form-inline" method="post">
        <div class="control-group">
        	<td>
          <label class="control-label" for="text">Enter Long Url :</label> 		
        	</td>
        	<td >        	
          <input type="text" class="form-control" id ="longUrl" name="longUrl"  value="#form.longUrl#"/>
            </td>
            <td >            
        <button type="submit" class="btn btn-danger">Delete !!</button>
            </td>
        <input type="hidden" name="submitted2" value="1" />
        </div>
      </form>
      </tr>
	   	 </tbody>
	   </table>
	   </div>
	</cfoutput>
	</div>

</layout:page>