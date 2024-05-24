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
	#'squeak_changestamp' : 'si 5/24/2024 13:04'
}
WBPlaceholderButton >> clickFunctionality: anEvent [
	| randomGenerator randomInt |

	"randomGenerator := Random new.
	randomInt := randomGenerator nextInt: 2.
	(randomInt = 1) 
		ifTrue: [self canvas spawnAnElement: WBRectangle new At: anEvent cursorPoint.]
		ifFalse: [self canvas spawnAnElement: WBCircle new At: anEvent cursorPoint.]"
	self canvas spawnAnElement: (WBNote newWithCanvas: self canvas) At: anEvent cursorPoint.
						 
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 09:58'
}
WBPlaceholderButton >> setDefaultValues [

]
