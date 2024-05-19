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
		'canvas'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/18/2024 17:13'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/19/2024 16:36'
}
WBButton class >> newWithCanvas: aCanvas [

	WBButton basicNew initializeWithCanvas: aCanvas
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 16:08'
}
WBButton >> backgroundColor [

	^ backgroundColor
]

{
	#category : #layout,
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
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/19/2024 16:46'
}
WBButton >> clickFunctionality: anEvent [

	^ SubclassResponsibility
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 16:09'
}
WBButton >> clickedColor [

	^ clickedColor
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 16:08'
}
WBButton >> clickedColor: aColor [

	clickedColor := aColor.
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/19/2024 16:21'
}
WBButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 12:57'
}
WBButton >> initialize [

	^ super initialize
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
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 16:57'
}
WBButton >> margin [

	^ margin ifNil: [margin := 0]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 11:26'
}
WBButton >> margin: aMargin [

	^ margin := aMargin
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/19/2024 16:22'
}
WBButton >> mouseDown: anEvent [
	
	self color: clickedColor
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/19/2024 16:49'
}
WBButton >> mouseUp: anEvent [

	self color: backgroundColor.
	(self containsPoint: anEvent position) ifTrue: [self clickFunctionality: anEvent]
	
]
