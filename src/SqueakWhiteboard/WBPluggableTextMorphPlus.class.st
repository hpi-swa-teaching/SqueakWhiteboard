"
This is a custom version of the PluggableTextMorphPlus class
"
Class {
	#name : #WBPluggableTextMorphPlus,
	#superclass : #PluggableTextMorphPlus,
	#instVars : [
		'enabled'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 6/1/2024 17:19'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/1/2024 18:20'
}
WBPluggableTextMorphPlus >> enabled [

	^ enabled ifNil: [enabled := false]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/1/2024 18:42'
}
WBPluggableTextMorphPlus >> enabled: aBoolean [

	enabled := aBoolean.
	super updateStyle
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/1/2024 19:25'
}
WBPluggableTextMorphPlus >> handlesMouseDown: evt [

	^ false"self enabled"
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
	#'squeak_changestamp' : 'is 6/1/2024 18:46'
}
WBPluggableTextMorphPlus >> initialize [

	super initialize.
	self color: Color transparent
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/1/2024 16:13'
}
WBPluggableTextMorphPlus >> textMorphClass [

	^ WBTextMorphForEditView
]
