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
	#'squeak_changestamp' : 'is 6/12/2024 11:08'
}
WBPluggableTextMorphPlus >> enabled: aBoolean [

	enabled := aBoolean.
	aBoolean
		 ifTrue: [self showScrollBars]
		ifFalse: [self hideScrollBars]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 20:23'
}
WBPluggableTextMorphPlus >> handlesKeyboard: evt [

	^ self enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 20:20'
}
WBPluggableTextMorphPlus >> handlesMouseDown: evt [

	^ self enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 21:29'
}
WBPluggableTextMorphPlus >> handlesMouseOver: evt [

	^ false
]

{
	#category : #styling,
	#'squeak_changestamp' : 'is 6/4/2024 20:41'
}
WBPluggableTextMorphPlus >> hasUnacceptedEdits: aBoolean [
	"don't delegate call to super so that orange triangle doesn't appear"
	
	aBoolean ifTrue: [ self updateStyle ].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/12/2024 19:20'
}
WBPluggableTextMorphPlus >> initialize [

	super initialize.
	self color: Color transparent;
		borderWidth: 0;
		retractable: true
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/2/2024 18:30'
}
WBPluggableTextMorphPlus >> textMorphClass [

	^ WBTextMorphForEditView
]
