package com.modelsolv.reprezen.generators.xtend.template.lexicongentemplates
import com.modelsolv.reprezen.restapi.ZenModel
import com.modelsolv.reprezen.generators.api.zenmodel.ZenModelOutputItem;

class MainTemplate extends ZenModelOutputItem {
    override generate(ZenModel model) {
    // Xtend  language is used for generator template here
    // You can find the documentation and examples on https://eclipse.org/xtend/documentation/index.html
        '''
        <html>
            <head>
                <title>Sample Generated HTML for «model.name»</title>
            </head>
            <body bgcolor=white>

                <p>You can iterate over resources like this:</p>
                <ul>
                «FOR resourceAPI : model.resourceAPIs»
                    «FOR resource: resourceAPI.ownedResourceDefinitions»
                        <li>«resource.name»</li>
                    «ENDFOR»
                «ENDFOR»
                </ul>
            </body>
        </html>
        '''
    }
}
