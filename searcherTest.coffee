searchString = "l"

searcher = new RegExp('^' + searchString, "i")

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
    { asciiValue: 176, keyName: "enter", showInList: true },
    { asciiValue: 128, keyName: "ctrl", showInList: false },
    { asciiValue: 129, keyName: "shift", showInList: true },
    { asciiValue: 130, keyName: "alt", showInList: true },
    { asciiValue: 131, keyName: "gui", showInList: true },
    { asciiValue: 128, keyName: "control", showInList: true },
    { asciiValue: 130, keyName: "option", showInList: true },
    { asciiValue: 131, keyName: "command", showInList: true },
    { asciiValue: 131, keyName: "windows", showInList: true } ]

alert(theEntry.keyName) for theEntry in key_list when searcher.test(theEntry.keyName) is true and theEntry.showInList is true
