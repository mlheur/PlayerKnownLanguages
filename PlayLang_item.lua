function onInit()
    nLanguage = window.getDatabaseNode()
    sLang = DB.getValue(nLanguage,"name")
    sPlayers = "<none>"
    if sLang then
        sPlayers = ""
        for _,nPS in ipairs(PartyManager.getPartyNodes()) do
            nChar = PartyManager.mapPStoChar(nPS)
            sCharName = DB.getValue(nChar,"name","")
            aCharNameParts = StringManager.splitWords(sCharName)
            for _,nCharLang in ipairs(DB.getChildList(nChar,"languagelist")) do
                sKnownLangs = StringManager.trim(DB.getValue(nCharLang, "name", ""))
                if ( sKnownLangs == sLang ) then
                    if sPlayers == "" then
                        sPlayers = aCharNameParts[1]
                    else
                        sPlayers = sPlayers .. ", " .. aCharNameParts[1]
                    end
                end
            end
        end
    end
    window.speakers.setValue(sPlayers)
end