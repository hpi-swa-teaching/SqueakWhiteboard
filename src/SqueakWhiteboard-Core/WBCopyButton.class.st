Class {
	#name : #WBCopyButton,
	#superclass : #WBPopUpButton,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #click,
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBCopyButton >> clickFunctionality: anEvent [
	self frame deactivateElement.
	self canvas spawnACopiedElement: self frame copy At: anEvent cursorPoint.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 23:47'
}
WBCopyButton >> setDefaultValues [

	super setDefaultValues.
	self
		backgroundColor: Color lightBlue muchDarker;
		clickedColor: Color lightBlue darker.
]
