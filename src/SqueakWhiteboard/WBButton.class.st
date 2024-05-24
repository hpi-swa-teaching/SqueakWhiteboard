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
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:08'
}
WBButton >> backgroundColor [

	^ backgroundColor
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
	#category : #clicking,
	#'squeak_changestamp' : 'is 5/19/2024 16:46'
}
WBButton >> clickFunctionality: anEvent [

	^ SubclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:09'
}
WBButton >> clickedColor [

	^ clickedColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 16:08'
}
WBButton >> clickedColor: aColor [

	clickedColor := aColor.
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
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:57'
}
WBButton >> margin [ 
	^margin
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/24/2024 14:57'
}
WBButton >> margin: aMargin [
		
	margin := aMargin.
	
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
