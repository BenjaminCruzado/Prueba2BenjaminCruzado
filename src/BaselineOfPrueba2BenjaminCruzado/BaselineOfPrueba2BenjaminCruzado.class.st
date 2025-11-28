Class {
	#name : #BaselineOfPrueba2BenjaminCruzado,
	#superclass : #BaselineOf,
	#category : #BaselineOfPrueba2BenjaminCruzado
}

{ #category : #loading }
BaselineOfPrueba2BenjaminCruzado class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'Prueba2BenjaminCruzado' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfPrueba2BenjaminCruzado >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Prueba2BenjaminCruzado'
		]
]
