Class {
	#name : #GtSceneryPlaygroundOnePharoSnippetsWithLargerVisualization,
	#superclass : #GtScenery,
	#category : #'GToolkit-Scenery'
}

{ #category : #'world menu' }
GtSceneryPlaygroundOnePharoSnippetsWithLargerVisualization class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: self name)
		order: 414.0; 
		parent: #GToolkitScenery;
		label: 'Playground: One Pharo snippet with larger visualization';
		action: [self new setUp]
]

{ #category : #initialization }
GtSceneryPlaygroundOnePharoSnippetsWithLargerVisualization >> setUp [
	| aBook aPathConstructor |
	aBook := GtPlayBook newDefault.
	aPathConstructor := GtIcebergUtility name, 
		String space, #documentAtPath: asString, String space, 'feenkcom' printString.
	aBook pages first snippets first sourceCode: 'directories := (', aPathConstructor, ')
	allDirectories 
	select: [:each | 
		(each fullName includesSubstring: ''gtoolkit'') and: [
			(each fullName includesSubstring: ''git'') not]].
mondrian := GtMondrian new.
mondrian nodes 
	stencil: [:dir | 
		BlTextElement new text: dir basename asRopedText ];
	with: directories.
mondrian edges 
	fromRightCenter;
	toLeftCenter;
	connectFrom: #parent.
mondrian layout horizontalTree.
mondrian'.
	
	GtInspector openOnPlayBook: aBook
]
