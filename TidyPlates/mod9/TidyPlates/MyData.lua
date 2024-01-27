


icon1 = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"


boxdata = {}

team1 = {["name"]="Shabbat",["icon"]=icon1,["members"]={["Shabbat"]=true,["Shabbatalpha"]=true,["Shabbatbeta"]=true,["Shabbatgamma"]=true,["Shabbatomega"]=true}}

table.insert(boxdata,team1)

function GetBoxData()
    return boxdata
end
