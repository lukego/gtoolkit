Class {
	#name : #GtSceneryDocumenterTalk,
	#superclass : #GtScenery,
	#category : #'GToolkit-Scenery'
}

{ #category : #'world menu' }
GtSceneryDocumenterTalk class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: self name)
		order: 222.0; 
		parent: #GToolkitScenery;
		label: 'Documenter: Three Use Case Scenarios Talk';
		action: [self new setUp]
]

{ #category : #initialization }
GtSceneryDocumenterTalk >> setUp [
	GtInspector openOnPlayBook: (Gt2Document forFile: (GtIcebergUtility documentAtPath: (Path * 
		'feenkcom' / 'gtoolkit-demos' / 
		'doc' / 'tutorial' / 'esug-2018-documenter' / 'documenter.pillar')))
]
