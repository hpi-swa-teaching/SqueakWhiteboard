Class {
	#name : #WBCopyButton,
	#superclass : #WBPopUpButton,
	#category : #SqueakWhiteboard
}

{
	#category : #click,
	#'squeak_changestamp' : 'si 5/27/2024 11:03'
}
WBCopyButton >> clickFunctionality: anEvent [

	self element removeElementPopUp.
	self canvas spawnACopiedElement: self element copy At: anEvent cursorPoint.
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
