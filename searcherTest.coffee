key_list = [ { actualValue: 128, listOption: "left ctrl", showInList: false },
    { actualValue: 129, listOption: "left shift", showInList: true },
    { actualValue: 130, listOption: "left alt", showInList: true },
    { actualValue: 131, listOption: "left gui", showInList: true },
    { actualValue: 132, listOption: "right ctrl", showInList: false },
    { actualValue: 133, listOption: "right shift", showInList: true },
    { actualValue: 134, listOption: "right alt", showInList: true },
    { actualValue: 135, listOption: "right gui", showInList: true },
    { actualValue: 218, listOption: "up arrow", showInList: true },
    { actualValue: 217, listOption: "down arrow", showInList: true },
    { actualValue: 216, listOption: "left arrow", showInList: true },
    { actualValue: 215, listOption: "right arrow", showInList: true },
    { actualValue: 178, listOption: "backspace", showInList: true },
    { actualValue: 179, listOption: "tab", showInList: true },
    { actualValue: 176, listOption: "return", showInList: true },
    { actualValue: 177, listOption: "escape", showInList: true },
    { actualValue: 209, listOption: "insert", showInList: true },
    { actualValue: 212, listOption: "delete", showInList: true },
    { actualValue: 211, listOption: "page up", showInList: true },
    { actualValue: 214, listOption: "page down", showInList: true },
    { actualValue: 210, listOption: "home", showInList: true },
    { actualValue: 213, listOption: "end", showInList: true },
    { actualValue: 193, listOption: "caps lock", showInList: true },
    { actualValue: 194, listOption: "f1", showInList: true },
    { actualValue: 195, listOption: "f2", showInList: true },
    { actualValue: 196, listOption: "f3", showInList: true },
    { actualValue: 197, listOption: "f4", showInList: true },
    { actualValue: 198, listOption: "f5", showInList: true },
    { actualValue: 199, listOption: "f6", showInList: true },
    { actualValue: 200, listOption: "f7", showInList: true },
    { actualValue: 201, listOption: "f8", showInList: true },
    { actualValue: 202, listOption: "f9", showInList: true },
    { actualValue: 203, listOption: "f10", showInList: true },
    { actualValue: 204, listOption: "f11", showInList: true },
    { actualValue: 205, listOption: "f12", showInList: true },
    { actualValue: 128, listOption: "left control", showInList: true },
    { actualValue: 130, listOption: "left option", showInList: false },
    { actualValue: 131, listOption: "left command", showInList: false },
    { actualValue: 132, listOption: "right control", showInList: true },
    { actualValue: 134, listOption: "right option", showInList: false },
    { actualValue: 135, listOption: "right command", showInList: false },
    { actualValue: 131, listOption: "left windows", showInList: false },
    { actualValue: 135, listOption: "right windows", showInList: false },
    { actualValue: 131, listOption: "left super", showInList: false },
    { actualValue: 131, listOption: "right super", showInList: false },
    { actualValue: 176, listOption: "enter", showInList: true },
    { actualValue: 128, listOption: "ctrl", showInList: false },
    { actualValue: 129, listOption: "shift", showInList: true },
    { actualValue: 130, listOption: "alt", showInList: true },
    { actualValue: 131, listOption: "gui", showInList: true },
    { actualValue: 128, listOption: "control", showInList: true },
    { actualValue: 130, listOption: "option", showInList: true },
    { actualValue: 131, listOption: "command", showInList: true },
    { actualValue: 131, listOption: "windows", showInList: true },
    { actualValue: 131, listOption: "super", showInList: false } ]

action_list = [ { actualValue: "h", listOption: "hold", showInList: true },
    { actualValue: "p", listOption: "push", showInList: true },
    { actualValue: "r", listOption: "release", showInList: true } ]

window.respondToKeyUp = (e, form) ->
    lastKey = window.lastKeyCode
    window.fieldEntry = getFieldValue(form, "auto_text")
    if window.fieldEntry.length > 1 and checkSpecial(lastKey) #Field length is large enough, and excluding "special" keys.
        showOptions(window.fieldEntry)
    if window.fieldEntry.length < 2
        removeClass('results', 'selected')
    return

window.respondToKeyDown = (e, form) ->
    window.lastKeyCode = e.which
    window.fieldEntry = getFieldValue(form, "auto_text")
    if window.optionsFound is true
        switch window.lastKeyCode 
            when 40 then moveAutoCompleteOptionDown(true)
            when 38 then moveAutoCompleteOptionDown(false)
            when 39 then completeSelection(form, "auto_text")
            else return
    return

showOptions = (searchText) ->
     removeClass('results', 'selected')
     completeOptions = getAutoCompleteOptions searchText, key_list
     finalOptions = []
     finalOptions.push(create("<div class='results'>#{ completeResult }</div>")) for completeResult in completeOptions
     document.body.appendChild aFinalOption for aFinalOption in finalOptions
     window.optionsFound = finalOptions.length > 0
     setSelection(0)
     return

checkSpecial = (kc) ->
    (kc is 8) or (kc > 45 and kc < 91) or (kc > 95 and kc < 112) or (kc > 185 and kc < 223)

moveAutoCompleteOptionDown = (moveDown) ->
    if moveDown
        window.counter = window.counter + 1
    else
        window.counter = window.counter - 1
    setSelection(window.counter)
    return

completeSelection = (form, fieldName) ->
    selectedOptions = document.getElementsByClassName 'selected'
    setFieldValue(form, fieldName, selectedOptions[0].textContent)

setSelection = (selectionNumber) ->
    selectedResults = document.getElementsByClassName 'selected'
    eachSelection.setAttribute("class", "results") for eachSelection in selectedResults
    allResults = document.getElementsByClassName 'results'
    resultSelection = selectionNumber.mod(allResults.length)
    allResults[resultSelection].setAttribute("class", "selected")
    return

Number::mod = (n) ->
    ((this % n) + n) % n # "Fixing" the modulo negative "bug"

getFieldValue = (form, fieldName) ->
    form[fieldName].value

setFieldValue = (form, fieldName, newValue) ->
    form[fieldName].value = newValue
    return

removeClass = (classesToDelete...) ->
    for classToDelete in classesToDelete
        resultsToRemove = document.getElementsByClassName classToDelete
        resultsToRemove[0].parentNode.removeChild(resultsToRemove[0]) while resultsToRemove[0]?
    return

create = (htmlStr) ->
  frag = document.createDocumentFragment()
  window.temp = document.createElement("div")
  temp.innerHTML = htmlStr
  frag.appendChild temp.firstChild while temp.firstChild
  frag
# fragment = create("<div>Hello!</div><p>...</p>")

# You can use native DOM methods to insert the fragment:
# document.body.insertBefore fragment, document.body.childNodes[0]

getAutoCompleteOptions = (searchTerm, resultList) ->
    searcher = new RegExp('^' + searchTerm, "i")

    matchers = []

    matchers.push(theEntry.listOption) for theEntry in resultList when searcher.test(theEntry.listOption) is true and theEntry.showInList is true

    matchers.push(theEntry.listOption) for theEntry in resultList when searcher.test(theEntry.listOption) is true if matchers.length is 0

    matchers
