"
This class represents a generic button which takes in blocks that get executed on mouseUp
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
		'currentMouseEvent'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:12'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/11/2024 12:12'
}
WBButton class >> defaultCornerRadius [

	^ 20
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
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/10/2024 13:23'
}
WBButton >> clickFunctionality: anEvent [

	self currentMouseEvent: anEvent.
	self block value: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/27/2024 19:26'
}
WBButton >> clickedColor [

	^ clickedColor ifNil: [clickedColor := self color muchDarker]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:15'
}
WBButton >> clickedColor: aColor [

	clickedColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/10/2024 13:21'
}
WBButton >> currentMouseEvent [

	^ currentMouseEvent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/10/2024 13:21'
}
WBButton >> currentMouseEvent: anEvent [

	currentMouseEvent := anEvent
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
	#'squeak_changestamp' : 'is 6/23/2024 01:16'
}
WBButton >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/27/2024 20:04'
}
WBButton >> hoverColor [

	^ hoverColor ifNil: [hoverColor := self color muchLighter]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/27/2024 19:27'
}
WBButton >> hoverColor: aColor [

	hoverColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 12:50'
}
WBButton >> image [	
	
	^ image
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
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 12:51'
}
WBButton >> margin [ 

	^ margin
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:16'
}
WBButton >> margin: aMargin [
		
	margin := aMargin
	
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
	#'squeak_changestamp' : 'is 6/23/2024 01:17'
}
WBButton >> mouseLeave: anEvent [

	self color: self backgroundColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/15/2024 13:33'
}
WBButton >> mouseUp: anEvent [

	self color: self backgroundColor.
	(self containsPoint: anEvent position) ifTrue: [self clickFunctionality: anEvent]
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 7/11/2024 12:11'
}
WBButton >> setDefaultValues [

	self
		cornerStyle: #rounded;
		cornerRadius: self class defaultCornerRadius;
		color: Color lightBlue
]
