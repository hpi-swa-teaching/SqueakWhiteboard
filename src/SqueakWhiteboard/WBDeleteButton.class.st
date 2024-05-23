"
The WBDeleteButton is a button that deletes the element that it is attached to
"
Class {
	#name : #WBDeleteButton,
	#superclass : #WBPopUpButton,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/19/2024 02:07'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/19/2024 18:04'
}
WBDeleteButton class >> newWithDefaultValues [

	WBDeleteButton basicNew initializeWithDefaultValues
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 5/23/2024 22:23'
}
WBDeleteButton >> clickFunctionality: anEvent [
	
	^ element delete.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 16:55'
}
WBDeleteButton >> initializeWithDefaultValues [

	super initialize.
	self setDefaultValues.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 21:29'
}
WBDeleteButton >> setDefaultValues [

	super setDefaultValues.
	self backgroundColor: Color red;
		clickedColor: Color red muchDarker.
]
