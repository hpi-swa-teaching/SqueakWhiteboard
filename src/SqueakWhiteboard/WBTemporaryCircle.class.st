Class {
	#name : #WBTemporaryCircle,
	#superclass : #WBElement,
	#category : #SqueakWhiteboard
}

{
	#category : #initialisation,
	#'squeak_changestamp' : 'si 5/16/2024 18:54'
}
WBTemporaryCircle >> initialize [

	super initialize.
	self
		cornerStyle: #rounded;
		cornerRadius: 100;
		color: Color green
]
