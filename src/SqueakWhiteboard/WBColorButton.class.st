Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 6/3/2024 18:43'
}
WBColorButton >> clickFunctionality: anEvent [


	((owner owner element class == WBNote) |(owner owner element class == WBRectangle) | (owner owner element class == WBCircle) | (owner owner element class == WBEdgeOfLine) | (owner owner element class == WBLine) | (owner owner element class == WBTextbox))
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
