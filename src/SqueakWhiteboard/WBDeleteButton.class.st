"
The WBDeleteButton is a button that deletes the element that it is attached to
"
Class {
	#name : #WBDeleteButton,
	#superclass : #WBButton,
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
	#'squeak_changestamp' : 'is 5/19/2024 18:36'
}
WBDeleteButton >> clickFunctionality: anEvent [
	
	^ owner delete
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
	#'squeak_changestamp' : 'ACL 5/22/2024 19:27'
}
WBDeleteButton >> setDefaultValues [

	self backgroundColor: Color red;
		clickedColor: Color red muchDarker;
		extent: 15@15;
		cornerStyle: #rounded;
		cornerRadius: 20
]
