Class {
	#name : #WBTextbox,
	#superclass : #WBElement,
	#instVars : [
		'borderSize',
		'textField'
	],
	#category : #'SqueakWhiteboard-Core'
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
	#'squeak_changestamp' : 'is 6/1/2024 17:36'
}
WBTextbox >> defaultSize [

	^ 200@200
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
	#'squeak_changestamp' : 'is 6/1/2024 18:44'
}
WBTextbox >> initialize [
	| textField |
	super initialize.
	self bounds: (0@0 extent: self defaultSize).
	textField := WBPluggableTextMorphPlus new.
	textField extent: self defaultSize - ((self borderSize * 2)@(self borderSize * 2)).
	self addMorphCentered: textField.
	self textField: textField
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/1/2024 20:16'
}
WBTextbox >> rightClickFunctionality: evt [

	self textField textMorph mouseDown: evt
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