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
	#'squeak_changestamp' : 'is 7/12/2024 20:28'
}
WBTextMorphForEditView >> keyStroke: anEvent [
	| char |
	
	((char := anEvent keyCharacter) = Character escape) ifTrue: 
		[self editView element canvas deactivateTextbox].
	super keyStroke: anEvent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'nicloeser 7/10/2024 12:03'
}
WBTextMorphForEditView >> setDefaultContentsIfNil [
	| toUse |
	
	self text ifNil:
		[toUse := self valueOfProperty: #defaultContents.
		toUse ifNil: [toUse :='' asText].
		text := toUse]
]
