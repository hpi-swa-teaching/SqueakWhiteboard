"
This is a custom version of the TextMorphForEditView class
"
Class {
	#name : #WBTextMorphForEditView,
	#superclass : #TextMorphForEditView,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/1/2024 17:19'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 20:35'
}
WBTextMorphForEditView >> handlesKeyboard: evt [
	
	^ self editView enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 20:38'
}
WBTextMorphForEditView >> handlesMouseDown: evt [

	^ self editView enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 19:38'
}
WBTextMorphForEditView >> keyStroke: evt [
	"When esc is pressed, the focus from the textfield should be removed"
	| char |
	
	((char := evt keyCharacter) = Character escape) ifTrue: 
		[self editView textbox deactivateTextbox].
	super keyStroke: evt
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/3/2024 19:38'
}
WBTextMorphForEditView >> setDefaultContentsIfNil [
	"Set the default contents"

	| toUse |
	text ifNil:
		[toUse := self valueOfProperty: #defaultContents.
		toUse ifNil: [toUse :='' asText].
		text := toUse]
]
