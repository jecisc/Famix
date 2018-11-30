# Migration guide

## From v1 to v2

In the v2 the Smalltalk importer can be configured to change the model generated.

Before it alwaysed generated compatibility models. Now you need to specify it. Here is the way to do it:

Compatibility:

```Smalltalk
MoosePharoImporterTask new
	factory: SmalltalkCompatibilityMetamodelFactory
```

Smalltalk model:

```Smalltalk
MoosePharoImporterTask new
	factory: SmalltalkMetamodelFactory
```