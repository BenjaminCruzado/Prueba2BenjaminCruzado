Class {
	#name : #Workflow,
	#superclass : #Object,
	#instVars : [
		'repoOwner',
		'repoName',
		'workflowName',
		'versions'
	],
	#category : #'Prueba2BenjaminCruzado-model'
}

{ #category : #'as yet unclassified' }
Workflow >> addVersion: aVersion [
    versions add: aVersion.
    aVersion workflow: self.

]

{ #category : #'as yet unclassified' }
Workflow >> gtViewHistorial: aView [
    <gtView>

    ^ aView explicit
        title: 'Historial completo';
        stencil: [
            | container child |

            "Contenedor principal con tamaño suficiente para mostrar varias líneas"
            container := BlElement new.
            container size: 700 @ 700.  "alto suficiente para varias líneas"
            container layout: BlFlowLayout new.  "layout tipo flow para saltos automáticos"

            "Recorrer todas las versiones del workflow"
            self versions do: [:v |
                child := BlElement new.

                "Tamaño proporcional al número de vulnerabilidades"
                child size: v rectangleSize.

                "Color según número de versiones y vulnerabilidades"
                child background: v rectangleColor.

                "Margen para separar cuadrados"
                child margin: (BlInsets all: 5).

                container addChild: child.
            ].

            container
        ].

]

{ #category : #'as yet unclassified' }
Workflow >> initialize [
    super initialize.
    versions := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Workflow >> numberOfVersions [
    ^ versions size

]

{ #category : #'as yet unclassified' }
Workflow >> repoName [
    ^ repoName.
]

{ #category : #'as yet unclassified' }
Workflow >> repoName: name [
    repoName := name.
]

{ #category : #'as yet unclassified' }
Workflow >> repoOwner [
    ^ repoOwner.
]

{ #category : #'as yet unclassified' }
Workflow >> repoOwner: owner [
    repoOwner := owner.
]

{ #category : #'as yet unclassified' }
Workflow >> versions [
    ^ versions.

]

{ #category : #'as yet unclassified' }
Workflow >> workflowName [
    ^ workflowName.
]

{ #category : #'as yet unclassified' }
Workflow >> workflowName: name [
    workflowName := name.
]
