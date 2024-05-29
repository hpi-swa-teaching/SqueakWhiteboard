"
The WBPlaceholderButton is a placeholder button without any actual functionality
"
Class {
	#name : #WBToolbarButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/19/2024 02:07'
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/29/2024 01:27'
}
WBToolbarButton >> clickFunctionality: anEvent [

	(self number = 1) 
		ifTrue: [self canvas spawnAnElement: WBRectangle new At: anEvent cursorPoint.].
	(self number = 2)
		ifTrue: [self canvas spawnAnElement: WBCircle new At: anEvent cursorPoint.].
	(self number = 3)
		ifTrue: [self canvas spawnAnElement: WBLine new At: anEvent cursorPoint].
	(self number = 4)
		ifTrue: [self canvas spawnAnElement: WBTextbox new At: anEvent cursorPoint].
		
	
		
						 
]
