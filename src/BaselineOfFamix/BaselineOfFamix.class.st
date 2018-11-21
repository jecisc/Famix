"
Description
--------------------

Baseline for the Famix project
"
Class {
	#name : #BaselineOfFamix,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamix
}

{ #category : #baseline }
BaselineOfFamix >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			self
				deepTraverser: spec;
				fame: spec;
				kgbTestResources: spec;
				mooseAlgos: spec;
				packageBlueprintTestResources: spec;
				roelTyper: spec.

			"Packages"
			spec
				package: 'Moose-Query' with: [ spec requires: #('Fame' 'DeepTraverser') ];
				package: 'Moose-Core' with: [ spec requires: #('Fame' 'Moose-Query') ];
				package: 'Moose-Query-Extensions' with: [ spec requires: #('Moose-Query' 'Famix-Traits') ];
				package: 'Famix-Compatibility-Groups' with: [ spec requires: #('Moose-Core') ];
				package: 'Famix-Traits' with: [ spec requires: #('Famix-Compatibility-Groups' 'Moose-Core') ];
				package: 'Famix-MetamodelBuilder-Core' with: [ spec requires: #('Famix-Traits') ];
				package: 'Famix-MetamodelGeneration' with: [ spec requires: #('Famix-MetamodelBuilder-Core') ];
				package: 'Famix-BasicInfrastructure' with: [ spec requires: #('Famix-MetamodelBuilder-Core') ];
				package: 'Famix-Utils';
				
				package: 'Famix-Compatibility-Generator' with: [ spec requires: #('Famix-BasicInfrastructure') ];
				package: 'Famix-Compatibility-Entities' with: [ spec requires: #('') ];
				
				package: 'Famix-Extensions' with: [ spec requires: #('') ];
				package: 'Moose-GenericImporter' with: [ spec requires: #('') ];
				package: 'Moose-Query-Extensions' with: [ spec requires: #('') ];
				package: 'Moose-SmalltalkImporter' with: [ spec requires: #('') ];
				package: 'Moose-MonticelloImporter' with: [ spec requires: #('') ];
				package: 'Famix-Traits' with: [ spec requires: #('') ];
				package: 'Famix-PharoSmalltalk-Generator' with: [ spec requires: #('') ];
				package: 'Famix-PharoSmalltalk-Entities' with: [ spec requires: #('') ];
				package: 'Famix-PharoSmalltalk-Importer' with: [ spec requires: #('') ];
				package: 'Famix-Support' with: [ spec requires: #('') ];
				package: 'Famix-Java-Generator' with: [ spec requires: #('') ];
				package: 'Famix-Java-Entities' with: [ spec requires: #('') ];
				
				package: 'Moose-Query-Test' with: [ spec requires: #('') ];
				package: 'Moose-Tests-Core' with: [ spec requires: #('') ];
				package: 'Famix-Utils-Tests' with: [ spec requires: #('Famix-Utils') ];
				package: 'Moose-Tests-SmalltalkImporter-LAN' with: [ spec requires: #('') ];
				package: 'Moose-Tests-SmalltalkImporter-Core' with: [ spec requires: #('') ];
				package: 'Moose-Tests-SmalltalkImporter-KGB' with: [ spec requires: #('') ];
				package: 'Moose-TestResources-Reference-Core' with: [ spec requires: #('') ];
				package: 'Moose-TestResources-Reference-PackageOne' with: [ spec requires: #('') ];
				package: 'Moose-TestResources-Reference-PackageTwo' with: [ spec requires: #('') ];
				package: 'Moose-TestResources-LAN' with: [ spec requires: #('') ];
				package: 'Moose-TestResources-LCOM' with: [ spec requires: #('') ];
				package: 'Famix-Compatibility-Tests-C' with: [ spec requires: #('') ];
				package: 'Famix-Compatibility-Tests-Java' with: [ spec requires: #('') ];
				package: 'Famix-Compatibility-Tests-Core' with: [ spec requires: #('') ];
				package: 'Famix-Compatibility-Tests-Extensions' with: [ spec requires: #('') ];
				package: 'Moose-Tests-MonticelloImporter' with: [ spec requires: #('') ];
				package: 'Famix-TestGenerators' with: [ spec requires: #('') ];
				package: 'Famix-MetamodelBuilder-Tests' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-MetamodelGeneration' 'Famix-TestGenerators') ];
				package: 'Famix-Test1-Entities' with: [ spec requires: #('') ];
				package: 'Famix-Test1-Tests' with: [ spec requires: #('') ];
				package: 'Famix-Test2-Entities' with: [ spec requires: #('') ];
				package: 'Famix-Test2-Tests' with: [ spec requires: #('') ];
				package: 'Famix-Test3-Entities' with: [ spec requires: #('') ];
				package: 'Famix-Test3-Tests' with: [ spec requires: #('') ];
				package: 'Famix-Test4-Entities' with: [ spec requires: #('') ];
				package: 'Famix-Test4-Tests' with: [ spec requires: #('') ];
				package: 'Famix-TestComposedSubmetamodel1-Entities' with: [ spec requires: #('') ];
				package: 'Famix-TestComposedSubmetamodel2-Entities' with: [ spec requires: #('') ];
				package: 'Famix-TestComposedMetamodel' with: [ spec requires: #('') ];
				package: 'Famix-TestComposedMetamodel-Entities' with: [ spec requires: #('') ].

			"Groups"
			spec group: '' with: #('') ]
]

{ #category : #dependencies }
BaselineOfFamix >> deepTraverser: spec [
	spec baseline: 'DeepTraverser' with: [ spec repository: 'github://pharo-contributions/DeepTraverser:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> fame: spec [
	spec baseline: 'Fame' with: [ spec repository: 'github://jecisc/Fame:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> kgbTestResources: spec [
	spec baseline: 'KGBTestResources' with: [ spec repository: 'github://jecisc/KGBTestResources:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> mooseAlgos: spec [
	spec baseline: 'MooseAlgos' with: [ spec repository: 'github://moosetechnology/MooseAlgos:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> packageBlueprintTestResources: spec [
	spec baseline: 'PackageBlueprintTestResources' with: [ spec repository: 'github://jecisc/PackageBlueprintTestResources:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> roelTyper: spec [
	spec baseline: 'RoelTyper' with: [ spec repository: 'github://RMODINRIA/RoelTyper:v1.x.x/src' ]
]
