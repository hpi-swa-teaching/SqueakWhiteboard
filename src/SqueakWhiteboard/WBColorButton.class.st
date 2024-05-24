Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard
}

{
	#category : #clicking,
	#'squeak_changestamp' : 'ACL 5/24/2024 15:59'
}
WBColorButton >> clickFunctionality: anEvent [


	((owner owner element class == WBRectangle) | (owner owner element class == WBTemporaryCircle))
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
