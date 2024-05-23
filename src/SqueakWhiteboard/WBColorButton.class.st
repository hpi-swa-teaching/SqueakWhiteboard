Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:12'
}
WBColorButton >> clickFunctionality: anEvent [

	owner owner color: self color.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 15:43'
}
WBColorButton >> initialize [

	super initialize.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:13'
}
WBColorButton >> setDefaultValues [

	self
		extent: 15@15;
		cornerStyle: #rounded;
		cornerRadius: 20.
		
]
