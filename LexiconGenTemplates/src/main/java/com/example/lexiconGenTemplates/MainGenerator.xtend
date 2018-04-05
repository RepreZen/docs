package com.example.lexiconGenTemplates

import com.modelsolv.reprezen.generators.api.zenmodel.ZenModelOutputItem
import com.modelsolv.reprezen.restapi.CollectionResource
import com.modelsolv.reprezen.restapi.ObjectResource
import com.modelsolv.reprezen.restapi.ResourceDefinition
import com.modelsolv.reprezen.restapi.ZenModel

class MainGenerator extends ZenModelOutputItem {
    override generate(ZenModel model) {
        '''
            Name,Type,Parent,ParentType,Model,Documentation
            «model.name»,Model,,,«model.name»,«model.documentation?.text»,
            «FOR resourceAPI : model.resourceAPIs»
                «resourceAPI.name»,ResourceAPI,«model.name»,Model,«model.name»,«resourceAPI.documentation?.text»
                «FOR resource : resourceAPI.ownedResourceDefinitions»
                    «resource.name»,«resource.type»,«resourceAPI.name»,ResourceAPI,«model.name»,«resource.documentation?.text»
                «ENDFOR»
            «ENDFOR»
        '''
    }

    def getType(ResourceDefinition resource) {
        if (resource instanceof ObjectResource) {
        	return "ObjectResource"
        } else {
        	return "CollectionResource"
        }
    }
}