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
	#'squeak_changestamp' : 'is 6/23/2024 02:02'
}
WBTextMorphForEditView >> handlesKeyboard: anEvent [
	
	^ self editView enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 02:02'
}
WBTextMorphForEditView >> handlesMouseDown: anEvent [

	^ self editView enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 02:03'
}
WBTextMorphForEditView >> keyStroke: anEvent [
	"When esc is pressed, the focus from the textfield should be removed"
	| char |
	
	((char := anEvent keyCharacter) = Character escape) ifTrue: 
		[self editView element canvas deactivateTextbox]. "hurts law of demeter. Should be refactored in the near future"
	super keyStroke: anEvent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/25/2024 16:28'
}
WBTextMorphForEditView >> setDefaultContentsIfNil [
	| toUse |
	
	text ifNil:
		[toUse := self valueOfProperty: #defaultContents.
		toUse ifNil: [toUse :='' asText].
		text := toUse]
]
