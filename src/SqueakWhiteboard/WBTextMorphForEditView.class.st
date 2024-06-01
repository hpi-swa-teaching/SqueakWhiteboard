"
This is a custom version of the TextMorphForEditView class
"
Class {
	#name : #WBTextMorphForEditView,
	#superclass : #TextMorphForEditView,
	#category : #SqueakWhiteboard,
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
	#'squeak_changestamp' : 'is 6/1/2024 17:27'
}
WBTextMorphForEditView >> handlesMouseDown: evt [

	^ false
]
