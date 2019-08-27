<html>
	<head>
		<!--- title set by a view - there is no default --->
		<title>Multi-Node Caching App</title>
	</head>
	<body>
		<cfoutput>
			<h1>Test Redirect: Node: #server.system.environment.DOCKER_TASK_SLOT#</h1>
			#body#</cfoutput>	<!--- body is result of views --->
		<hr />
		<cfscript>
			try {
				spreadsheetNew();
				cfSpreadsheetWorks=true;
			} catch (any e) {
				cfSpreadsheetWorks=false;
			}
			try {
				cachePut( id="foobar", value="value", cacheName="session" );
				redisWorks=true;
			} catch (any e) {
				redisWorks=false;
			}
			if (!structIsEmpty(form)) {
				session[form.key]=form.value;
			}
		</cfscript>
		<cfoutput>
			<pre>
				<!-- cfspreadsheet works?  #cfSpreadsheetWorks# -->
use redis?            #request.persistSessions#
redis functioning?    #redisWorks#
node number           #server.system.environment.DOCKER_TASK_SLOT#
host                  #server.system.environment.HOSTNAME#
			</pre>
			<ol>
				<li>Redis Commander: <a href="http://localhost:8081">http://localhost:8081</a></li>
				<!-- <li><a href="?reload">Reload app</a></li> -->
			</ol>
			<form action="." method="post">
				<label>session key <input type="text" name="key" /></label>
				<label>value <input type="text" name="value" /></label>
				<input type="submit" />
			</form>
			#dump(session)#
			#dump(var=rc, expand=false)#
			#dump(var=variables, expand=false)#
		</cfoutput>
	</body>
</html>