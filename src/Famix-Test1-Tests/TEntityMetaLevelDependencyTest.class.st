Class {
	#name : #TEntityMetaLevelDependencyTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'c2',
		'c3',
		'm1',
		'm2',
		'm3',
		'anchor1',
		'anchor2',
		'anchor3',
		'anchorC1',
		'a1'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
TEntityMetaLevelDependencyTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	m3 := FamixTest1Method named: 'method3'.
	a1 := FamixTest1Attribute named: 'attribute1'.
	anchor1 := FamixTest1SourceTextAnchor new source: 'method1\source1' withCRs .
	anchor2 := FamixTest1SourceTextAnchor new source: 'method2\source2a\source2b' withCRs.
	anchor3 := FamixTest1SourceTextAnchor new source: 'method3\source3a\source3b\source3c' withCRs.
	anchorC1 := FamixTest1SourceTextAnchor new source: 'Class1 definition' withCRs.
	
	model addAll: { c1. c2. m1. m2. m3. a1. anchor1. anchor2 }.
	
	c1 addMethod: m1.
	m2 parentType: c2. "opposite way"
	c2 addMethod: m3.
	c1 addAttribute: a1.
	c1 sourceAnchor: anchorC1.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3.

]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAddAllChildrenIn [
	| aCollection |
	aCollection := Set new.
	c1 addAllChildrenIn: aCollection.
	self assertCollection: aCollection hasSameElements: {m1 . a1}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAddAllParentsIn [

	| aCollection |
	
	aCollection := Set new.
	m1 addAllParentsIn: aCollection.
	self assertCollection: aCollection hasSameElements: { c1 }.
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllAtScope [

	| aCollection |
	
	aCollection := m1 allAtScope: FamixTMethod.
	self assertCollection: aCollection hasSameElements: { m1 }.
	aCollection := m1 allAtScope: FamixTest1Method.
	self assertCollection: aCollection hasSameElements: { m1 }.

	aCollection := m1 allAtScope: FamixTClass.
	self assertCollection: aCollection hasSameElements: { c1 }.
	aCollection := m1 allAtScope: FamixTest1Class.
	self assertCollection: aCollection hasSameElements: { c1 }.
	
	aCollection := m1 allAtScope: FamixTest1SourceAnchor.
	self assertCollection: aCollection hasSameElements: { }.
	
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllChildren [
	self assertCollection: c1 allChildren hasSameElements: {m1 . a1}.
	self assertCollection: c2 allChildren hasSameElements: {m2 . m3}.
	self assertCollection: m1 allChildren hasSameElements: {}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllChildrenTypes [
	self
		assertCollection: c1 allChildrenTypes
		hasSameElements: {FamixTParameter . FamixTImplicitVariable . FamixTest1Attribute . FamixTAttribute . FamixTest1Method . FamixTLocalVariable . FamixTMethod}.
	self
		assertCollection: c2 allChildrenTypes
		hasSameElements: {FamixTParameter . FamixTImplicitVariable . FamixTest1Attribute . FamixTAttribute . FamixTest1Method . FamixTLocalVariable . FamixTMethod}.
	self assertCollection: m1 allChildrenTypes hasSameElements: {FamixTImplicitVariable . FamixTParameter . FamixTLocalVariable}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllIncomingAssociationTypes [
	self assertCollection: c1 allIncomingAssociationTypes hasSameElements: {FamixTInheritance . FamixTInvocation . FamixTAccess . FamixTReference}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllOutgoingAssociationTypes [
	self assertCollection: c1 allOutgoingAssociationTypes hasSameElements: {FamixTInheritance . FamixTInvocation . FamixTAccess . FamixTReference}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllParentTypes [
	self assertCollection: c1 allParentTypes hasSameElements: {FamixTWithTypes . FamixTPackage}.
	self assertCollection: m1 allParentTypes hasSameElements: {FamixTest1Class . FamixTWithMethods . FamixTWithTypes . FamixTPackage}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllParents [
	self assertCollection: c1 allParents hasSameElements: {}.
	self assertCollection: c2 allParents hasSameElements: {}.
	self assertCollection: m1 allParents hasSameElements: {c1}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllToScope [

	self assertCollection: (c1 allToScope: FamixTClass) hasSameElements: { c1 }.
	self assertCollection: (c1 allToScope: FamixTest1Class) hasSameElements: { c1 }.

	self assertCollection: (c1 allToScope: FamixTMethod) hasSameElements: { m1 }.
	self assertCollection: (c1 allToScope: FamixTest1Method) hasSameElements: { m1 }.

	self assertCollection: (c2 allToScope: FamixTMethod) hasSameElements: { m2. m3 }.
	self assertCollection: (c2 allToScope: FamixTest1Method) hasSameElements: { m2. m3 }.

	self assertCollection: (c1 allToScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c2 allToScope: FamixTest1SourceAnchor) hasSameElements: { }.

	self assertCollection: (m1 allToScope: FamixTClass) hasSameElements: { }.

]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testAllWithScope [

	self assertCollection: (c1 allWithScope: FamixTClass) hasSameElements: { c1 }.
	"self assertCollection: (c1 allWithScope: FamixTest1Class) hasSameElements: { c1 }." "issue 28"

	self assertCollection: (c1 allWithScope: FamixTMethod) hasSameElements: { m1 }.
	"self assertCollection: (c1 allWithScope: FamixTest1Method) hasSameElements: { m1 }." "issue 28"

	self assertCollection: (c2 allWithScope: FamixTMethod) hasSameElements: { m2. m3 }.
	"self assertCollection: (c2 allWithScope: FamixTest1Method) hasSameElements: { m2. m3 }." "issue 28"

	self assertCollection: (c1 allWithScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c1 allWithScope: FamixTest1SourceTextAnchor) hasSameElements: { }.
	self assertCollection: (c2 allWithScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c2 allWithScope: FamixTest1SourceTextAnchor) hasSameElements: { }.

	self assertCollection: (m1 allWithScope: FamixTClass) hasSameElements: { }.
	"self assertCollection: (m1 allWithScope: FamixTest1Class) hasSameElements: { }." "issue 28"

]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testBelongsTo [
	self assert: m1 belongsTo equals: c1
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testChildren [

	self assertCollection: m1 children hasSameElements: { }.
	self assertCollection: c1 children hasSameElements: { m1. a1 }.
	self assertCollection: c2 children hasSameElements: { m2. m3 }.
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testChildrenSelectors [
	self assertCollection: m1 childrenSelectors hasSameElements: {#parameters . #localVariables . #implicitVariables}.
	self assertCollection: c1 childrenSelectors hasSameElements: {#methods . #attributes}.
	self assertCollection: c2 childrenSelectors hasSameElements: {#methods . #attributes}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testIncomingAssociationTypes [
	self assertCollection: c1 allIncomingAssociationTypes hasSameElements: {FamixTInheritance . FamixTInvocation . FamixTAccess . FamixTReference}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testNumberOfChildren [
	self assert: c1 numberOfChildren equals: 2.
	self assert: c2 numberOfChildren equals: 2.
	self assert: m1 numberOfChildren equals: 0.
	self assert: a1 numberOfChildren equals: 0
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testOutgoingAssociationTypes [
	self assertCollection: c1 allOutgoingAssociationTypes hasSameElements: {FamixTInheritance . FamixTInvocation . FamixTAccess . FamixTReference}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testParentTypes [
	self assertCollection: m1 parentTypes hasSameElements: {FamixTest1Class . FamixTWithMethods}.
	self assertCollection: c1 parentTypes hasSameElements: {FamixTWithTypes . FamixTPackage}
]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testParents [

	| newMethod |
	
	self assertCollection: m1 parents hasSameElements: { c1 }.
	self assertCollection: m2 parents hasSameElements: { c2 }.
	self assertCollection: m3 parents hasSameElements: { c2 }.
	
	newMethod := FamixTest1Method new.
	self assert: newMethod parents isEmpty.

]

{ #category : #tests }
TEntityMetaLevelDependencyTest >> testWithScope [

	self assertCollection: (c1 withScope: FamixTClass) hasSameElements: { c1 }.
	self assertCollection: (c1 withScope: FamixTest1Class) hasSameElements: { c1 }.

	self assertCollection: (c1 withScope: FamixTMethod) hasSameElements: { m1 }.
	self assertCollection: (c1 withScope: FamixTest1Method) hasSameElements: { m1 }.

	self assertCollection: (c2 withScope: FamixTMethod) hasSameElements: { m2. m3 }.
	self assertCollection: (c2 withScope: FamixTest1Method) hasSameElements: { m2. m3 }.

	self assertCollection: (c1 withScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c1 withScope: FamixTest1SourceTextAnchor) hasSameElements: { }.
	self assertCollection: (c2 withScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c2 withScope: FamixTest1SourceTextAnchor) hasSameElements: { }.

	self assertCollection: (m1 withScope: FamixTWithMethods) hasSameElements: { c1 }.
	self assertCollection: (m1 withScope: FamixTest1Class) hasSameElements: { c1 }.

]
