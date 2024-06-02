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
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/2/2024 15:11'
}
WBTextMorphForEditView >> mouseDown: evt [
	"transform rightclick evt into leftclick evt to invoke correct functionality in super class"
	| leftClickEvt |
	
	leftClickEvt := MouseButtonEvent newFrom: evt.
	leftClickEvt setType: leftClickEvt type  position: leftClickEvt position buttons: leftClickEvt class redButton hand: leftClickEvt hand.
	leftClickEvt := leftClickEvt transformBy: self.
	^ super mouseDown: leftClickEvt
	
]
