"
The WBToolbar is a menu from which different functionalities can be invoked
"
Class {
	#name : #WBToolbar,
	#superclass : #Morph,
	#instVars : [
		'canvas',
		'toolbarHeight',
		'toolbarWidth'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/18/2024 17:12'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/18/2024 18:33'
}
WBToolbar class >> newWithCanvas: aCanvas [

	^ WBToolbar basicNew initializeWithCanvas: aCanvas
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 00:56'
}
WBToolbar >> backgroundColor [

	^ Color gray
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 19:44'
}
WBToolbar >> backgroundColor: aColor [

	^ Color gray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 16:05'
}
WBToolbar >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 16:05'
}
WBToolbar >> canvas: aCanvas [

	canvas := aCanvas
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 00:56'
}
WBToolbar >> initialize [

	super initialize.
	self color: self backgroundColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 00:55'
}
WBToolbar >> initializeWithCanvas: aCanvas [
	
	self initialize;
		canvas: aCanvas;
		toolbarHeight: aCanvas extent y * 0.75;
		toolbarWidth: aCanvas extent x * 0.1;
		center: (canvas bounds origin x + self extent x / 2) @ 
			(canvas bounds origin y + ((canvas bounds corner y - canvas bounds origin y))/2)
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 17:16'
}
WBToolbar >> toolbarHeight [

	^ toolbarHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 18:41'
}
WBToolbar >> toolbarHeight: aNumber [

	toolbarHeight := aNumber.
	self updateDimensions
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 17:17'
}
WBToolbar >> toolbarWidth [

	^ toolbarWidth
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 19:41'
}
WBToolbar >> toolbarWidth: aNumber [

	toolbarWidth := aNumber.
	self updateDimensions.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 19:15'
}
WBToolbar >> updateDimensions [

	self toolbarHeight ifNotNil: [self height:  self toolbarHeight].
	self toolbarWidth ifNotNil: [self width: self toolbarWidth]
]
