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
	#'squeak_changestamp' : 'is 5/19/2024 16:59'
}
WBDeleteButton class >> newWithDefaultValues [

]

{
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/19/2024 17:04'
}
WBDeleteButton >> clickFunctionality [

	^ owner delete
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 17:01'
}
WBDeleteButton >> initializeWithDefaultValues [

	super initialize.
	self color: Color red;
		extent: 15@15;
		cornerStyle: #rounded;
		cornerRadius: 20
]
