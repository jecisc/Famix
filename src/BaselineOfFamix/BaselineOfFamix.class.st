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
				ring2: spec;
				roelTyper: spec.

			"Packages"
			spec
				package: 'Moose-Query' with: [ spec requires: #('Fame' 'DeepTraverser') ];
				package: 'Moose-Core' with: [ spec requires: #('Fame' 'Moose-Query') ];
				package: 'Moose-Query-Extensions' with: [ spec requires: #('Moose-Query' 'Famix-Traits') ];
				package: 'Famix-Groups' with: [ spec requires: #('Moose-Core') ];
				package: 'Famix-Traits' with: [ spec requires: #('Famix-Groups' 'Moose-Core') ];
				
				package: 'Famix-MetamodelBuilder-Core' with: [ spec requires: #('Famix-Traits' 'Ring2') ];
				package: 'Famix-MetamodelGeneration' with: [ spec requires: #('Famix-MetamodelBuilder-Core') ];
				
				package: 'Famix-BasicInfrastructure' with: [ spec requires: #('Famix-MetamodelBuilder-Core') ];
				package: 'Famix-Smalltalk-Utils';
				
				package: 'Famix-Compatibility-Generator' with: [ spec requires: #('Famix-BasicInfrastructure') ];
				package: 'Famix-Compatibility-Entities' with: [ spec requires: #('Famix-Traits' 'Famix-Smalltalk-Utils') ];
				
				package: 'Moose-GenericImporter' with: [ spec requires: #('Famix-Compatibility-Entities') ];
				package: 'Moose-SmalltalkImporter' with: [ spec requires: #('Moose-GenericImporter' 'RoelTyper') ];
				package: 'Moose-MonticelloImporter' with: [ spec requires: #('Moose-SmalltalkImporter') ];
				
				package: 'Famix-PharoSmalltalk-Generator' with: [ spec requires: #('Basic') ];
				package: 'Famix-PharoSmalltalk-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Smalltalk-Utils' 'Famix-Traits') ];
				package: 'Famix-PharoSmalltalk-Importer' with: [ spec requires: #('Famix-PharoSmalltalk-Entities') ];
				
				package: 'Famix-Java-Generator' with: [ spec requires: #('Basic') ];
				package: 'Famix-Java-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				
				package: 'Moose-TestResources-Reference-External';
				package: 'Moose-TestResources-Reference-Core';
				package: 'Moose-TestResources-Reference-PackageOne' with: [ spec requires: #('Moose-TestResources-Reference-Core') ];
				package: 'Moose-TestResources-Reference-PackageTwo' with: [ spec requires: #('Moose-TestResources-Reference-PackageOne' 'Moose-TestResources-Reference-External') ];
				package: 'Moose-TestResources-LAN';
				package: 'Moose-TestResources-LCOM';
				
				package: 'Moose-Query-Test' with: [ spec requires: #('Moose-Query' 'Famix-Compatibility-Entities') ];
				package: 'Moose-Tests-Core' with: [ spec requires: #('Famix-Compatibility-Entities' 'Famix-Compatibility-Generator' 'Moose-SmalltalkImporter' 'Moose-TestResources-LAN' 'Moose-TestResources-LCOM' 'Moose-TestResources-Reference-Core') ];
				
				package: 'Famix-Smalltalk-Utils-Tests' with: [ spec requires: #('Famix-Smalltalk-Utils') ];
				package: 'Moose-Tests-SmalltalkImporter-LAN' with: [ spec requires: #('Moose-Tests-Core') ];
				package: 'Moose-Tests-SmalltalkImporter-Core' with: [ spec requires: #('Moose-Tests-Core') ];
				package: 'Moose-Tests-SmalltalkImporter-KGB' with: [ spec requires: #('Moose-Tests-Core' 'KGBTestResources') ];
				
				package: 'Famix-Compatibility-Tests-C' with: [ spec requires: #('Famix-Compatibility-Entities') ];
				package: 'Famix-Compatibility-Tests-Java' with: [ spec requires: #('Moose-Tests-Core') ];
				package: 'Famix-Compatibility-Tests-Core' with: [ spec requires: #('Famix-Compatibility-Entities') ];
				package: 'Famix-Compatibility-Tests-Extensions' with: [ spec requires: #('Famix-Compatibility-Entities' 'PackageBlueprintTestResources') ];
				package: 'Moose-Tests-MonticelloImporter' with: [ spec requires: #('Moose-SmalltalkImporter') ];
				package: 'Famix-TestGenerators' with: [ spec requires: #('Basic') ];
				package: 'Famix-MetamodelBuilder-Tests' with: [ spec requires: #('Famix-TestGenerators') ];
				package: 'Famix-Test1-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Test1-Tests' with: [ spec requires: #('Famix-Test1-Entities') ];
				package: 'Famix-Test2-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Test2-Tests' with: [ spec requires: #('Famix-Test2-Entities') ];
				package: 'Famix-Test3-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Test3-Tests' with: [ spec requires: #('Famix-Test3-Entities') ];
				package: 'Famix-Test4-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Test4-Tests' with: [ spec requires: #('Famix-Test4-Entities') ];
				package: 'Famix-TestComposedSubmetamodel1-Entities' with: [ spec requires: #('Famix-Traits') ];
				package: 'Famix-TestComposedSubmetamodel2-Entities' with: [ spec requires: #('Famix-Traits') ];
				package: 'Famix-TestComposedMetamodel-Entities' with: [ spec requires: #('Famix-Test2-Entities' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedSubmetamodel2-Entities') ];
				package: 'Famix-TestComposedMetamodel' with: [ spec requires: #('Famix-TestComposedMetamodel-Entities') ].
				
			"Groups"
			spec
				group: 'Core' with: #('Famix-Traits' 'Moose-Query-Extensions');
				group: 'Basic' with: #('Famix-BasicInfrastructure' 'Famix-MetamodelGeneration');
				group: 'TestsResources' with: #('Moose-TestResources-Reference-Core' 'Moose-TestResources-Reference-PackageOne' 'Moose-TestResources-Reference-PackageTwo' 'Moose-TestResources-LAN' 'Moose-TestResources-LCOM' 'KGBTestResources' 'PackageBlueprintTestResources');
				group: 'ModelCompatibility' with: #('Famix-Compatibility-Generator' 'Famix-Compatibility-Entities');
				group: 'ModelJava' with: #('Famix-Java-Generator' 'Famix-Java-Entities');
				group: 'ModelSmalltalk' with: #('Famix-PharoSmalltalk-Generator' 'Famix-PharoSmalltalk-Entities' 'Famix-PharoSmalltalk-Importer');
				group: 'Importers' with: #('Moose-GenericImporter' 'Moose-SmalltalkImporter' 'Moose-MonticelloImporter');
				group: 'Tests' with: #('Moose-Query-Test' 'Moose-Tests-Core' 'Famix-Smalltalk-Utils-Tests' 'Moose-Tests-SmalltalkImporter-LAN' 'Moose-Tests-SmalltalkImporter-Core' 'Moose-Tests-SmalltalkImporter-KGB' 'Famix-Compatibility-Tests-C' 'Famix-Compatibility-Tests-Java' 'Famix-Compatibility-Tests-Core' 'Famix-Compatibility-Tests-Extensions' 'Moose-Tests-MonticelloImporter' 'Famix-TestGenerators' 'Famix-MetamodelBuilder-Tests' 'Famix-Test1-Entities' 'Famix-Test1-Tests' 'Famix-Test2-Entities' 'Famix-Test2-Tests' 'Famix-Test3-Entities' 'Famix-Test3-Tests' 'Famix-Test4-Entities' 'Famix-Test4-Tests' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedSubmetamodel2-Entities' 'Famix-TestComposedMetamodel-Entities'  'Famix-TestComposedMetamodel')
				]
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
BaselineOfFamix >> ring2: spec [
	spec
		baseline: 'Ring2'
		with: [ spec
				loads: 'runtimeSupport';
				repository: 'github://pavel-krivanek/Ring2:1.1.1/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> roelTyper: spec [
	spec baseline: 'RoelTyper' with: [ spec repository: 'github://RMODINRIA/RoelTyper:v1.x.x/src' ]
]
