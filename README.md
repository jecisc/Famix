# Famix
Temporary fork of Moose's Famix

## Description

Famix is a meta-modelling framework for software models.

## Installation

To install Famix on your Pharo image you can just execute the following script:

```Smalltalk
    Metacello new
    	githubUser: 'jecisc' project: 'Famix' commitish: 'v5.x.x' path: 'src';
    	baseline: 'Famix';
    	load
```

To add Famix to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'Famix'
    	with: [ spec repository: 'github://jecisc/Famix:v5.x.x/src' ]
```

Note that you can replace the #v2.x.x by a branch as #master or #development or a tag as #v1.0.0, #v1.? or #v1.2.x.

## Official repositories

The official version is stored at: https://github.com/moosetechnology/Moose 

The old repository comes from: http://smalltalkhub.com/#!/~Moose/Famix
