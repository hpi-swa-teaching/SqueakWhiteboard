"
The WBTemporaryButton is a placeholder for functionality that is coming later
"
Class {
	#name : #WBTemporaryCircle,
	#superclass : #WBElement,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 15:59'
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
