Class {
	#name : #WBImage,
	#superclass : #ImageMorph,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #loadImages,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 14:39'
}
WBImage class >> loadCircleButtonImage [
	
	^((GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/circle.png')
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 14:47'
}
WBImage class >> loadColorsButtonImage [

	^((GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/colorsToolbar.png')
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 14:43'
}
WBImage class >> loadLineButtonImage [

	^((GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/line.png')
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 13:38'
}
WBImage class >> loadRectangleButtonImage [

	^((GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/square2.png')
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 13:34'
}
WBImage >> initialize [

	super initialize
]

{
	#category : #edit,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 14:13'
}
WBImage >> resize: anImage to: anExtent [
	|resizedImage|
	
	resizedImage := Form extent: anExtent depth: anImage depth.
	resizedImage := anImage scaledToSize: anExtent.
	^resizedImage
]
