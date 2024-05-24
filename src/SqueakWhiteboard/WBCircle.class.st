"
The WBTemporaryButton is a placeholder for functionality that is coming later
"
Class {
	#name : #WBCircle,
	#superclass : #WBElement,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 15:59'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 10:07'
}
WBCircle >> initialize [

	super initialize.
	self
		cornerStyle: #rounded;
		cornerRadius: 100;
		extent: 50 @ 50;
		color: Color green
]
