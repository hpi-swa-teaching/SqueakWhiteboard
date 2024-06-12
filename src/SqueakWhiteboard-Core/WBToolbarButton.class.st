"
The WBPlaceholderButton is a placeholder button without any actual functionality
"
Class {
	#name : #WBToolbarButton,
	#superclass : #WBButton,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/19/2024 02:07'
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'is 6/12/2024 20:56'
}
WBToolbarButton >> clickFunctionality: anEvent [

	(self number = 1) 
		ifTrue: [self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: anEvent].
	(self number = 2)
		ifTrue: [self canvas spawnAnElement: (WBCircle newWithCanvas: self canvas) At: anEvent].
	(self number = 3)
		ifTrue: [self canvas spawnAnElement: WBLine new At: anEvent].
	(self number = 4)
		ifTrue: [self canvas spawnAnElement: (WBTextbox newWithCanvas: self canvas) At: anEvent].
	(self number = 5)
		ifTrue: [self canvas spawnAnElement: (WBNote newWithCanvas: self canvas) At: anEvent].
		
	
		
						 
]
