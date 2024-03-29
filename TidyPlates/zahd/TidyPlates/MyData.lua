

icon_star = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"
icon_circle = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"
icon_diamond = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"
icon_triangle = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"
icon_moon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"
icon_square = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"
icon_cross = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"
icon_skull = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"

icon_cow = "Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\cow"
icon_taco = "Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\taco"
icon_elegant = "Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\elegant"

boxdata = {}

local team_zahd = {["icon"]=icon_skull,["members"]={["Zahd"]=true,["Harz"]=true,["Grunbeld"]=true,["Undeth"]=true,["Delts"]=true}}
table.insert(boxdata,team_zahd)

function GetBoxData()
    return boxdata
end
