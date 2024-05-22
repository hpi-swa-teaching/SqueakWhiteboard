"
The WBDeleteButton is a button that deletes the element that it is attached to
"
Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/19/2024 18:04'
}
WBColorButton class >> newWithDefaultValues [

	WBDeleteButton basicNew initializeWithDefaultValues
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'ACL 5/22/2024 16:57'
}
WBColorButton >> clickFunctionality: anEvent [
	
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 16:55'
}
WBColorButton >> initializeWithDefaultValues [

	super initialize.
	self setDefaultValues.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 16:59'
}
WBColorButton >> setDefaultValues [

	self color: Color black;
		extent: 15@15;
		cornerStyle: #rounded;
		cornerRadius: 20
]
