<cfif thisTag.executionMode eq "start" >
<cfparam name="attributes.section" default="" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Adobe Tiny URL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    	 <link rel="icon" href="images/favicon.ico" type="image/x-icon">

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 30px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <script src="assets/js/jquery-2.1.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
  </head>

  <body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 	<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span></button> 
					 	<a class="navbar-brand" href="http://www.adobe.com" target="_blank" >Adobe</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li  <cfif attributes.section eq "home">class="active"</cfif>>
							<a href="index.cfm">Home</a>
						</li>
						<li <cfif attributes.section eq "delete">class="active"</cfif>>
							<a href="delete.cfm">Delete Urls</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="#">Link</a>
						</li>
					</ul>
				</div>
				
			</nav>
		</div>
	</div>
</div>
	<cfelse>
  </body>
</html>
</cfif>