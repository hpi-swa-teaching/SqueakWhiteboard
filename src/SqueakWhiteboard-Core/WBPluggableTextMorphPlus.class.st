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
