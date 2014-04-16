class KeyCommand
    constructor: (@shortCommand, @longCommand) ->

class KeyList
    constructor: () ->
        @LIST_OF_KEYS = []
    pushKeyCommand: (theKeyCommand) ->
        @LIST_OF_KEYS.push(theKeyCommand)
    popKeyCommand: () ->
        @LIST_OF_KEYS.pop()
    returnShortCommands: (joiner) ->
        tempKeys = []
        tempKeys.push(thisKey.shortCommand) for thisKey in @LIST_OF_KEYS
        outKeys = tempKeys.join(joiner)
    returnLongCommands: (joiner) ->
        tempKeys = []
        tempKeys.push(thisKey.longCommand) for thisKey in @LIST_OF_KEYS
        outKeys = tempKeys.join(joiner)

keyList = new KeyList()
keyCommand1 = new KeyCommand "h128", "Hold Left Control"
keyCommand2 = new KeyCommand "r-1", "Release All"

keyList.pushKeyCommand keyCommand1
keyList.pushKeyCommand keyCommand2

# alert thisKey.shortCommand + "/" for thisKey in keyList.LIST_OF_KEYS

alert keyList.returnShortCommands("/")
alert keyList.returnLongCommands(", ")
