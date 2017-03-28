<cfset variables.bingo = new cfc.BingoCaller() >

<cfscript>
	//writeDump(variables.bingo.pickRandomCoord());
	//writeDump(variables.bingo.getCalledBoard()) ;
	//writeDump(variables.bingo.getRemainingBoard()) ;

	//writeDump(variables.bingo.showPicks()) ;
	//writeDump(application.baseBoard) ;
	for (i=0;i<10;i++) {
		writeDump(variables.bingo.drawBall()) ;
	}
	//writeDump(variables.bingo.showPicks()) ;
	writeDump(variables.bingo.test());
</cfscript>

