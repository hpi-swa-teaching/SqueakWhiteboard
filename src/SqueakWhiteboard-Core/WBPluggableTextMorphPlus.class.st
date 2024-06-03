"
This is a custom version of the PluggableTextMorphPlus class
"
Class {
	#name : #WBPluggableTextMorphPlus,
	#superclass : #PluggableTextMorphPlus,
	#instVars : [
		'enabled'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/1/2024 17:19'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:26'
}
WBPluggableTextMorphPlus >> enabled [

	^ enabled ifNil: [enabled := false]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:28'
}
WBPluggableTextMorphPlus >> enabled: aBoolean [

	enabled := aBoolean
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:24'
}
WBPluggableTextMorphPlus >> handlesMouseDown: evt [

	^ self enabled
]

{
	#category : #styling,
	#'squeak_changestamp' : 'is 6/1/2024 17:18'
}
WBPluggableTextMorphPlus >> hasUnacceptedEdits: aBoolean [
	"don't delegate call to super so that orange triangle doesn't appear"
	 
	aBoolean ifTrue: [ self updateStyle ].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/2/2024 15:42'
}
WBPluggableTextMorphPlus >> initialize [

	super initialize.
	self color: Color transparent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/2/2024 19:37'
}
WBPluggableTextMorphPlus >> mouseDown: evt [
"transform rightclick evt into leftclick evt to invoke correct functionality in super class"
	| leftClickEvt |
	
	leftClickEvt := MouseButtonEvent newFrom: evt.
	leftClickEvt setType: leftClickEvt type position: leftClickEvt position which: 4 buttons: leftClickEvt class redButton hand: leftClickEvt hand stamp: leftClickEvt timeStamp.
	leftClickEvt := leftClickEvt transformBy: self.

	^ super mouseDown: leftClickEvt
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/2/2024 18:30'
}
WBPluggableTextMorphPlus >> textMorphClass [

	^ WBTextMorphForEditView
]
