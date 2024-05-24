"
The WBPlaceholderButton is a placeholder button without any actual functionality
"
Class {
	#name : #WBToolbarButton,
	#superclass : #WBButton,
	#instVars : [
		'number'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/19/2024 02:07'
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 15:49'
}
WBToolbarButton >> clickFunctionality: anEvent [

	(self number = 1) 
		ifTrue: [self canvas spawnAnElement: WBRectangle new At: anEvent cursorPoint.].
	(self number = 2)
		ifTrue: [self canvas spawnAnElement: WBTemporaryCircle new At: anEvent cursorPoint.].
	(self number = 3)
		ifTrue: [self canvas spawnAnElement: WBLine new At: anEvent cursorPoint].
		
	
		
						 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 15:49'
}
WBToolbarButton >> number [
	
	^number
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 15:49'
}
WBToolbarButton >> number: anInteger [
	
	number := anInteger
]
