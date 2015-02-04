component {
	this.name='TinyURL';
	this.sessionManagement=true;
	this.clientManagement = true;
	
		function onApplicationStart(){
		application.myName = 'Tiny URL';
		application.redisTinyURL =CreateObject("java", "RedisTinyUrl"); 
		application.redisTinyURL.init("localhost",6379,"http://localhost:8500/TinyURL",5);
		return true;		
	} 
     

}