Class {
	#name : #WBxButton,
	#superclass : #WBPopUp,
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/15/2024 16:23'
}
WBxButton >> initialize [

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
WBxButton >> mouseDown: anEvent [

	owner delete.
]
