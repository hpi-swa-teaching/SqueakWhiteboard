Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 5/27/2024 11:58'
}
WBColorButton >> clickFunctionality: anEvent [


	((owner owner element class == WBRectangle) | (owner owner element class == WBTemporaryCircle) | (owner owner element class == WBEdgeOfLine) | (owner owner element class == WBLine))
		ifTrue: [owner owner element color: self color]
		ifFalse: [self canvas globalColor: self color.
				owner delete.].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 23:12'
}
WBColorButton >> initialize [

	super initialize
]
