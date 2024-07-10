Class {
	#name : #WBLineHitbox,
	#superclass : #PolygonMorph,
	#instVars : [
		'line'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'nicloeser 7/10/2024 11:47'
}
WBLineHitbox >> containsPoint: aPoint [ 

        ^ self isClickNearLine: aPoint
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/5/2024 12:23'
}
WBLineHitbox >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/5/2024 14:09'
}
WBLineHitbox >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 7/7/2024 17:42'
}
WBLineHitbox >> initialize [

	super initialize.
	self borderWidth: 20.
	self borderColor: Color transparent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'nicloeser 7/10/2024 12:00'
}
WBLineHitbox >> isClickNearLine: aPoint [

	^ self point: aPoint isNearLineFrom: (self vertices at: 1) to: (self vertices at: 2) within: self borderWidth / 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/7/2024 17:33'
}
WBLineHitbox >> line [

	^ line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/7/2024 17:33'
}
WBLineHitbox >> line: anElement [

	line := anElement
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:35'
}
WBLineHitbox >> mouseDown: anEvent [

	self line mouseDown: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:49'
}
WBLineHitbox >> mouseEnter: anEvent [

	self line edges do: [:d | d morph color: self line morph borderColor]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:46'
}
WBLineHitbox >> mouseLeave: anEvent [

	self line edges do: [:d | d morph color: Color transparent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 18:05'
}
WBLineHitbox >> mouseMove: anEvent [

	self line mouseMove: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 18:17'
}
WBLineHitbox >> mouseUp: anEvent [

	self line mouseUp: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 15:11'
}
WBLineHitbox >> point: p isNearLineFrom: p1 to: p2 within: distance [
	|slope b distanceToP|
	"compute slope"
	slope := (p2 y - p1 y)/(p2 x - p1 x).
	
	"compute b for line"
	b := p1 y - (slope * p1 x).
	
	"compute distance to p"
	distanceToP := (((slope negated * p x) + (p y) - b) abs) / (slope * slope + 1) sqrt. 
	^ distanceToP <= distance. 
]
