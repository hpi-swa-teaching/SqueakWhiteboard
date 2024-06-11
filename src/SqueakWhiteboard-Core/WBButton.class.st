Class {
	#name : #WBButton,
	#superclass : #Morph,
	#instVars : [
		'margin',
		'backgroundColor',
		'clickedColor',
		'hoverColor',
		'canvas',
		'creator',
		'block',
		'image',
		'currentCursorPoint'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:53'
}
WBButton class >> cornerRadius [

	^20
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'si 6/11/2024 17:54'
}
WBButton class >> newWithCanvas: aCanvas [

	WBButton basicNew initializeWithCanvas: aCanvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:28'
}
WBButton >> addImage [

	self addMorphCentered: self image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:56'
}
WBButton >> backgroundColor [

	^ backgroundColor ifNil: [backgroundColor := Color gray]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:21'
}
WBButton >> backgroundColor: aColor [

	backgroundColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:25'
}
WBButton >> block [

	^ block
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:26'
}
WBButton >> block: aBlock [

	block := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:22'
}
WBButton >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:23'
}
WBButton >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/11/2024 18:07'
}
WBButton >> clickFunctionality: anEvent [

	self block value: anEvent cursorPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:56'
}
WBButton >> clickedColor [

	^ clickedColor ifNil: [clickedColor := self color muchDarker]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:22'
}
WBButton >> clickedColor: aColor [

	clickedColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:25'
}
WBButton >> creator [

	^ creator
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:25'
}
WBButton >> creator: anElement [

	creator := anElement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:49'
}
WBButton >> currentCursorPoint [

	^ currentCursorPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:49'
}
WBButton >> currentCursorPoint: aPoint [

	currentCursorPoint := aPoint
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/11/2024 17:29'
}
WBButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/11/2024 17:29'
}
WBButton >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:55'
}
WBButton >> hoverColor [

	^ hoverColor ifNil: [hoverColor := self color muchLighter]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:22'
}
WBButton >> hoverColor: aColor [

	hoverColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:26'
}
WBButton >> image [

	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:26'
}
WBButton >> image: anImage [

	image := anImage
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/11/2024 17:47'
}
WBButton >> initialize [

	super initialize.
	self setDefaultValues
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/11/2024 17:47'
}
WBButton >> initializeWithCanvas: aCanvas [

	super initialize.
	self canvas: aCanvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:21'
}
WBButton >> margin [

	^ margin
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/11/2024 17:19'
}
WBButton >> margin: aPoint [

	margin := aPoint
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/11/2024 17:29'
}
WBButton >> mouseDown: anEvent [
	
	self color: clickedColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/11/2024 17:29'
}
WBButton >> mouseEnter: evt [

	self color: self hoverColor.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/11/2024 17:29'
}
WBButton >> mouseLeave: evt [

	self color: self backgroundColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/11/2024 17:30'
}
WBButton >> mouseUp: anEvent [

	self color: backgroundColor.
	(self containsPoint: anEvent position) ifTrue: [self clickFunctionality: anEvent]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/11/2024 17:47'
}
WBButton >> setDefaultValues [

	self
		cornerStyle: #rounded;
		cornerRadius: self class cornerRadius;
		clickedColor: self color darker.
]
