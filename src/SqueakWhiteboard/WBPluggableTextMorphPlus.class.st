"
This is a custom version of the PluggableTextMorphPlus class
"
Class {
	#name : #WBPluggableTextMorphPlus,
	#superclass : #PluggableTextMorphPlus,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 6/1/2024 17:19'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/1/2024 17:28'
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
	#'squeak_changestamp' : 'is 6/1/2024 16:11'
}
WBPluggableTextMorphPlus >> initializeTextMorph [

	textMorph := self textMorphClass new
		margins: self class textMargins;
		setEditView: self;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		setProperty: #indicateKeyboardFocus toValue: #never;
		yourself.
		
	LegacyShortcutsFilter legacyShortcutsEnabled
		ifTrue: [textMorph addKeyboardCaptureFilter: LegacyShortcutsFilter].

]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/1/2024 16:13'
}
WBPluggableTextMorphPlus >> textMorphClass [

	^ WBTextMorphForEditView
]
