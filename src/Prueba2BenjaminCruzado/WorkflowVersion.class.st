Class {
	#name : #WorkflowVersion,
	#superclass : #Object,
	#instVars : [
		'date',
		'vulnerabilities',
		'workflow'
	],
	#category : #Prueba2BenjaminCruzado
}

{ #category : #'as yet unclassified' }
WorkflowVersion >> addVulnerability: aVuln [
    vulnerabilities add: aVuln.
]

{ #category : #'as yet unclassified' }
WorkflowVersion >> date [
    ^ date.
]

{ #category : #'as yet unclassified' }
WorkflowVersion >> date: aDate [
    date := aDate.
]

{ #category : #'as yet unclassified' }
WorkflowVersion >> gtViewRectangulo: aView [
    <gtView>

    ^ aView explicit
        title: 'Rectangulo';
        stencil: [
            BlElement new
                background: self rectangleColor;
                size: self rectangleSize
        ].

]

{ #category : #'as yet unclassified' }
WorkflowVersion >> initialize [
    super initialize.
    vulnerabilities := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
WorkflowVersion >> numberOfVulnerabilities [
    ^ vulnerabilities size

]

{ #category : #'as yet unclassified' }
WorkflowVersion >> rectangleColor [
    ^ self numberOfVulnerabilities = 0
        ifTrue: [ Color lightGray ]     "especial para 0 vulnerabilidades"
        ifFalse: [
            (self workflow numberOfVersions < 5)
                ifTrue: [ Color red ]
                ifFalse: [ Color green ]
        ].

]

{ #category : #'as yet unclassified' }
WorkflowVersion >> rectangleSize [
    | base size |
    base := 10.   "tamaño base proporcional"

    self numberOfVulnerabilities = 0
        ifTrue: [ ^ 5 @ 5 ].     "caso especial, tamaño fijo"

    size := self numberOfVulnerabilities * base.
    ^ size @ size


]

{ #category : #'as yet unclassified' }
WorkflowVersion >> vulnerabilities [
    ^ vulnerabilities.
]

{ #category : #'as yet unclassified' }
WorkflowVersion >> workflow [
    ^ workflow

]

{ #category : #'as yet unclassified' }
WorkflowVersion >> workflow: aWorkflow [
    workflow := aWorkflow

]
