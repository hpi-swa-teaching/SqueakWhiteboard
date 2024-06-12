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
		'canvas',
		'element',
		'number',
		'image'
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
	#'squeak_changestamp' : 'is 6/9/2024 15:55'
}
WBButton >> addImage [
	
	self image ifNil: [self addRightImage.].
	self image ifNotNil: [self addMorphCentered: self image]
	
	
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/9/2024 13:33'
}
WBButton >> addRightImage [
	| rectangleImage circleImage lineImage textboxImage |
	rectangleImage := (WBImage loadRectangleButtonImage).
	circleImage := (WBImage loadCircleButtonImage).
	lineImage := (WBImage loadLineButtonImage).
	textboxImage := (WBImage loadTextboxButtonImage).
	
	(self number = 1 and: rectangleImage notNil) ifTrue: [self image: (ImageMorph new image: 
		(self canvas images resize: rectangleImage to: self extent * 0.8)).].
	(self number = 2 and: circleImage notNil) ifTrue: [self image: (ImageMorph new image: 
		(self canvas images resize: circleImage to: self extent * 0.8)).].
	(self number = 3 and: lineImage notNil) ifTrue: [self image: (ImageMorph new image: 
		(self canvas images resize: lineImage to: self extent * 0.8)).].
	(self number = 4 and: textboxImage notNil) ifTrue: [self image: (ImageMorph new image: 
		(self canvas images resize: textboxImage to: self extent * 0.8)).].
	(self number = 5 and: rectangleImage notNil) ifTrue: [self image: (ImageMorph new image: 
		(self canvas images resize: rectangleImage to: self extent * 0.8)).]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 18:26'
}
WBButton >> backgroundColor [

	^ backgroundColor ifNil: [backgroundColor := Color gray]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:15'
}
WBButton >> backgroundColor: aColor [

	backgroundColor := aColor.
	self color: backgroundColor
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:32'
}
WBButton >> canvas [

	^ canvas
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
	#'squeak_changestamp' : 'is 5/19/2024 16:46'
}
WBButton >> clickFunctionality: anEvent [

	^ SubclassResponsibility
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
	#category : #deactivate,
	#'squeak_changestamp' : 'si 6/7/2024 22:19'
}
WBButton >> deactivateElement [
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 13:35'
}
WBButton >> element [

	^element
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 13:36'
}
WBButton >> element: anElement [

	element := anElement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:59'
}
WBButton >> function [
	
	^function
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:59'
}
WBButton >> function: aNumber [
	
	function := aNumber
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
	#'squeak_changestamp' : 'is 6/11/2024 19:05'
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
	#'squeak_changestamp' : 'is 5/19/2024 16:22'
}
WBButton >> mouseDown: anEvent [
	
	self color: clickedColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/27/2024 19:59'
}
WBButton >> mouseEnter: evt [

	self color: self hoverColor.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/27/2024 19:59'
}
WBButton >> mouseLeave: evt [

	self color: self backgroundColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/19/2024 18:36'
}
WBButton >> mouseUp: anEvent [

	self color: backgroundColor.
	(self containsPoint: anEvent position) ifTrue: [self clickFunctionality: anEvent]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/25/2024 11:16'
}
WBButton >> number [

	^number
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/25/2024 11:16'
}
WBButton >> number: anInteger [

	number := anInteger
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 11:10'
}
WBButton >> setDefaultValues [

	self
		cornerStyle: #rounded;
		cornerRadius: self class cornerRadius;
		clickedColor: self color darker.
]
