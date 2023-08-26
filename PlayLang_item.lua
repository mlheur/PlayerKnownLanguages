function onInit()
    LangNode = getDatabaseNode()
    sLang = LangNode.getValue()
    sPlayers = ""
    for _,nChar in pairs(DB.findNode("charsheet").getChildren()) do
        sCharName = DB.getChild(nChar,"name").getValue()
        for _,nCharLang in pairs(DB.getChildren(nChar,"languagelist")) do
            sKnownLangs = StringManager.trim(DB.getValue(nCharLang, "name", ""))
            if ( sKnownLangs == sLang ) then
                if sPlayers == "" then
                    sPlayers = sCharName
                else
                    sPlayers = sPlayers .. "," .. sCharName
                end
            end
        end
    end
    LangNode.getParent().getChild("PlayLang_players").setValue(sPlayers)
end
