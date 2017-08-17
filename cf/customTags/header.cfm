<cfparam name="attributes.title" default="ColdFusion-Prototype" >
<cfif thistag.executionMode EQ 'start'>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title><cfoutput>#attributes.title#</cfoutput></title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--<script type="text/javascript" src="/allstar/script/main.js"></script>-->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
<link href="/proto/styles/main.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>

<div id="wrapper">
  <div id="menu-bar">
    <div class="row">
      <div class="col s6">
        <ul class="menu">
          <li><a href="insert.cfml">Insert</a></li>
          <li><a href="search.cfml">Search</a></li>
          <li><a href="privileges.cfml">Data Access</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="container">
  <!---end of header--->
<cfelse>
	</div>	
  <!---begin of footer--->
</div>
</body>
</cfif>
</html>