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
	#category : #size,
	#'squeak_changestamp' : 'si 5/23/2024 22:47'
}
WBButton class >> cornerRadius [

	^20
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/19/2024 16:36'
}
WBButton class >> newWithCanvas: aCanvas [

	WBButton basicNew initializeWithCanvas: aCanvas
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'si 6/14/2024 12:34'
}
WBButton >> addImage [
	
	self image ifNotNil: [self addMorphCentered: self image]
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 12:21'
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
	#'squeak_changestamp' : 'si 6/14/2024 12:34'
}
WBButton >> block [

	^ block
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 12:34'
}
WBButton >> block: aBlock [

	block := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:32'
}
WBButton >> canvas: aCanvas [

	^ canvas := aCanvas
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
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/27/2024 19:26'
}
WBButton >> clickedColor [

	^ clickedColor ifNil: [clickedColor := self color muchDarker]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/19/2024 16:08'
}
WBButton >> clickedColor: aColor [

	clickedColor := aColor.
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
	#'squeak_changestamp' : 'is 5/19/2024 16:21'
}
WBButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/27/2024 19:55'
}
WBButton >> handlesMouseOver: evt [

	^ true
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/27/2024 20:04'
}
WBButton >> hoverColor [

	^ hoverColor ifNil: [hoverColor := self color muchLighter]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/27/2024 19:27'
}
WBButton >> hoverColor: aColor [

	hoverColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:47'
}
WBButton >> image [	
	
	^image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:47'
}
WBButton >> image: anImage [
	
	image := anImage
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 20:51'
}
WBButton >> initialize [

	super initialize.
	self setDefaultValues
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 16:35'
}
WBButton >> initializeWithCanvas: aCanvas [

	super initialize.
	self canvas: aCanvas
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'si 6/14/2024 12:35'
}
WBButton >> margin [ 

	^margin
	
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:57'
}
WBButton >> margin: aMargin [
		
	margin := aMargin.
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/14/2024 12:21'
}
WBButton >> mouseDown: anEvent [
	
	self color: self clickedColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/14/2024 12:21'
}
WBButton >> mouseEnter: evt [

	self color: self hoverColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/14/2024 12:21'
}
WBButton >> mouseLeave: evt [

	self color: self backgroundColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/14/2024 12:21'
}
WBButton >> mouseUp: anEvent [

	self color: self backgroundColor.
	(self containsPoint: anEvent position) ifTrue: [self clickFunctionality: anEvent]
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/14/2024 12:21'
}
WBButton >> setDefaultValues [

	self
		cornerStyle: #rounded;
		cornerRadius: self class cornerRadius;
		color: Color lightBlue
]
