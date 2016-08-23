#==================================================
# GenTemplate: LexiconGenTemplates
#==================================================
To find the following files quickly use the Open Resource Dialog: Ctrl + Shift + R 
## To modify this GenTemplate
### Generated Output:
To customise the code gen output modify the following file:
src/main/java
  com/modelsolv/reprezen/generators/xtend/template/lexicongentemplates/MainTemplate.xtend

### Generated File name:
To change the name of the generated file modify the value of the "output" property in:
src/main/resources
  com/modelsolv/reprezen/generators/xtend/template/lexicongentemplates/config.json

(You can use `${zenModel.name}` variable in "output" property for model name reference.)

### Create additional outputs
If you want to generate more than one kind of output add more "template" properties to config.json.

## Running this GenTemplate
### From RepreZen API Studio
1. Build this GenTemplate project using the "Clean" action or by enabling "Build automatically"
2. Create a new (or open an existing) Zen project.
3. Add a new LexiconGenTemplates Generation Target to the Zen project: 
  - File > New > Generation Target
  - Select LexiconGenTemplates from the Gen template drop down
  - Select the right Source Zen file
  - Press Finish
4. Run the new Generation Target:
  - Select the .gen file you just added to the Zen project (look under gentargets)
  - Click 'Generate...' in the context menu
  - Check the generated directory for output