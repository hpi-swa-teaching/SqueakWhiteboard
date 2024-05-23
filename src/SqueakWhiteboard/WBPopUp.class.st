"
The WBPopUp is a menu that opens up when clicking on an element that is in the canvas
"
Class {
	#name : #WBPopUp,
	#superclass : #Morph,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 20:40'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 19:08'
}
WBPopUp >> handlesMouseDown: anEvent [

	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 23:07'
}
WBPopUp >> initialize [

	super initialize.
]
