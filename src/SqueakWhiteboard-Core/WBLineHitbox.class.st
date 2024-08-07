"
This class acts as the hitbox for a corresponding line and delegates all mouse events to it. Its size depends on the border size of itself.
"
Class {
	#name : #WBLineHitbox,
	#superclass : #PolygonMorph,
	#instVars : [
		'line'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'si 7/11/2024 15:30'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'si 7/11/2024 15:28'
}
WBLineHitbox class >> defaultBorderWidth [

	^ 20
]

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
	#'squeak_changestamp' : 'si 7/11/2024 15:31'
}
WBLineHitbox >> initialize [

	super initialize.
	self borderWidth: self class defaultBorderWidth.
	self borderColor: Color transparent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'ACL 7/11/2024 16:36'
}
WBLineHitbox >> isClickNearLine: aPoint [

	^ self point: aPoint isNearLineFrom: (self vertices first) to: (self vertices second) within: self borderWidth / 2
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
	#'squeak_changestamp' : 'si 7/11/2024 18:38'
}
WBLineHitbox >> mouseEnter: anEvent [

	self line mouseEnter: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/11/2024 18:40'
}
WBLineHitbox >> mouseLeave: anEvent [

	self line mouseLeave: anEvent
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
	#'squeak_changestamp' : 'ACL 7/10/2024 12:10'
}
WBLineHitbox >> point: p isNearLineFrom: p1 to: p2 within: distance [
	|slope b distanceToP|

	slope := (p2 y - p1 y) / (p2 x - p1 x).
	b := p1 y - (slope * p1 x).
	distanceToP := (((slope negated * p x) + (p y) - b) abs) / (slope * slope + 1) sqrt. 
	^ distanceToP <= distance
]
