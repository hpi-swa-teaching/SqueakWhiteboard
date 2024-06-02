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
	#category : #editing,
	#'squeak_changestamp' : 'is 6/1/2024 16:54'
}
WBTextMorphForEditView >> acceptContents [

	self updateFromParagraph.
]

{
	#category : #editing,
	#'squeak_changestamp' : 'is 6/1/2024 17:01'
}
WBTextMorphForEditView >> cancelEditsSafely [
	
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/2/2024 15:06'
}
WBTextMorphForEditView >> handlesMouseDown: evt [

	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/2/2024 18:35'
}
WBTextMorphForEditView >> setDefaultContentsIfNil [
	"Set the default contents"

	| toUse |
	text ifNil:
		[toUse := self valueOfProperty: #defaultContents.
		toUse ifNil: [toUse :='' asText "allBold"].	"try it plain for a while"
		text := toUse]
]
