class KeyCommand
    constructor: (@shortKeys, @longKeys) ->
        @properties=
            shortCommand: @shortKeys
            longCommand: @longKeys

class KeyList
    constructor: () ->
        @LIST_OF_KEYS = []
    pushKeyCommand: (theKeyCommand) ->
        @LIST_OF_KEYS.push(theKeyCommand)
    popKeyCommand: () ->
        @LIST_OF_KEYS.pop()
    returnCommands: (joiner) ->
        shortCommands = @LIST_OF_KEYS.map (shortKeyList) -> shortKeyList.shortCommand
        outKeys = shortCommands.join(joiner)

keyList = new KeyList()
keyCommand1 = new KeyCommand "h128", "Hold Left Control"
keyCommand2 = new KeyCommand "r-1", "Release All"

keyList.pushKeyCommand keyCommand1
keyList.pushKeyCommand keyCommand2

alert keyList.returnShortCommands("/")
alert keyList.returnLongCommands(", ")
