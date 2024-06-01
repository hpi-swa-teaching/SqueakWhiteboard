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
	#'squeak_changestamp' : 'is 6/1/2024 19:23'
}
WBTextMorphForEditView >> handlesMouseDown: evt [

	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/1/2024 20:25'
}
WBTextMorphForEditView >> mouseDown: evt [
	self halt."
	evt yellowButtonPressed ifTrue: [
		(self editor yellowButtonDown: evt) ifTrue:[^self].
		^ editView yellowButtonActivity: evt shiftPressed]."
	^ super mouseDown: MouseEvent new
	
]
