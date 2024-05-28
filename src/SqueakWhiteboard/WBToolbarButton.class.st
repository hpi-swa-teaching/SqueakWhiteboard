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
	#'squeak_changestamp' : 'nicloeser 5/27/2024 09:37'
}
WBToolbarButton >> clickFunctionality: anEvent [

	(self number = 1) 
		ifTrue: [self canvas spawnAnElement: WBRectangle new At: anEvent cursorPoint.].
	(self number = 2)
		ifTrue: [self canvas spawnAnElement: WBTemporaryCircle new At: anEvent cursorPoint.].
	(self number = 3)
		ifTrue: [self canvas spawnAnElement: WBLine new At: anEvent cursorPoint].
		
	
		
						 
]
