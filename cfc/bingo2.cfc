component {
	variables.baseboard = {
		'B':[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] ,
		'I':[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30] ,
		'N':[31,32,33,34,35,36,37,38,39,40,41,42,43,44,45] ,
		'G':[46,47,48,49,50,51,52,53,54,55,56,57,58,59,60] ,
		'O':[61,62,63,64,65,66,67,68,69,70,71,72,73,74,75]
	} ;

	function init () {
		variables.calledBoard = [] ;
		variables.remainingBoard= [] ;
		for (var i = 1; i LTE 75; i++) {
			arrayAppend(variables.remainingBoard,i);
		}
		return this ;
	}

	public Any function pickRandomCoord() {
		local.remBoard = variables.remainingBoard;
		local.theIndex = randRange( 1, arrayLen(local.remBoard) ) ;
		local.theNum = local.remBoard[theIndex] ;
		local.theKey = "" ;

		for ( var k in variables.baseboard ) {
			if ( arrayContains(variables.baseboard[k], local.theNum) ) {
				theKey = k ;
			}
		}
		local.randomCoord = {"pKey":local.theKey,"pVal":local.theNum,"idx":theIndex} ;

		removePick( local.theNum ) ;
		logPick( local.theNum ) ;

		return local.randomCoord ;
	}

	private void function removePick( required numeric pick ) {
		arrayDeleteAt(variables.remainingBoard, arrayFind(variables.remainingBoard, arguments.pick)) ;
	}

	private void function logPick( required numeric pick ) {
		arrayAppend(variables.calledBoard, arguments.pick) ;
	}

	public Any function showPicks() {
		return variables.calledBoard ;
	}

	public void function resetBoard() {
		init() ;
	}

	function test() {
		a1 = variables.calledBoard;
		a2 = variables.remainingBoard;
		return {a1:a1,a2:a2} ;
	}
}