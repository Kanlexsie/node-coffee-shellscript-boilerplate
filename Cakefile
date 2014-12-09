# Config ------------------------------------------------
cake = {}
cake.coffee = batch: {}  # Compiles and minifies each batch
# cake.coffee.batch["js-file-path-and-prefix"] = [
#   'coffee-file-path-and-name' # without the coffee extension
#   ...
# ]
cake.coffee.folders = [ # all .coffee files in each folder will be compiled to .js
# '.'
# 'server'
# ...
]
cake.template = batch: {} # Build JSON id:html Array from files in path
# cake.template.batch["file-to-contain-json-or-js"] = 
#   path: "html-templates-folder-path"
#   prefix: "" # could be used to store the results in a variable if output is .js or .coffee

# sbuild Task -------------------------------------------

fs     = require 'fs'
{exec} = require 'child_process'

task 'sbuild', 'Build single application file from source files', ->
  compile = (out, appFiles) ->
    appContents = new Array remaining = appFiles.length
    for file, index in appFiles then do (file, index) ->
      fileContents = fs.readFileSync "#{file}.coffee", 'utf8'
      appContents[index] = fileContents
      process out, appContents if --remaining is 0

  process = (out, appContents) ->
    fs.writeFileSync "#{out}-raw.coffee", appContents.join('\n\n'), 'utf8'
    exec "coffee --compile #{out}-raw.coffee", (err, stdout, stderr) ->
      throw err if err
      console.log stdout + stderr
      fs.unlink "#{out}-raw.coffee", (err) ->
        throw err if err
      exec "uglifyjs -o #{out}-min.js #{out}-raw.js", (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink "#{out}-raw.js", (err) ->
          throw err if err
          console.log "#{out}-min.js compiled and minified."

  if cake.template and cake.template.batch
    for out, ini of cake.template.batch
      templates = []
      for tmpl in fs.readdirSync ini.path
        if /\.html?$/.test tmpl
          html = fs.readFileSync(ini.path + tmpl).toString()
          template =
            id: tmpl.replace(/\.html?$/i, "")
            html: html
          templates.push template
          fs.writeFileSync out, ini.prefix + JSON.stringify templates

  if cake.coffee and cake.coffee.batch
    for out, appFiles of cake.coffee.batch
      compile out, appFiles

  if cake.coffee and cake.coffee.folders
    for dir in cake.coffee.folders
      exec "coffee --compile #{dir}/*.coffee", (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr