"use strict"

Atoms.$ ->
  console.log "------------------------------------------------------------"
  console.log "SubView v0.0.1"
  console.log "------------------------------------------------------------"
  console.log "Atoms v#{Atoms.version} (Atoms.App v#{Atoms.App.version})"
  console.log "------------------------------------------------------------"

  Atoms.Url.path "account/login"

Atoms.Organism.Article.prototype.hideAll = (organismType)->
  if organismType
    for child in this.children
      if child instanceof organismType
        child.hide()
      child

Atoms.Molecule.Navigation.prototype.select = (button)->
  if button!=undefined
    if typeof button == "number"
      button = this.children[button]

    for child in this.children
      style = if child.attributes.style!=undefined then child.attributes.style else ""
      style = style.replace "active", ""
      if child == button
        child.attributes.style = style + "active"
      else
        child.attributes.style = style;
      child.refresh()
