Class {
	#name : #WBTextbox,
	#superclass : #WBElement,
	#instVars : [
		'borderSize'
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
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/29/2024 01:25'
}
WBTextbox >> initialize [

	super initialize.
	self bounds: (0@0 extent: self defaultSize@self defaultSize)
]
