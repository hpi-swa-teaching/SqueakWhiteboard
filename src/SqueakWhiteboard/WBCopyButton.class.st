Class {
	#name : #WBCopyButton,
	#superclass : #WBPopUpButton,
	#category : #SqueakWhiteboard
}

{
	#category : #click,
	#'squeak_changestamp' : 'JK 5/27/2024 11:13'
}
WBCopyButton >> clickFunctionality: anEvent [

	self element deactivateElement.
	self canvas spawnAnElement: self element copy At: anEvent cursorPoint.
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
