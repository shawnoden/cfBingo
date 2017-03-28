component {

	public BingoCaller function init () {
		session.calledBoard = [] ;
		session.remainingBoard = [] ;
			structEach(application.baseBoard,function(key,value){arrayAppend(session.remainingBoard,value, true);}) ;
		return this ;
	}

	remote Any function drawBall() {
		local.remBoard = session.remainingBoard ;
		local.theIndex = randRange( 1, arrayLen(local.remBoard) ) ;
		local.theNum = local.remBoard[theIndex] ;
		local.theKey = findKey(local.theNum) ?: "";

		local.randomCoord = {"pKey":local.theKey,"pVal":local.theNum,"idx":theIndex} ;

		removePick( local.theNum, local.remBoard ) ;
		logPick( local.theNum, local.remBoard  ) ;

		return serializeJSON(local.randomCoord) ;
	}

	private Any function findKey( required string inVal ) {
		local.theKey = "" ;
		for ( var k in application.baseBoard ) {
			if ( arrayContains(application.baseBoard[k], arguments.inVal) ) {
				local.theKey = k ;
			}
		}
		return local.theKey ;
	}

	private void function removePick( required numeric pick ) {
		arrayDeleteAt(session.remainingBoard, arrayFind(session.remainingBoard, arguments.pick)) ;
	}

	private void function logPick( required numeric pick ) {
		arrayAppend(session.calledBoard, arguments.pick) ;
	}

	remote Any function showPicks() {
		return serializeJSON(session.calledBoard) ;
	}

	remote void function resetBoard() {
		init() ;
	}

	public Any function test() {
		return {"remain":session.remainingBoard,"picks":session.calledBoard} ;
	}
}