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
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 14:23'
}
WBTemporaryCircle >> initialize [

	super initialize.
	self
		cornerStyle: #rounded;
		cornerRadius: 100.
]
