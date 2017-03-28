component accessors="true" {
	property struct calledBoard ;
	property struct remainingBoard ;

	function init () {
		setCalledBoard({"B":[],"I":[],"N":[],"G":[],"O":[]}) ;
		setRemainingBoard(duplicate(application.baseBoard)) ;
		return this ;
	}

	public struct function pickRandomCoord() {
		//local.theIndex = len(variables.ramainingBoard) ;
		local.theNum = randRange(1, 75) ;
		local.theKey = "" ;

		for ( var k in getRemainingBoard() ) {
			if ( arrayContains(getRemainingBoard()[k], theNum) ) {
				theKey = k ;
			}
		}
		local.randomCoord = {"pKey":theKey,"pVal":theNum} ;


		removePick( local.randomCoord ) ;
		logPick( local.randomCoord ) ;
		return local.randomCoord ;
	}

	private void function removePick( required struct pick ) {
		arrayDeleteAt(getRemainingBoard()[arguments.pick.pKey], arrayFind(getRemainingBoard()[arguments.pick.pKey], arguments.pick.pVal)) ;
	}

	private void function logPick( required struct pick ) {
		if ( structKeyExists(getCalledBoard(), arguments.pick.pKey) ) {
			arrayAppend(getCalledBoard()[arguments.pick.pKey], arguments.pick.pVal) ;
			local.newPick = getCalledBoard()[arguments.pick.pKey] ;
			structUpdate(getCalledBoard(), arguments.pick.pKey, local.newPick) ;
		} else {
			structInsert(getCalledBoard(), arguments.pick.pKey, local.newPick) ;
		}
	}

	public struct function showPicks() {
		return getCalledBoard() ;
	}

	public void function resetBoard() {
		init() ;
	}


	public struct function structMerge( required struct sourceStruct, required struct destStruct ) {


	      // Loop Keys
	      for( local.key in arguments.sourceStruct ) {
	         // Find if the new key from sourceStruct Exists in destStruct
	         if( structKeyExists( arguments.destStruct, local.key) ) {
	            // If they are both structs, we need to merge those structs, too
	            if( isStruct( arguments.destStruct[ local.key ] ) and isStruct(arguments.sourceStruct[local.key] ) ) {
	               // Recursively call StructMerge to merge those structs
	               structMerge( arguments.destStruct[ local.key ], arguments.sourceStruct[ local.key ], arguments.overwrite ) ;
	            }
	            // We already checked that the key existed, now we just check if we can overwrite it
	            else if( arguments.overwrite ) {
	               arguments.destStruct[ local.key ] = arguments.sourceStruct[ local.key ];
	            }
	            // The unused case here is if Overwrite is false, in which case destStruct is not changed
	         }
	         // If it doesn't exist, you're free to merge
	         else {
	            arguments.destStruct[ local.key ] = arguments.sourceStruct[ local.key ];
	         }
	      }

	      return arguments.destStruct;
	   }

}