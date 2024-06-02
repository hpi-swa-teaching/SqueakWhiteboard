Class {
	#name : #WBTextbox,
	#superclass : #WBElement,
	#instVars : [
		'borderSize',
		'textField'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/29/2024 01:00'
}
WBTextbox >> borderSize [

	^ borderSize ifNil: [borderSize := 10]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/29/2024 00:58'
}
WBTextbox >> borderSize: aSize [

	borderSize := aSize


]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/29/2024 01:11'
}
WBTextbox >> drawOn: aCanvas [

	| outerRectangle innerRectangle vertices |
	
	outerRectangle := self bounds.
   	innerRectangle := outerRectangle insetBy: self borderSize.
	
	vertices := {
            outerRectangle topLeft.
            outerRectangle topRight.
            outerRectangle bottomRight.
            outerRectangle bottomLeft.
		outerRectangle topLeft.
		innerRectangle topLeft.
            innerRectangle topRight.
            innerRectangle bottomRight.
            innerRectangle bottomLeft.
		innerRectangle topLeft.
        }.
	aCanvas drawPolygon: vertices color: self color borderWidth: 0 borderColor: Color black.



]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/29/2024 10:44'
}
WBTextbox >> extent: anExtent [
	
	textField ifNotNil: [textField extent: anExtent - (self borderSize * 2).].
	super extent: anExtent.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/29/2024 10:55'
}
WBTextbox >> initialize [
	| textField |
	super initialize.
	self bounds: (0@0 extent: self defaultSize).
	textField := TextFieldMorph new.
	textField contents: ''.
	"self halt."
	"textField borderStyle: (BorderStyle width: 5 color: Color green)."
	textField extent: self defaultSize - ((self borderSize * 2)@(self borderSize * 2)).
	"textField handlesMouseDown: false."
	
	self addMorphCentered: textField.
	self textField: textField
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 5/29/2024 10:35'
}
WBTextbox >> textField [

	^ textField
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 5/29/2024 10:35'
}
WBTextbox >> textField: aTextField [

	textField := aTextField
]
