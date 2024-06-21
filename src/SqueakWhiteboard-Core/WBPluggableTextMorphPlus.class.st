"
This is a custom version of the PluggableTextMorphPlus class
"
Class {
	#name : #WBPluggableTextMorphPlus,
	#superclass : #PluggableTextMorphPlus,
	#instVars : [
		'enabled',
		'element'
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
	#'squeak_changestamp' : 'is 6/17/2024 01:00'
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
	#'squeak_changestamp' : 'is 6/22/2024 00:20'
}
WBPluggableTextMorphPlus >> hasUnacceptedEdits: aBoolean [
	"overwrite hasUnacceptedEdits so that orange triangle doesn't appear"
	
	hasUnacceptedEdits := false

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/14/2024 00:09'
}
WBPluggableTextMorphPlus >> initialize [

	super initialize.
	self color: Color transparent;
		borderWidth: 0;
		retractable: true;
		wrapFlag: true
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/2/2024 18:30'
}
WBPluggableTextMorphPlus >> textMorphClass [

	^ WBTextMorphForEditView
]
