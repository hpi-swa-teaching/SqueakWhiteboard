Class {
	#name : #WBTextbox,
	#superclass : #WBElement,
	#instVars : [
		'borderSize',
		'textField',
		'doubleClickStepCounter',
		'doubleClickMaxStep'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:45'
}
WBTextbox class >> stepTime [

	^ 30
]

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
	#'squeak_changestamp' : 'is 6/2/2024 19:26'
}
WBTextbox >> deactivateTextbox [

	self currentHand releaseKeyboardFocus
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
	#'squeak_changestamp' : 'is 6/3/2024 15:36'
}
WBTextbox >> detectDoubleClick: evt [

	^false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:57'
}
WBTextbox >> doubleClickMaxStep [

	^ doubleClickMaxStep ifNil: [doubleClickMaxStep := 100]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:56'
}
WBTextbox >> doubleClickMaxStep: aCount [

	doubleClickMaxStep := aCount
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:52'
}
WBTextbox >> doubleClickStepCounter [

	^ doubleClickStepCounter ifNil: [doubleClickStepCounter := 0]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:52'
}
WBTextbox >> doubleClickStepCounter: aCount [

	doubleClickStepCounter := aCount
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
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/3/2024 16:05'
}
WBTextbox >> initialize [
	| textField |
	
	super initialize.
	self bounds: (0@0 extent: self defaultSize).
	textField := WBPluggableTextMorphPlus new.
	textField extent: self defaultSize - ((self borderSize * 2)@(self borderSize * 2)).
	self addMorphCentered: textField.
	self textField: textField.
	self startStepping
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 17:21'
}
WBTextbox >> mouseDown: evt [
	| time |
	time:=  evt timeStamp.
	self halt.
	
	self detectDoubleClick: evt.
	self doubleClickStepCounter: 0.
	super mouseDown: evt.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/2/2024 19:07'
}
WBTextbox >> rightClickFunctionality: evt [

	self canvas activeTextbox: self.
	self deactivateElement.
	self textField mouseDown: evt
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 17:17'
}
WBTextbox >> step [

	self doubleClickStepCounter + 1
	"self doubleClickStepCounter < (self doubleClickMaxStep)
		ifTrue: [self doubleClickStepCounter: self doubleClickStepCounter + 1.]
		ifFalse: [self Transcript show: 'Intervall überschritten';cr.]"
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 15:49'
}
WBTextbox >> stepTime [

	^ self class stepTime
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
