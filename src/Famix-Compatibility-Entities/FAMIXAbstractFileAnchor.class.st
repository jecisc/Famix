Class {
	#name : #FAMIXAbstractFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAbstractFileAnchor class >> annotation [

	<FMClass: #AbstractFileAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-File' }
FAMIXAbstractFileAnchor >> <= aFileAnchor [
	^ self fileName <= aFileAnchor fileName
]

{ #category : #'Famix-File' }
FAMIXAbstractFileAnchor >> correspondingFile [
	"file pointed to by this source anchor, ideally this value should never be nil for file-based systems"
	<FMProperty: #correspondingFile type: #FAMIXFile>
	<FMComment: 'File associated to this source anchor'>
	^ self privateState attributeAt: #correspondingFile ifAbsent: [ nil ]
]

{ #category : #'Famix-File' }
FAMIXAbstractFileAnchor >> correspondingFile: aFAMIXFile [
	self privateState attributeAt: #correspondingFile put: aFAMIXFile
]

{ #category : #'Moose-Finder' }
FAMIXAbstractFileAnchor >> intervalAsCharPos [
	self subclassResponsibility
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> sourceText [
	self subclassResponsibility
]
