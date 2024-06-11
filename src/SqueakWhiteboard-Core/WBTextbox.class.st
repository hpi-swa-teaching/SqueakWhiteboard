"
This class is a hollow rectangular morph, that has a WBPluggableTextMorphPlus to display text
"
Class {
	#name : #WBTextbox,
	#superclass : #WBElement,
	#instVars : [
		'borderSize',
		'textField',
		'lastMouseClick',
		'doubleClickMaxDelta'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/3/2024 19:42'
}

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/29/2024 01:00'
}
WBTextbox >> borderSize [

	^ borderSize ifNil: [borderSize := 10]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/29/2024 00:58'
}
WBTextbox >> borderSize: aSize [

	borderSize := aSize


]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 17:56'
}
WBTextbox >> deactivateTextbox [

	self currentHand releaseKeyboardFocus.
	self textField enabled: false
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 6/1/2024 17:36'
}
WBTextbox >> defaultSize [

	^ 200@200
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/11/2024 20:39'
}
WBTextbox >> detectDoubleClick: evt [
	| delta |
	
	self lastMouseClick ifNotNil: [delta := evt timeStamp - self lastMouseClick timeStamp].
	(delta isNumber and: [delta < self doubleClickMaxDelta])
		ifTrue: [self textField enabled: true;
					mouseDown: evt.
				self deactivateElement.
				self canvas deactivateTextbox;
					activeTextbox: self].
			
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 17:48'
}
WBTextbox >> doubleClickMaxDelta [

	^ doubleClickMaxDelta ifNil: [doubleClickMaxDelta := 200]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 17:25'
}
WBTextbox >> doubleClickMaxDelta: aDelta [

	doubleClickMaxDelta := aDelta
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 6/3/2024 14:44'
}
WBTextbox >> drawOn: aCanvas [

	| outerRectangle innerRectangle vertices |
	
	outerRectangle := self bounds.
   	innerRectangle := outerRectangle insetBy: self borderSize.
	vertices := {
            outerRectangle topLeft.
            outerRectangle topRight.
            outerRectangle bottomRight.
            outerRectangle bottomLeft.
		outerRectangle topLeft.
		innerRectangle topLeft.
            innerRectangle topRight.
            innerRectangle bottomRight.
            innerRectangle bottomLeft.
		innerRectangle topLeft.
        }.
	aCanvas drawPolygon: vertices color: self color borderWidth: 0 borderColor: Color black.



]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/29/2024 10:44'
}
WBTextbox >> extent: anExtent [
	
	textField ifNotNil: [textField extent: anExtent - (self borderSize * 2).].
	super extent: anExtent.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 20:50'
}
WBTextbox >> handlesMouseDown: evt [
	
	^ (self textField enabled) not
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/4/2024 16:21'
}
WBTextbox >> initialize [
	| textField |
	
	super initialize.
	textField := WBPluggableTextMorphPlus new.
	textField extent: self defaultSize - ((self borderSize * 2)@(self borderSize * 2)).
	self addMorphCentered: textField.
	self textField: textField.
	self textField textbox: self
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 17:28'
}
WBTextbox >> lastMouseClick [

	^ lastMouseClick
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 17:29'
}
WBTextbox >> lastMouseClick: evt [

	lastMouseClick := evt

	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 20:44'
}
WBTextbox >> mouseDown: evt [
	
	super mouseDown: evt.
	self detectDoubleClick: evt;
		 lastMouseClick: evt.
	
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 5/29/2024 10:35'
}
WBTextbox >> textField [

	^ textField
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 5/29/2024 10:35'
}
WBTextbox >> textField: aTextField [

	textField := aTextField
]
