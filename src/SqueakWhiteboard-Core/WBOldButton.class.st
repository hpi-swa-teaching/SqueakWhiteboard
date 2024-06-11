"
The WBButton is the parent class of all button versions
"
Class {
	#name : #WBOldButton,
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
WBOldButton class >> cornerRadius [

	^20
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/19/2024 16:36'
}
WBOldButton class >> newWithCanvas: aCanvas [

	WBButton basicNew initializeWithCanvas: aCanvas
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/9/2024 15:55'
}
WBOldButton >> addImage [
	
	self image ifNil: [self addRightImage.].
	self image ifNotNil: [self addMorphCentered: self image]
	
	
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/9/2024 13:33'
}
WBOldButton >> addRightImage [
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
WBOldButton >> backgroundColor [

	^ backgroundColor ifNil: [backgroundColor := Color gray]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:15'
}
WBOldButton >> backgroundColor: aColor [

	backgroundColor := aColor.
	self color: backgroundColor
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:32'
}
WBOldButton >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:32'
}
WBOldButton >> canvas: aCanvas [

	^ canvas := aCanvas
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/19/2024 16:46'
}
WBOldButton >> clickFunctionality: anEvent [

	^ SubclassResponsibility
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/27/2024 19:26'
}
WBOldButton >> clickedColor [

	^ clickedColor ifNil: [clickedColor := self color muchDarker]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/19/2024 16:08'
}
WBOldButton >> clickedColor: aColor [

	clickedColor := aColor.
]

{
	#category : #deactivate,
	#'squeak_changestamp' : 'si 6/7/2024 22:19'
}
WBOldButton >> deactivateElement [
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 13:35'
}
WBOldButton >> element [

	^element
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 13:36'
}
WBOldButton >> element: anElement [

	element := anElement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:59'
}
WBOldButton >> function [
	
	^function
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:59'
}
WBOldButton >> function: aNumber [
	
	function := aNumber
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/19/2024 16:21'
}
WBOldButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/27/2024 19:55'
}
WBOldButton >> handlesMouseOver: evt [

	^ true
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/27/2024 20:04'
}
WBOldButton >> hoverColor [

	^ hoverColor ifNil: [hoverColor := self color muchLighter]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/27/2024 19:27'
}
WBOldButton >> hoverColor: aColor [

	hoverColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:47'
}
WBOldButton >> image [	
	
	^image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:47'
}
WBOldButton >> image: anImage [
	
	image := anImage
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 20:51'
}
WBOldButton >> initialize [

	super initialize.
	self setDefaultValues
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 16:35'
}
WBOldButton >> initializeWithCanvas: aCanvas [

	super initialize.
	self canvas: aCanvas
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:57'
}
WBOldButton >> margin [ 
	^margin
	
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:57'
}
WBOldButton >> margin: aMargin [
		
	margin := aMargin.
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/19/2024 16:22'
}
WBOldButton >> mouseDown: anEvent [
	
	self color: clickedColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/27/2024 19:59'
}
WBOldButton >> mouseEnter: evt [

	self color: self hoverColor.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/27/2024 19:59'
}
WBOldButton >> mouseLeave: evt [

	self color: self backgroundColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/19/2024 18:36'
}
WBOldButton >> mouseUp: anEvent [

	self color: backgroundColor.
	(self containsPoint: anEvent position) ifTrue: [self clickFunctionality: anEvent]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/25/2024 11:16'
}
WBOldButton >> number [

	^number
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/25/2024 11:16'
}
WBOldButton >> number: anInteger [

	number := anInteger
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 11:10'
}
WBOldButton >> setDefaultValues [

	self
		cornerStyle: #rounded;
		cornerRadius: self class cornerRadius;
		clickedColor: self color darker.
]
