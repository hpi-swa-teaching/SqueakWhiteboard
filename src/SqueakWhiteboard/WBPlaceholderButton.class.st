"
The WBPlaceholderButton is a placeholder button without any actual functionality
"
Class {
	#name : #WBPlaceholderButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/19/2024 02:07'
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/19/2024 16:51'
}
WBPlaceholderButton >> clickFunctionality: anEvent [
	| randomGenerator randomInt |

	randomGenerator := Random new.
	randomInt := randomGenerator nextInt: 2.
	Transcript show: randomInt; cr.
	(randomInt = 1) 
		ifTrue: [self canvas spawnAnElement: WBRectangle new At: anEvent cursorPoint.]
		ifFalse: [self canvas spawnAnElement: WBTemporaryCircle new At: anEvent cursorPoint.]
		
						 
]
