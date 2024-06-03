Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBColorButton >> clickFunctionality: anEvent [


	((owner owner frame class == WBRectangle) | (owner owner frame class == WBCircle) | (owner owner frame class == WBEdgeOfLine) | (owner owner frame class == WBLine) | (owner owner frame class == WBTextbox))
		ifTrue: [owner owner frame color: self color]
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
