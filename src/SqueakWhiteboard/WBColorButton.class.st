Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 5/23/2024 23:44'
}
WBColorButton >> clickFunctionality: anEvent [

	owner owner element color: self color.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 23:12'
}
WBColorButton >> initialize [

	super initialize
]
