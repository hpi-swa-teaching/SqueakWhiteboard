Class {
	#name : #WBDynamicTextbox,
	#superclass : #WBElement,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/25/2024 16:33'
}
WBDynamicTextbox >> initialize [

	super initialize.
	self setDefaultContentsIfNil
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/25/2024 15:35'
}
WBDynamicTextbox >> initializeElement [

	^ TextMorph new
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/25/2024 16:21'
}
WBDynamicTextbox >> initializeTextfield [

]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/25/2024 16:36'
}
WBDynamicTextbox >> setDefaultContentsIfNil [
	| toUse |
	
	self morph text ifNil:
		[toUse := self morph valueOfProperty: #defaultContents.
		toUse ifNil: [toUse :='Moin!' asText].
		self morph contents: toUse]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/25/2024 16:14'
}
WBDynamicTextbox >> supportsText: aBoolean [

	supportsText := aBoolean
]
