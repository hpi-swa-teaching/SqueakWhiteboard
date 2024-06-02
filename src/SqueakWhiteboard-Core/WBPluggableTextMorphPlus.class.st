"
This is a custom version of the PluggableTextMorphPlus class
"
Class {
	#name : #WBPluggableTextMorphPlus,
	#superclass : #PluggableTextMorphPlus,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/1/2024 17:19'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/2/2024 15:10'
}
WBPluggableTextMorphPlus >> handlesMouseDown: evt [

	^ false
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
	#'squeak_changestamp' : 'is 6/2/2024 15:31'
}
WBPluggableTextMorphPlus >> mouseDown: evt [
"transform rightclick evt into leftclick evt to invoke correct functionality in super class"
	| leftClickEvt |
	
	leftClickEvt := MouseButtonEvent newFrom: evt.
	leftClickEvt setType: leftClickEvt type  position: leftClickEvt position buttons: leftClickEvt class redButton hand: leftClickEvt hand.
	leftClickEvt := leftClickEvt transformBy: self.
	^ super mouseDown: leftClickEvt
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/1/2024 16:13'
}
WBPluggableTextMorphPlus >> textMorphClass [

	^ WBTextMorphForEditView
]
