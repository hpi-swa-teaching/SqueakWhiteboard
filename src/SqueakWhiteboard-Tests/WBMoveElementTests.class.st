Class {
	#name : #WBMoveElementTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 16:05'
}
WBMoveElementTests >> canvas [
	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 16:05'
}
WBMoveElementTests >> canvas: anObject [
	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'JK 6/3/2024 16:05'
}
WBMoveElementTests >> setUp [

	self canvas: WBCanvas new.

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/4/2024 00:56'
}
WBMoveElementTests >> tearDown [

	self canvas ifNotNil: [self canvas owner delete]
]