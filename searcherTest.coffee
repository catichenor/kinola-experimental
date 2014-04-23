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
     completeOptions = getAutoCompleteOptions searchText
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

getAutoCompleteOptions = (searchTerm) ->
    searcher = new RegExp('^' + searchTerm, "i")

    key_list = [ { asciiValue: 128, keyName: "left ctrl", showInList: false },
        { asciiValue: 129, keyName: "left shift", showInList: true },
        { asciiValue: 130, keyName: "left alt", showInList: true },
        { asciiValue: 131, keyName: "left gui", showInList: true },
        { asciiValue: 132, keyName: "right ctrl", showInList: false },
        { asciiValue: 133, keyName: "right shift", showInList: true },
        { asciiValue: 134, keyName: "right alt", showInList: true },
        { asciiValue: 135, keyName: "right gui", showInList: true },
        { asciiValue: 218, keyName: "up arrow", showInList: true },
        { asciiValue: 217, keyName: "down arrow", showInList: true },
        { asciiValue: 216, keyName: "left arrow", showInList: true },
        { asciiValue: 215, keyName: "right arrow", showInList: true },
        { asciiValue: 178, keyName: "backspace", showInList: true },
        { asciiValue: 179, keyName: "tab", showInList: true },
        { asciiValue: 176, keyName: "return", showInList: true },
        { asciiValue: 177, keyName: "escape", showInList: true },
        { asciiValue: 209, keyName: "insert", showInList: true },
        { asciiValue: 212, keyName: "delete", showInList: true },
        { asciiValue: 211, keyName: "page up", showInList: true },
        { asciiValue: 214, keyName: "page down", showInList: true },
        { asciiValue: 210, keyName: "home", showInList: true },
        { asciiValue: 213, keyName: "end", showInList: true },
        { asciiValue: 193, keyName: "caps lock", showInList: true },
        { asciiValue: 194, keyName: "f1", showInList: true },
        { asciiValue: 195, keyName: "f2", showInList: true },
        { asciiValue: 196, keyName: "f3", showInList: true },
        { asciiValue: 197, keyName: "f4", showInList: true },
        { asciiValue: 198, keyName: "f5", showInList: true },
        { asciiValue: 199, keyName: "f6", showInList: true },
        { asciiValue: 200, keyName: "f7", showInList: true },
        { asciiValue: 201, keyName: "f8", showInList: true },
        { asciiValue: 202, keyName: "f9", showInList: true },
        { asciiValue: 203, keyName: "f10", showInList: true },
        { asciiValue: 204, keyName: "f11", showInList: true },
        { asciiValue: 205, keyName: "f12", showInList: true },
        { asciiValue: 128, keyName: "left control", showInList: true },
        { asciiValue: 130, keyName: "left option", showInList: false },
        { asciiValue: 131, keyName: "left command", showInList: false },
        { asciiValue: 132, keyName: "right control", showInList: true },
        { asciiValue: 134, keyName: "right option", showInList: false },
        { asciiValue: 135, keyName: "right command", showInList: false },
        { asciiValue: 131, keyName: "left windows", showInList: false },
        { asciiValue: 135, keyName: "right windows", showInList: false },
        { asciiValue: 131, keyName: "left super", showInList: false },
        { asciiValue: 131, keyName: "right super", showInList: false },
        { asciiValue: 176, keyName: "enter", showInList: true },
        { asciiValue: 128, keyName: "ctrl", showInList: false },
        { asciiValue: 129, keyName: "shift", showInList: true },
        { asciiValue: 130, keyName: "alt", showInList: true },
        { asciiValue: 131, keyName: "gui", showInList: true },
        { asciiValue: 128, keyName: "control", showInList: true },
        { asciiValue: 130, keyName: "option", showInList: true },
        { asciiValue: 131, keyName: "command", showInList: true },
        { asciiValue: 131, keyName: "windows", showInList: true },
        { asciiValue: 131, keyName: "super", showInList: false } ]

    matchers = []

    matchers.push(theEntry.keyName) for theEntry in key_list when searcher.test(theEntry.keyName) is true and theEntry.showInList is true

    matchers.push(theEntry.keyName) for theEntry in key_list when searcher.test(theEntry.keyName) is true if matchers.length is 0

    matchers
