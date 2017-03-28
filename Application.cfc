component {
	this.name = "CFBingo" ;
	this.applicationTimeout = createTimeSpan(0, 1, 0, 0) ;
	this.root = getDirectoryFromPath( getCurrentTemplatePath() ) ;
	this.sessionManagement = "true" ;
	this.sessionTimeout = createTimeSpan(0, 1, 0, 0) ;

	public boolean function onApplicationStart() {
		application.baseBoard = {
			"B":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] ,
			"I":[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30] ,
			"N":[31,32,33,34,35,36,37,38,39,40,41,42,43,44,45] ,
			"G":[46,47,48,49,50,51,52,53,54,55,56,57,58,59,60] ,
			"O":[61,62,63,64,65,66,67,68,69,70,71,72,73,74,75]
		} ;
		return true ;
	}

	public boolean function OnRequestStart(required string TargetPage){
		return true ;
	}

	public void function OnRequest(required string TargetPage){
		include arguments.TargetPage ;
	}

/*
	public void function OnError(required any Exception, required string EventName){
		writedump(arguments.Exception) ;
	}
*/
}