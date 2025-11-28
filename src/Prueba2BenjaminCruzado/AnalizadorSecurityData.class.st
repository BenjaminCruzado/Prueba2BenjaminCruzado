Class {
	#name : #AnalizadorSecurityData,
	#superclass : #Object,
	#category : #Prueba2BenjaminCruzado
}

{ #category : #'as yet unclassified' }
AnalizadorSecurityData >> loadAllJSONFilesFrom: aDirectoryReference [
    | allJsonFiles dictionaries |
    
    allJsonFiles := aDirectoryReference allChildrenMatching: '*.json'.

    dictionaries := allJsonFiles collect: [:file |
        self loadJSONFile: file
    ].

    ^ dictionaries

]

{ #category : #'as yet unclassified' }
AnalizadorSecurityData >> loadJSONFile: aFileReference [
    | jsonString dictionary |
    jsonString := aFileReference readStream contents.
    dictionary := STONJSON fromString: jsonString.
    ^ dictionary

]

{ #category : #'as yet unclassified' }
AnalizadorSecurityData >> parseAllWorkflowsFromDictionaries: dictionaries [
    ^ dictionaries collect: [:dict |
        self parseWorkflowFromJSON: dict
    ].

]

{ #category : #'as yet unclassified' }
AnalizadorSecurityData >> parseWorkflowFromJSON: dictionary [

    | workflowObj historyDict |

    workflowObj := Workflow new.

    workflowObj repoOwner: (dictionary at: 'repo_owner').
    workflowObj repoName: (dictionary at: 'repo_name').
    workflowObj workflowName: (dictionary at: 'workflow_name').

    historyDict := dictionary at: 'history'.

    historyDict keysAndValuesDo: [:date :data |
        | versionObj |
        versionObj := WorkflowVersion new.
        versionObj date: date.

        (data at: 'vulnerability_list') do: [:vulnDict |
            | vulnObj |
            vulnObj := Vulnerability new.
            vulnObj ruleId: (vulnDict at: 'ruleId').
            vulnObj level: (vulnDict at: 'level').
            vulnObj message: ((vulnDict at: 'message') at: 'text').

            versionObj addVulnerability: vulnObj.
        ].

        workflowObj addVersion: versionObj.
    ].

    ^ workflowObj

]
