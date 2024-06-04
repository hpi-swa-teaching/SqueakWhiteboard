"
The WBTemporaryButton is a placeholder for functionality that is coming later
"
Class {
	#name : #WBCircle,
	#superclass : #WBElement,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/17/2024 15:59'
}

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/29/2024 01:29'
}
WBCircle >> drawOn: aCanvas [

	aCanvas fillOval: self bounds color: self color.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/4/2024 16:21'
}
WBCircle >> initialize [

	super initialize
]
