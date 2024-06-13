"
The WBButton is the parent class of all button versions
"
Class {
	#name : #WBButton,
	#superclass : #Morph,
	#instVars : [
		'margin',
		'backgroundColor',
		'clickedColor',
		'hoverColor',
		'block',
		'image',
		'currentEvent'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/18/2024 17:13'
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
	#'squeak_changestamp' : 'si 6/13/2024 00:14'
}
WBButton >> backgroundColor [

	^ backgroundColor ifNil: [backgroundColor := Color lightBlue]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 00:14'
}
WBButton >> backgroundColor: aColor [

	backgroundColor := aColor.
	self color: aColor
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
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/13/2024 10:59'
}
WBButton >> clickFunctionality: anEvent [

	self currentEvent: anEvent.
	self block value: self
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
	#'squeak_changestamp' : 'si 6/13/2024 10:58'
}
WBButton >> currentEvent [

	^ currentEvent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 10:58'
}
WBButton >> currentEvent: anObject [

	currentEvent := anObject
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/12/2024 21:48'
}
WBButton >> deactivateElement [
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
	#'squeak_changestamp' : 'si 6/12/2024 22:23'
}
WBButton >> mouseDown: anEvent [
	
	self color: self clickedColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/12/2024 22:18'
}
WBButton >> mouseEnter: evt [

	self color: self hoverColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/12/2024 22:19'
}
WBButton >> mouseLeave: evt [

	self color: self backgroundColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/12/2024 22:23'
}
WBButton >> mouseUp: anEvent [

	self color: self backgroundColor.
	(self containsPoint: anEvent position) ifTrue: [self clickFunctionality: anEvent]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/12/2024 22:12'
}
WBButton >> setDefaultValues [

	self
		cornerStyle: #rounded;
		cornerRadius: self class cornerRadius;
		color: Color lightBlue
]
