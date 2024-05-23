Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/23/2024 17:10'
}
WBColorButton >> clickFunctionality: anEvent [

	(owner owner) color: self color.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/23/2024 17:00'
}
WBColorButton >> getOwner [

	^self owner.	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/23/2024 15:43'
}
WBColorButton >> initialize [

	super initialize.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/23/2024 16:28'
}
WBColorButton >> setDefaultValues [

	self
		extent: 15@15;
		cornerStyle: #rounded;
		cornerRadius: 20
		
]
