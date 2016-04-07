package com.modelsolv.reprezen.generators.xtend.template.lexicongentemplates;

import com.modelsolv.reprezen.generators.api.zenmodel.ZenModelOutputItem;
import com.modelsolv.reprezen.restapi.ResourceAPI;
import com.modelsolv.reprezen.restapi.ResourceDefinition;
import com.modelsolv.reprezen.restapi.ZenModel;
import org.eclipse.emf.common.util.EList;
import org.eclipse.xtend2.lib.StringConcatenation;

@SuppressWarnings("all")
public class MainTemplate extends ZenModelOutputItem {
  public String generate(final ZenModel model) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("<html>");
    _builder.newLine();
    _builder.append("    ");
    _builder.append("<head>");
    _builder.newLine();
    _builder.append("        ");
    _builder.append("<title>Sample Generated HTML for ");
    String _name = model.getName();
    _builder.append(_name, "        ");
    _builder.append("</title>");
    _builder.newLineIfNotEmpty();
    _builder.append("    ");
    _builder.append("</head>");
    _builder.newLine();
    _builder.append("    ");
    _builder.append("<body bgcolor=white>");
    _builder.newLine();
    _builder.newLine();
    _builder.append("        ");
    _builder.append("<p>You can iterate over resources like this:</p>");
    _builder.newLine();
    _builder.append("        ");
    _builder.append("<ul>");
    _builder.newLine();
    {
      EList<ResourceAPI> _resourceAPIs = model.getResourceAPIs();
      for(final ResourceAPI resourceAPI : _resourceAPIs) {
        {
          EList<ResourceDefinition> _ownedResourceDefinitions = resourceAPI.getOwnedResourceDefinitions();
          for(final ResourceDefinition resource : _ownedResourceDefinitions) {
            _builder.append("        ");
            _builder.append("<li>");
            String _name_1 = resource.getName();
            _builder.append(_name_1, "        ");
            _builder.append("</li>");
            _builder.newLineIfNotEmpty();
          }
        }
      }
    }
    _builder.append("        ");
    _builder.append("</ul>");
    _builder.newLine();
    _builder.append("    ");
    _builder.append("</body>");
    _builder.newLine();
    _builder.append("</html>");
    _builder.newLine();
    return _builder.toString();
  }
}
