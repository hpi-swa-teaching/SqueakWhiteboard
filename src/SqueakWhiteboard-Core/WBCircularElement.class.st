Class {
	#name : #WBCircularElement,
	#superclass : #WBElement,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 18:07'
}
WBCircularElement >> initialize [

	super initialize.
	self morph borderWidth: 0
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 18:06'
}
WBCircularElement >> initializeElement [

	^ EllipseMorph new
]
