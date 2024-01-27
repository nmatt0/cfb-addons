


icon1 = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"
icon2 = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"


boxdata = {}

team1 = {["name"]="Shabbat",["icon"]=icon1,["members"]={["Shabbat"]=true,["Shabbatalpha"]=true,["Shabbatbeta"]=true,["Shabbatgamma"]=true,["Shabbatomega"]=true}}
teamtest = {["name"]="Shabbat",["icon"]=icon2,["members"]={["Orgrimmar Grunt"]=true}}

-- add 
table.insert(boxdata,team1)
table.insert(boxdata,teamtest)

function GetBoxData()
    return boxdata
end
