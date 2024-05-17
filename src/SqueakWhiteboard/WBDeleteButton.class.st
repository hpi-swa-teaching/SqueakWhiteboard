"
The WBDeleteButton is a button which deletes the element that it is attached to
"
Class {
	#name : #WBDeleteButton,
	#superclass : #WBPopUp,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 20:42'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/15/2024 16:23'
}
WBDeleteButton >> initialize [

super initialize.
self color: Color red;
	extent: 15@15;
	cornerStyle: #rounded;
	cornerRadius: 20.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/17/2024 15:09'
}
WBDeleteButton >> mouseDown: anEvent [

	owner delete.
]
