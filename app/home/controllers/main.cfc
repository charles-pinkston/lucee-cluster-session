component accessors="true" {

    property beanFactory;
    property formatterService;
	property DataManipulationLibService;

	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public void function default( rc ) {

	}

	public void function testredirect(rc){
		arguments.rc.nodeMessage = 'From Node: #arguments.rc.currentNode# - Processed on Node: ' & server.system.environment.DOCKER_TASK_SLOT & ' - current y' & ' - time: #now()#';
		arguments.rc.dmls = DataManipulationLibService;
		variables.fw.redirect(action ='home:main.default', preserve="all");
	}

}
