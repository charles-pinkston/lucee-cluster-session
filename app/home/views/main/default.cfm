<cfoutput>
	<p>Click the button below to hit a function that will set a variable and call a fw/1 redirect back to this main function.</p>
	<form action="#buildURL('home:main.testredirect')#" method="POST">
		<input type="hidden" name="currentNode" value="#server.system.environment.DOCKER_TASK_SLOT#">
		<input type="submit" name="testRedirectAction" value="Test Redirect">
	</form>
</cfoutput>