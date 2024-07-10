"
This is a custom version of the PluggableTextMorphPlus class
"
Class {
	#name : #WBPluggableTextMorphPlus,
	#superclass : #PluggableTextMorphPlus,
	#instVars : [
		'enabled',
		'element',
		'onChanged'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/1/2024 17:19'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:41'
}
WBPluggableTextMorphPlus >> element [

	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:40'
}
WBPluggableTextMorphPlus >> element: anElement [

	element := anElement
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:26'
}
WBPluggableTextMorphPlus >> enabled [

	^ enabled ifNil: [enabled := false]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:47'
}
WBPluggableTextMorphPlus >> enabled: aBoolean [

	enabled := aBoolean.
	aBoolean
		ifTrue: [self showScrollBars]
		ifFalse: 
			[self hideScrollBars.
			self owner currentHand releaseKeyboardFocus]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JK 6/30/2024 15:34'
}
WBPluggableTextMorphPlus >> handleKeystroke: anEvent [

	super handleKeystroke: anEvent.
	self onChanged value
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:48'
}
WBPluggableTextMorphPlus >> handlesKeyboard: anEvent [

	^ self enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:48'
}
WBPluggableTextMorphPlus >> handlesMouseDown: anEvent [

	^ self enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:49'
}
WBPluggableTextMorphPlus >> handlesMouseOver: anEvent [

	^ false
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'nicloeser 7/10/2024 11:48'
}
WBPluggableTextMorphPlus >> hasUnacceptedEdits: aBoolean [
"overwrite hasUnacceptedEdits so that orange triangle doesn't appear"
	
	hasUnacceptedEdits := false

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 6/30/2024 15:34'
}
WBPluggableTextMorphPlus >> initialize [

	super initialize.
	self color: 
		Color transparent;
		borderWidth: 0;
		retractable: true;
		wrapFlag: true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/30/2024 15:59'
}
WBPluggableTextMorphPlus >> onChanged [

	^ onChanged
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/30/2024 15:59'
}
WBPluggableTextMorphPlus >> onChanged: anObject [

	onChanged := anObject
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/2/2024 18:30'
}
WBPluggableTextMorphPlus >> textMorphClass [

	^ WBTextMorphForEditView
]
