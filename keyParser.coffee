class kinolaParser
    constructor: () ->
        @parsedString

    changeVal: (newString, newFormat) ->
        @parsedString = @parseThis(newString, newFormat)

    getVal: (@outFormat) ->
        @parsedString

    parseThis: (theString, theFormat) ->
        if theFormat is "short" then shortString = true else shortString = false 
        if shortString then delimiter = "/" else delimiter = ","
        separatedString = theString.split(delimiter)

        if not shortString
            shortOutput = []
            for keyCommand in separatedString
                keyCommand = keyCommand.replace /^\s/, ""
                splitCommand = keyCommand.split(" ")
                theAction = splitCommand[0].toLowerCase()
                theKey = splitCommand[1]
                if theAction is "hold" then shortAction = "h" 
                else if theAction is "push" then shortAction = "p"
                else if theAction is "release" then shortAction = "r"
                else @oops()
                keyOut = shortAction + theKey
                shortOutput.push(keyOut)
            parseOutput = shortOutput.toString()
        else
            parseOutput = theString

        parseOutput
        
    oops: ->
        "oops"

theParser = new kinolaParser() 
theParser.changeVal("hold 128, hold 130, push 212, release all", "long")
alert theParser.getVal()
