-------------------------------------------------------
-- Tidy Plates Beta
-------------------------------------------------------
local printEvents = false
local timeSlice = 0

--------------------------------------------------------------------------------------------------------------
-- I. Variables and Simple Functions
--------------------------------------------------------------------------------------------------------------
TidyPlates = {}

local raidIconMap = {["STAR"]="1",["CIRCLE"]="2",["DIAMOND"]="3",["TRIANGLE"]="4",["MOON"]="5",["SQUARE"]="6",["CROSS"]="7",["SKULL"]="8"}
local team1 = {["Shabbat"]=true,["Shabbatalpha"]=true,["Shabbatbeta"]=true,["Shabbatgamma"]=true,["Shabbatomega"]=true}
local team2 = {["Zahd"]=true,["Harz"]=true,["Grunbeld"]=true,["Undeth"]=true,["Delts"]=true}
local team3 = {["Respektus"]=true,["Considerus"]=true,["Kneeltous"]=true,["Surenderto"]=true,["Praiseus"]=true}
local teamtest = {["Orgrimmar Grunt"]=true}
local team1raidIcon = nil

local otto = {["Ottomanzz"]=true,["Ottomanl"]=true,["Ottomanm"]=true,["Ottomano"]=true,["Ottomanp"]=true}
local elegant = {["Elegant"]=true,["Eleganto"]=true,["Elegantz"]=true,["Eleganti"]=true,["Elegants"]=true,["Elegantb"]=true,["Elegantc"]=true,["Elegantd"]=true,["Eleganta"]=true}

local gantz = {["Archvil"]=true,["Davos"]=true,["Vitra"]=true,["Leiazel"]=true,["Dimitrecus"]=true,["Fabregat"]=true,["Broumie"]=true,["Jovile"]=true,["Icebanne"]=true,["Dreina"]=true,["Aronsson"]=true,["Centellita"]=true,["Demetria"]=true,["Lacastigada"]=true,["Belishx"]=true,["Arcous"]=true,["Haiineko"]=true,["Reyinmortal"]=true,["Adamuz"]=true,["Darliux"]=true,["Dalumian"]=true,["Valkirya"]=true,["Perrohp"]=true,["Thegenerall"]=true,["Oddinkk"]=true,["Skankhuntx"]=true,["Darlenk"]=true,["Ekka"]=true,["Justiciera"]=true,["Nouribasha"]=true,["Devilkspree"]=true,["Illidanst"]=true,["Kythel"]=true,["Nourito"]=true,["Shester"]=true,["Brakusramms"]=true,["Palangano"]=true,["Akaito"]=true,["Xelshield"]=true,["Xios"]=true,["Rosellie"]=true,["Aelyss"]=true,["Amarantta"]=true,["Alexiia"]=true,["Karmina"]=true,["Mamaid"]=true,["Nefereth"]=true,["Niurka"]=true,["Niiurka"]=true,["Mortyss"]=true,["Healshamy"]=true,["Drucilaa"]=true,["Bryaxis"]=true,["Lilynete"]=true,["Puralocura"]=true,["Nosoymotaro"]=true,["Salleosmacro"]=true,["Cuecha"]=true,["Craquen"]=true,["Elau"]=true,["Udriell"]=true,["Soifong"]=true,["Ianthe"]=true,["Lacastigadaa"]=true,["Terryonx"]=true,["Annifer"]=true,["Candrael"]=true,["Daementia"]=true,["Xiios"]=true,["Xyelt"]=true,["Yunet"]=true,["Edufeinmann"]=true,["Alicate"]=true,["Akaite"]=true,["Qymera"]=true,["Vascor"]=true,["Provedora"]=true,["Lansus"]=true,["Treexxy"]=true,["Kioba"]=true,["Alexbjorn"]=true,["Drelock"]=true,["Nostro"]=true,["Kierath"]=true,["Bulkz"]=true,["Echydnas"]=true,["Litx"]=true,["Elysumprn"]=true,["Goldbanne"]=true,["Anihilation"]=true,["Lauwu"]=true,["Icebane"]=true,["Crazychaman"]=true,["Raffu"]=true,["Lianlii"]=true,["Dalu"]=true,["Ghostskull"]=true,["Xelshieldk"]=true,["Dampier"]=true,["Motaro"]=true,["Xllmerliinll"]=true,["Diosbanne"]=true,["Albedowr"]=true,["Damamuerte"]=true,["Shadowkillz"]=true,["Falconii"]=true,["Altamirano"]=true,["Elcoba"]=true,["Xelshieldsc"]=true,["Luminatis"]=true,["Elbroncass"]=true,["Renatazz"]=true,["Valtazar"]=true,["Consttantin"]=true,["Netanol"]=true,["Bloodofwar"]=true,["Barhus"]=true,["Itachiq"]=true,["Vandhijk"]=true,["Lilylou"]=true,["Doraemom"]=true,["Amabliitz"]=true,["Reaxion"]=true,["Icebanee"]=true,["Icebaane"]=true}

local wicked = {["Match"]=true,["Multibox"]=true,["Love"]=true,["Arise"]=true,["Epicury"]=true,["Xinnia"]=true,["Jacksoni"]=true,["Wicked"]=true,["Wtfleethax"]=true,["Astro"]=true,["Woef"]=true,["And"]=true,["Toxic"]=true,["Nexrox"]=true,["Rick"]=true,["Alphaxqt"]=true,["Gulmor"]=true,["Notscripted"]=true,["Lovext"]=true,["Rickowens"]=true,["Mini"]=true,["Trustworthy"]=true,["Gripxz"]=true,["Darksham"]=true,["Gokbori"]=true,["Bigfatfuk"]=true,["Romeo"]=true,["Imoonl"]=true,["Moonash"]=true,["Crazyaxe"]=true,["Delyss"]=true,["Arnus"]=true,["Akrateia"]=true,["Spysdiefirst"]=true,["Ryvall"]=true,["Gecko"]=true,["Fax"]=true,["Abyssdk"]=true,["Cobraax"]=true,["Affapabo"]=true,["Bawbag"]=true,["Pat"]=true,["Bestbowjobs"]=true,["Tasra"]=true,["Tazzwanted"]=true,["Tripas"]=true,["Goshia"]=true,["Corrosion"]=true,["Triper"]=true,["Gladiatard"]=true,["Ghostie"]=true,["Elyzix"]=true,["Minuit"]=true,["Drazzler"]=true,["Igf"]=true,["Sunarrow"]=true,["Aeriyaa"]=true,["Menrva"]=true,["Fulminare"]=true,["Carrymenow"]=true,["Highsupreme"]=true,["Natsune"]=true,["Mizatheone"]=true,["Zexus"]=true,["Trillex"]=true,["Rexyl"]=true,["Blames"]=true,["Jackiechai"]=true,["Doubt"]=true,["Ardenuff"]=true,["Oficreta"]=true,["Ingurgitate"]=true,["Rezerkiller"]=true,["Alphasis"]=true,["Lylianita"]=true,["Atomyk"]=true,["Oppijumm"]=true,["Beenz"]=true,["Altzheimer"]=true,["Czarnykruk"]=true,["Hazet"]=true,["Tomek"]=true,["Azot"]=true,["Loveyoutoo"]=true,["Whiteman"]=true,["Yaphets"]=true,["Jokezz"]=true,["Damz"]=true,["Abuzitin"]=true,["Ty"]=true,["Romelix"]=true,["Freezexs"]=true,["Spankey"]=true,["Dawkrian"]=true,["Zephyrra"]=true,["Penice"]=true,["Snykl"]=true,["Lavaradian"]=true,["Avengerx"]=true,["Prodijyzz"]=true,["Lipanek"]=true,["Errormacro"]=true,["Ammaya"]=true,["Tjasa"]=true,["Xolius"]=true,["Badassbroo"]=true,["Bohy"]=true,["Goremaker"]=true,["Someday"]=true,["Vaglef"]=true,["Noicemachine"]=true,["Madscientist"]=true,["Deathmindx"]=true,["Bigpwnddos"]=true,["Overdue"]=true,["Cikowar"]=true,["Kokainbaer"]=true,["Hateme"]=true,["Tquila"]=true,["Legendary"]=true,["Orcassm"]=true,["Fiske"]=true,["Tirrex"]=true,["Anaxo"]=true,["Terrx"]=true,["Darknessjan"]=true,["Avanora"]=true,["Lemhaf"]=true,["Direinsane"]=true,["Hypocrisy"]=true,["Bronski"]=true,["Hornysoul"]=true,["Mephilion"]=true,["Feni"]=true,["Irregular"]=true,["Volchek"]=true,["Naylah"]=true,["Iorick"]=true,["Regretfulx"]=true,["Nidhogg"]=true,["Lodfury"]=true,["Darkmurat"]=true,["Stronkex"]=true,["Corrxx"]=true,["Hmg"]=true,["Vanchev"]=true,["Greathful"]=true,["Ponylol"]=true,["Burgerofwar"]=true,["Trevomankata"]=true,["Rippera"]=true,["Sezen"]=true,["Persusmkd"]=true,["Vivid"]=true,["Stuxyqt"]=true,["Coldfreakz"]=true,["Kjeften"]=true,["Dissability"]=true,["Zoldycck"]=true,["Nitrous"]=true,["Layonass"]=true,["Scalpz"]=true,["Dotdotdie"]=true,["Arcadian"]=true,["Voltia"]=true,["Smothrage"]=true,["Garene"]=true,["Petulancia"]=true,["Callindor"]=true,["Archytas"]=true,["Toksikologia"]=true,["Ilxlxll"]=true,["Murrochka"]=true,["Wifilexus"]=true,["Dvigatell"]=true,["Runicpower"]=true,["Kyntalody"]=true,["Bolwars"]=true,["Chainmydice"]=true,["Leshim"]=true,["Cantstopmex"]=true,["Fearlless"]=true,["Lupetheus"]=true,["Razboinika"]=true,["Mcdouble"]=true,["Empower"]=true,["Amp"]=true,["Killereye"]=true,["Ilovenutella"]=true,["Danian"]=true,["Nqmadrama"]=true,["Qaelvayne"]=true,["Bellamurra"]=true,["Elshenks"]=true,["Parspriest"]=true,["Hayabbusa"]=true,["Showmedmoney"]=true,["Highdefinity"]=true,["Mangetsu"]=true,["Cowbell"]=true,["Exigence"]=true,["Ld"]=true,["Fckker"]=true,["Moonburnz"]=true,["Screamx"]=true,["Ottomanzz"]=true,["Jegernorsk"]=true,["Kjeftana"]=true,["Unburned"]=true,["Entropyum"]=true,["Soulidium"]=true,["Roes"]=true,["Felrazenx"]=true,["Heartsbane"]=true,["Nightboss"]=true,["Iwarlocki"]=true,["Boudinball"]=true,["Duvajga"]=true,["Tarvezad"]=true,["Spun"]=true,["Allex"]=true,["Resillient"]=true,["Corxcx"]=true,["Rickqt"]=true,["Sheargcd"]=true,["Peekaboo"]=true,["Vunderax"]=true,["Highhunterr"]=true,["Lunaroots"]=true,["Zuloo"]=true,["Allexxa"]=true,["Prodijizz"]=true,["Bretonia"]=true,["Valruse"]=true,["Pumpalot"]=true,["Bellackor"]=true,["Fed"]=true,["Holly"]=true,["Greekpala"]=true,["Elidia"]=true,["Nxtlvl"]=true,["Fecalmaterus"]=true,["Powerful"]=true,["Kaelarn"]=true,["Nerosa"]=true,["Easymage"]=true,["Mziper"]=true,["Aicyera"]=true,["Passpasspuff"]=true,["Spartanmvp"]=true,["Malkorr"]=true,["Wickedkokain"]=true,["Reddska"]=true,["Mbx"]=true,["Addrynnyn"]=true,["Changa"]=true,["Kokaiin"]=true,["Mallkor"]=true,["Watergate"]=true,["Tripasftw"]=true,["Pepesafado"]=true,["Elophia"]=true,["Arasatra"]=true,["Felrazen"]=true,["Ternax"]=true,["Ballbag"]=true,["Dhua"]=true,["Areo"]=true,["Stallinka"]=true,["Morwenn"]=true,["Amalakk"]=true,["Amethran"]=true,["Simonsaids"]=true,["Phantem"]=true,["Traumatiser"]=true,["Tanavarn"]=true,["Pontificum"]=true,["Straponiarz"]=true,["Hisnameisboo"]=true,["Felrazed"]=true,["Xamii"]=true,["Hart"]=true,["Mode"]=true,["Dieu"]=true,["Women"]=true,["Aeriaall"]=true,["Juizcy"]=true,["Dueover"]=true,["Illiriya"]=true,["Simonsays"]=true,["Slaymage"]=true,["Wrathful"]=true,["Iolyousuck"]=true,["Freefiree"]=true,["Bild"]=true,["Burst"]=true,["Meallkor"]=true,["Rickynelson"]=true,["Trivah"]=true,["Arnusx"]=true,["Atomikx"]=true,["Felrazedx"]=true,["Diezwiebel"]=true,["Myckz"]=true,["Allacoca"]=true,["Within"]=true,["Asharo"]=true,["Weirdpaladin"]=true,["Igotubro"]=true,["Xee"]=true,["Maladin"]=true,["Inseyn"]=true,["Murochka"]=true,["Warriorxx"]=true,["Juicykokain"]=true,["Rynginia"]=true,["Freakspeed"]=true,["Alphor"]=true,["Randia"]=true,["Divinebyzero"]=true,["Jizzrealgodx"]=true,["Wronglady"]=true,["Kirasmoon"]=true,["Steamm"]=true,["Telanyr"]=true,["Moonstrucker"]=true,["Rubilax"]=true,["Rogx"]=true,["Hypocrizy"]=true,["Richardgear"]=true,["Greathfull"]=true,["Sorenshamy"]=true,["Katybn"]=true,["Karyxix"]=true,["Felraizin"]=true,["Kokosdva"]=true,["Orgasmuss"]=true,["Zooldyck"]=true,["Nihiru"]=true,["Zenin"]=true,["Reryvall"]=true,["Inquisitre"]=true,["Stepmaster"]=true,["Hivaids"]=true,["Darkllord"]=true,["Laliy"]=true,["Priestchety"]=true,["Bullwarkqt"]=true,["Hellthrone"]=true,["Ottomanl"]=true,["Ottomanm"]=true,["Ottomano"]=true,["Ottomanp"]=true,["Mealkor"]=true,["Moralist"]=true,["Stoptafel"]=true,["Ebamilqgam"]=true,["Traumatised"]=true,["Naruzou"]=true,["Arnusxd"]=true,["Dryad"]=true,["Arnusdisease"]=true,["Arnusgrip"]=true,["Arnusxslave"]=true,["Tankandheal"]=true,["Jenaa"]=true,["Weirdest"]=true,["Deadlygladx"]=true,["Dilurka"]=true,["Astura"]=true,["Tearfulx"]=true,["Azzot"]=true,["Bitsoban"]=true,["Megaboii"]=true,["Slaypala"]=true,["Vhalakk"]=true,["Red"]=true,["Fenix"]=true,["Stupid"]=true,["Torch"]=true,["Video"]=true,["Eclipsi"]=true,["Rail"]=true,["Halla"]=true,["Slayhunt"]=true,["Manone"]=true,["Carnal"]=true,["Rankoneumad"]=true,["Pajjko"]=true,["Hakurenzz"]=true,["Slayerv"]=true,["Fyt"]=true,["Oficrete"]=true,["Parspalla"]=true,["Tuttix"]=true,["Natstrat"]=true,["Nqirx"]=true,["Disabiility"]=true,["Huntrose"]=true,["Angichkaa"]=true,["Hiixi"]=true,["Coyg"]=true,["Bigslamjam"]=true,["Rogexlol"]=true,["Nagroth"]=true,["Glacialspike"]=true,["Flameax"]=true,["Layla"]=true,["Ohmslaw"]=true,["Undower"]=true,["Aicer"]=true,["Freyja"]=true,["Besteulol"]=true,["Wja"]=true,["Wynm"]=true,["Yyasell"]=true,["Owerlock"]=true,["Tuff"]=true,["Shinyxx"]=true,["Mule"]=true,["Adammay"]=true,["Darxy"]=true,["Anestezie"]=true,["Malkor"]=true,["Astralglow"]=true,["Bird"]=true,["Rouben"]=true,["Trivap"]=true,["Ppacmann"]=true,["Amoreledis"]=true,["Koning"]=true,["Grobuoniss"]=true,["Secretagentx"]=true,["Sixspeed"]=true,["Ultimaratio"]=true,["Hemmor"]=true,["Litruxd"]=true,["Nikxa"]=true,["Sgtpacov"]=true,["Tankee"]=true,["Riveter"]=true,["Redds"]=true,["Behlnder"]=true,["Gabzs"]=true,["Crazyfleur"]=true,["Ewen"]=true,["Astrokhmer"]=true,["Deephh"]=true,["Exsess"]=true,["Phantam"]=true,["Pallyincloth"]=true,["Tifania"]=true,["Soulful"]=true,["Contrax"]=true,["Nieznamsie"]=true,["Agachee"]=true,["Makota"]=true,["Kawaiinagisa"]=true,["Helenx"]=true,["Miuega"]=true,["Padash"]=true,["Danchodancho"]=true,["Kissmyshots"]=true,["Esketiit"]=true,["Simonsay"]=true,["Lostrez"]=true,["Boromajster"]=true,["Dodobrains"]=true,["Ctl"]=true,["Avdala"]=true,["Tiddlywink"]=true,["Hentaimagea"]=true,["Saizou"]=true,["Keepweed"]=true,["Hynoel"]=true,["Bowchops"]=true,["Hina"]=true,["Annubiiss"]=true,["Coquelin"]=true,["Crenshaw"]=true,["Mummyboy"]=true,["Havy"]=true,["Votver"]=true,["Swampnikka"]=true,["Velmar"]=true,["Jerusalemx"]=true,["Valkirsum"]=true,["Yeslolquehay"]=true,["Ashbourrne"]=true,["Alarlaure"]=true,["Doriesh"]=true,["Ezzuknowme"]=true,["Aicygodx"]=true,["Idiotspec"]=true,["Vikipedia"]=true,["Prediction"]=true,["Shagata"]=true,["Bloodthwarr"]=true,["Lovesoul"]=true,["Moonbro"]=true,["Enoxo"]=true,["Wrag"]=true,["Warriorjani"]=true,["Phenomenia"]=true,["Aventvra"]=true,["Holylisa"]=true,["Scambot"]=true,["Sukiiqt"]=true,["Animekruto"]=true,["Touchmethere"]=true,["Arhimag"]=true,["Nenulegend"]=true,["Fnthxd"]=true}

local activetheme = {}
local numChildren = -1
local echoUpdateList = {}
local echoSelf = {}
local ForEachPlate		-- Function
local EMPTY_TEXTURE = "Interface\\Addons\\TidyPlates\\Media\\Empty"
local useAutohide = false
local select, pairs, tostring, CreateTidyPlatesStatusbar = select, pairs, tostring, CreateTidyPlatesStatusbar
local InCombat, HasTarget = false, false
local Plates, PlatesVisible = {}, {}
local GUID = {}
local _, nameplate, extended, bars, regions, visual
local unit, unitcache, style, stylename, styleOptions
local lastMouseover, currentTarget, unitchanged

local PlayerNameToGUID = {}
local PlayerNameToUnitID = {}
local PlayerNameToClass = {}

TidyPlates.GUID = GUID
TidyPlates.VisibleNameplates = PlatesVisible
TidyPlates.AllNameplates = Plates
SetCVar("threatWarning", 3)		-- Required for threat/aggro detection

local function IsPlateShown(plate) if plate:IsShown() then return true end end
--local function IsPlateShown(plate) if plate:IsShown() and extended:GetAlpha() > 0 then return true end end
local function SetSelfEcho(plate, func) if func then echoSelf[plate] = func end end
local function SetEchoUpdate(func) if func then echoUpdateList[func] = true end end

--------------------------------------------------------------------------------------------------------------
-- II. Frame/Layer Appearance Functions:  These functions set the appearance of specific object types
--------------------------------------------------------------------------------------------------------------
local function SetObjectShape(object, width, height) object:SetWidth(width); object:SetHeight(height) end
local function SetObjectFont(object,  font, size, flags) object:SetFont(font, size, flags) end
local function SetObjectJustify(object, horz, vert) object:SetJustifyH(horz); object:SetJustifyV(vert) end
local function SetObjectShadow(object, shadow) if shadow then object:SetShadowColor(0,0,0,1); object:SetShadowOffset(1, -1) else object:SetShadowColor(0,0,0,0) end  end
local function SetObjectAnchor(object, anchor, anchorTo, x, y) object:ClearAllPoints();object:SetPoint(anchor, anchorTo, anchor, x, y) end
local function SetObjectTexture(object, texture) object:SetTexture(texture); object:SetTexCoord(0,1,0,1)  end
local function SetObjectBartexture(object, texture, orientation) object:SetStatusBarTexture(texture); object:SetOrientation(orientation) end
-- SetFontGroupObject
local function SetFontGroupObject(object, objectstyle) 
	SetObjectFont(object, objectstyle.typeface, objectstyle.size, objectstyle.flags) 
	SetObjectJustify(object, objectstyle.align, objectstyle.vertical)
	SetObjectShadow(object, objectstyle.shadow)
end
-- SetAnchorGroupObject
local function SetAnchorGroupObject(object, objectstyle, anchorTo)
	SetObjectShape(object, objectstyle.width, objectstyle.height) --end				
	SetObjectAnchor(object, objectstyle.anchor, anchorTo, objectstyle.x, objectstyle.y) 
end
-- SetBarGroupObject
local function SetBarGroupObject(object, objectstyle, anchorTo)
	SetObjectShape(object, objectstyle.width, objectstyle.height) --end
	SetObjectAnchor(object, objectstyle.anchor, anchorTo, objectstyle.x, objectstyle.y) --end	
	SetObjectBartexture(object, objectstyle.texture, objectstyle.orientation) --end
end
--------------------------------------------------------------------------------------------------------------
-- III. Nameplate Style: These functions request updates for the appearance of the various graphical objects
--------------------------------------------------------------------------------------------------------------
local UpdateStyle
do
	-- UpdateStyle Variables
	local index, content
	local objectstyle, objectname, objectregion
	-- Style Property Groups
	local fontgroup = {"name", "level", "specialText", "specialText2"}
	local anchorgroup = {"healthborder", "threatborder", "castborder", "castnostop",
						"name",  "specialText", "specialText2", "level",
						"specialArt", "spellicon", "raidicon", "boxicon", "dangerskull"}
	local bargroup = {"castbar", "healthbar"}
	
	-- UpdateStyle: 
	function UpdateStyle()
		local styleOptions = style.options
		-- Hitbox
		if not InCombat then objectstyle = style.hitbox; SetObjectShape(nameplate, objectstyle.width, objectstyle.height) end
		-- Frame
		
		SetAnchorGroupObject(extended, style.frame, nameplate)
		-- Anchorgroup -- ; print("   ", objectname)for i, v in pairs(style[objectname]) do print(i,v) end
		for i = 1, #anchorgroup do objectname = anchorgroup[i]; SetAnchorGroupObject(visual[objectname], style[objectname], extended) end
		-- Bars
		for i = 1, #bargroup do objectname = bargroup[i]; SetBarGroupObject(bars[objectname], style[objectname], extended) end
		-- Texture
		SetObjectTexture(visual.castborder, style.castborder.texture)
		SetObjectTexture(visual.castnostop, style.castnostop.texture)
		-- Font Group
		for i = 1, #fontgroup do objectname = fontgroup[i];SetFontGroupObject(visual[objectname], style[objectname]) end
		-- Show/Hide
		if styleOptions.showName then visual.name:Show() else visual.name:Hide() end
		if styleOptions.showSpecialText then visual.specialText:Show() else visual.specialText:Hide() end
		if styleOptions.showSpecialText2 then visual.specialText2:Show() else visual.specialText2:Hide() end
		if styleOptions.showSpecialArt then visual.specialArt:Show() else visual.specialArt:Hide() end
		if styleOptions.showSpellIcon then visual.spellicon:Show() else visual.spellicon:Hide()  end
		if styleOptions.showLevel and (not unit.isBoss) then visual.level:Show() else visual.level:Hide() end
		if unit.isBoss and styleOptions.showDangerSkull then visual.dangerskull:Show() else visual.dangerskull:Hide() end
	end
end
--------------------------------------------------------------------------------------------------------------
-- IV. Indicators: These functions update the actual data shown on the graphical objects
--------------------------------------------------------------------------------------------------------------
local UpdateIndicator_CustomScaleText, UpdateIndicator_HealthBar, UpdateIndicator_Standard, UpdateIndicator_All, UpdateIndicator_CustomAlpha
local UpdateIndicator_Level, UpdateIndicator_ThreatGlow, UpdateIndicator_RaidIcon, UpdateIndicator_EliteIcon, UpdateIndicator_UnitColor, UpdateIndicator_Name
do
	local color = {}
	local threatborder, alpha, forcealpha, scale
	
	-- UpdateIndicator_HealthBar: Updates the amounts, color, and possible text of the health bar
	function UpdateIndicator_HealthBar()
		local styleOptions = style.options
		-- Set Health Bar
		if activetheme.SetHealthbarColor then
			bars.healthbar:SetStatusBarColor(activetheme.SetHealthbarColor(unit))
		else bars.healthbar:SetStatusBarColor(bars.health:GetStatusBarColor()) end	
		bars.healthbar:SetMinMaxValues(bars.health:GetMinMaxValues())
		bars.healthbar:SetValue(bars.health:GetValue())
		--[[ Set Text Fields
		if styleOptions and styleOptions.showSpecialText and activetheme.SetSpecialText then
			visual.specialText:SetText(activetheme.SetSpecialText(unit)) end
		if styleOptions and styleOptions.showSpecialText2 and activetheme.SetSpecialText2 then
			visual.specialText2:SetText(activetheme.SetSpecialText2(unit)) end
		--]]
	end

	-- UpdateIndicator_Name
	function UpdateIndicator_Name() 
		visual.name:SetText(unit.name)
	end
	
	-- UpdateIndicator_Level
	function UpdateIndicator_Level() 
		--if unit.isBoss then visual.level:SetText("??")
		--else visual.level:SetText(unit.level) end
		visual.level:SetText(unit.level)
		local tr, tg, tb = regions.level:GetTextColor()
		visual.level:SetTextColor(tr, tg, tb)
	end
	
	-- UpdateIndicator_ThreatGlow: Updates the aggro glow
	function UpdateIndicator_ThreatGlow() 
		local styleOptions = style.options
		--local r, g, b, a
		threatborder = visual.threatborder
		
		if activetheme.SetThreatColor then 
				--r, g, b, a = activetheme.SetThreatColor(unit) 
				--threatborder:SetVertexColor(r, g, b, (a or 1))
				threatborder:SetVertexColor(activetheme.SetThreatColor(unit) )
		else
			if InCombat and styleOptions.showAggroGlow  and unit.reaction ~= "FRIENDLY" and unit.type == "NPC" then
				local color = style.threatcolor[unit.threatSituation]
				--r, g, b, a = color.r, color.g, color.b, color.a
				threatborder:Show()
				threatborder:SetVertexColor(color.r, color.g, color.b, (color.a or 1))
			else threatborder:Hide() end
		end
	end
	
	-- UpdateIndicator_RaidIcon
	function UpdateIndicator_RaidIcon() 
		if unit.raidIcon then 
            if unit.name == "Orgrimmar Grunt" then
                -- unit.name = raidIconMap[unit.raidIcon] .. " " .. unit.name
                team1raidIcon = raidIconMap[unit.raidIcon]
                visual.boxicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. team1raidIcon)
                visual.boxicon:Show()
            end
			visual.raidicon:Show()
			visual.raidicon:SetTexCoord(regions.raidicon:GetTexCoord()) 
		else visual.raidicon:Hide() end
	end

	-- UpdateIndicator_BoxIcon
	function UpdateIndicator_BoxIcon() 
		if team1[unit.name] then 
            visual.boxicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_1")
			visual.boxicon:Show()
        elseif team2[unit.name] then 
            visual.boxicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_2")
			visual.boxicon:Show()
        elseif team3[unit.name] then 
            visual.boxicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_3")
			visual.boxicon:Show()
        elseif teamtest[unit.name] then 
            if team1raidIcon then
                unit.name = team1raidIcon .. " " .. unit.name
                UpdateIndicator_Name()
                visual.boxicon:SetTexture("Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\" .. team1raidIcon)
			    visual.boxicon:Show()
            end
        elseif gantz[unit.name] then 
            visual.boxicon:SetTexture("Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\taco")
			visual.boxicon:Show()
        elseif otto[unit.name] then 
            visual.boxicon:SetTexture("Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\cow")
			visual.boxicon:Show()
        elseif wicked[unit.name] then 
            visual.boxicon:SetTexture("Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\cow")
			visual.boxicon:Show()
        elseif elegant[unit.name] then 
            visual.boxicon:SetTexture("Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\\elegant")
			visual.boxicon:Show()
		else visual.boxicon:Hide() end
	end
	
	-- UpdateIndicator_EliteIcon
	function UpdateIndicator_EliteIcon() 
		
		if unit.isElite then 
			visual.healthborder:SetTexture( style.healthborder.elitetexture)
			threatborder:SetTexture(style.threatborder.elitetexture)
		else 
			visual.healthborder:SetTexture( style.healthborder.texture)
			threatborder:SetTexture(style.threatborder.texture) 
		end
	end
	
	-- UpdateIndicator_UnitColor: Update the health bar coloring, if needed
	function UpdateIndicator_UnitColor() 
		-- Set Health Bar
		if activetheme.SetHealthbarColor then
			bars.healthbar:SetStatusBarColor(activetheme.SetHealthbarColor(unit))
		else bars.healthbar:SetStatusBarColor(bars.health:GetStatusBarColor()) end	
	end

	-- UpdateIndicator_Standard: Updates Standard Indicators
	function UpdateIndicator_Standard()
		if IsPlateShown(nameplate) then
			if unitcache.name ~= unit.name then UpdateIndicator_Name() end
			if unitcache.level ~= unit.level then UpdateIndicator_Level() end
			if unitcache.threatSituation ~= unit.level then UpdateIndicator_ThreatGlow() end
			if unitcache.raidIcon ~= unit.level then UpdateIndicator_RaidIcon() end
			if unitcache.isElite ~= unit.isElite then UpdateIndicator_EliteIcon() end
			if (unitcache.red ~= unit.red) or (unitcache.green ~= unit.green) or (unitcache.blue ~= unit.blue) then
				UpdateIndicator_UnitColor() end
            UpdateIndicator_BoxIcon()
		end
	end
	
	-- GatherData_Alpha: Updates the 
	function UpdateIndicator_CustomAlpha()
		-- Set Alpha
		alpha = 1
		if activetheme.SetAlpha then 
			alpha, forcealpha = activetheme.SetAlpha(unit)
			if forcealpha then alpha = (alpha or 1)
			else alpha = (alpha or 1) * (unit.alpha or 1) end
			extended:SetAlpha(alpha) 
			visual.highlight:SetAlpha(alpha)
		else extended:SetAlpha(unit.alpha or 1) end
	end
	
	-- UpdateIndicator_CustomScaleText: Updates the custom indicators (text, image, alpha, scale)
	function UpdateIndicator_CustomScaleText()
		local styleOptions = style.options
		threatborder = visual.threatborder

		-- If plate is visible, handle indicators
		if alpha > 0 then
			-- Scale
			if activetheme.SetScale then 
				scale = activetheme.SetScale(unit)
				if scale then extended:SetScale( scale )end
			end
			-- Set Special-Case Regions
			if styleOptions.showSpecialText and activetheme.SetSpecialText then
				visual.specialText:SetText(activetheme.SetSpecialText(unit)) end
			if styleOptions.showSpecialText2 and activetheme.SetSpecialText2 then
				visual.specialText2:SetText(activetheme.SetSpecialText2(unit)) end
			if styleOptions.showSpecialArt and activetheme.SetSpecialArt then
				visual.specialArt:SetTexture(activetheme.SetSpecialArt(unit)) end
			if activetheme.SetHealthbarColor then
				bars.healthbar:SetStatusBarColor(activetheme.SetHealthbarColor(unit))
			else bars.healthbar:SetStatusBarColor(bars.health:GetStatusBarColor()) end	
		end
	end
	
		-- UpdateIndicator_All:
	function UpdateIndicator_All()
		UpdateIndicator_CustomAlpha()
		UpdateIndicator_CustomScaleText()
		UpdateIndicator_Standard()
	end
end
--------------------------------------------------------------------------------------------------------------
-- V. Data Gather: Gathers Information about the unit and requests updates, if needed
--------------------------------------------------------------------------------------------------------------
local OnNewNameplate, OnShowNameplate, OnHideNameplate, OnUpdateNameplate, OnResetNameplate, OnEchoNewNameplate
local OnStartCast, OnStopCast, OnUpdateCast
local OnCombatEventCastbar
local OnMouseoverNameplate, OnLeaveNameplate
local OnUpdateHealth, OnUpdateLevel, OnUpdateThreatSituation, OnUpdateRaidIcon
local ShowSpellFromGUID
do
	--------------------------------
	-- References and Cache
	--------------------------------
	-- UpdateUnitCache
	local function UpdateUnitCache() for key, value in pairs(unit) do unitcache[key] = value end end
	-- UpdateReferences
	function UpdateReferences(plate)
		unitchanged = false
		nameplate = plate
		extended = plate.extended
		bars = extended.bars
		regions = extended.regions 
		unit = extended.unit
		unitcache = extended.unitcache
		visual = extended.visual
		style = extended.style
	end
	
	--------------------------------
	-- Data Conversion Functions
	--------------------------------
	local ClassReference = {}		
	-- ColorToString: Converts a color to a string with a C- prefix
	local function ColorToString(r,g,b) return "C"..math.floor((100*r) + 0.5)..math.floor((100*g) + 0.5)..math.floor((100*b) + 0.5) end
	-- GetUnitCombatStatus: Determines if a unit is in combat by checking the name text color
	local function GetUnitCombatStatus(r, g, b) return (r > .5 and g < .5) end
	-- GetUnitAggroStatus: Determines if a unit is attacking, by looking at aggro glow region
	local GetUnitAggroStatus
	do
		local shown 
		local red, green, blue
		function GetUnitAggroStatus( region)
			shown = region:IsShown()
			if not shown then return "LOW" end
			red, green, blue = region:GetVertexColor()
			if green > .7 then return "MEDIUM" end
			if red > .7 then return "HIGH" end
		end
	end
	-- GetUnitReaction: Determines the reaction, and type of unit from the health bar color
	local function GetUnitReaction(red, green, blue)									
		if red < .01 and blue < .01 and green > .99 then return "FRIENDLY", "NPC" 
		elseif red < .01 and blue > .99 and green < .01 then return "FRIENDLY", "PLAYER"
		elseif red > .99 and blue < .01 and green > .99 then return "NEUTRAL", "NPC"
		elseif red > .99 and blue < .01 and green < .01 then return "HOSTILE", "NPC"
		else return "HOSTILE", "PLAYER" end
	end
	--
	local ux, uy
	local RaidIconCoordinate = { --from GetTexCoord. input is ULx and ULy (first 2 values).
		[0]		= { [0]		= "STAR", [0.25]	= "MOON", },
		[0.25]	= { [0]		= "CIRCLE", [0.25]	= "SQUARE",	},
		[0.5]	= { [0]		= "DIAMOND", [0.25]	= "CROSS", },
		[0.75]	= { [0]		= "TRIANGLE", [0.25]	= "SKULL", }, }
	-- Populates the class color lookup table
	for classname, color in pairs(RAID_CLASS_COLORS) do 
		ClassReference[ColorToString(color.r, color.g, color.b)] = classname end
	
	--------------------------------
	-- Mass Gather Functions
	--------------------------------
	local function GatherData_Alpha(plate)
			-- Alpha/Targeting
			--if printEvents then print(timeSlice, "GatherData_Alpha", plate.alpha) end
				

				unit.alpha = plate.alpha -- Set in PlateHandler's OnUpdate

			unit.isTarget = HasTarget and unit.alpha == 1
			unit.isMouseover = regions.highlight:IsShown()
			-- GUID
			if unit.isTarget and (not unit.guid) then 
				-- UpdateCurrentGUID
				unit.guid = UnitGUID("target") 
				if unit.guid then GUID[unit.guid] = plate end
				currentTarget = plate
				if activetheme.OnContextUpdate then activetheme.OnContextUpdate(unit) end
			end
	end
	
	local function GatherData_GUID()
		if unit.type == "PLAYER" and (not unit.guid) then
			-- UpdateCurrentGUID
			unit.guid = PlayerNameToGUID[unit.name]
			unit.partyID = PlayerNameToUnitID[unit.name]
			if activetheme.OnContextUpdate then activetheme.OnContextUpdate(unit) end
		end
		
		--[[ Testing...
		if unit.name == "Boognish" then 
			unit.partyID = "pet" 
			unit.guid = UnitGUID("pet")
		end
		--]]
		
	end
	
	-- GatherData_Static: Updates Static Information
	local function GatherData_Static()
		unit.name = regions.name:GetText()
		unit.isBoss = regions.dangerskull:IsShown()
		unit.isDangerous = unit.isBoss
		unit.isElite = (regions.eliteicon:IsShown() or 0) == 1
	end
	
	-- GatherData_BasicInfo: Updates Unit Variables
	local function GatherData_BasicInfo()
		if unit.isBoss then unit.level = "??"
		else unit.level = regions.level:GetText() end
		unit.health = bars.health:GetValue() or 0
		_, unit.healthmax = bars.health:GetMinMaxValues()
		
		if InCombat then
			unit.threatSituation = GetUnitAggroStatus(regions.threatglow) 
		else unit.threatSituation = "LOW" end
		
		unit.isMarked = regions.raidicon:IsShown() or false
		
		unit.isInCombat = GetUnitCombatStatus(regions.name:GetTextColor())
		unit.red, unit.green, unit.blue = bars.health:GetStatusBarColor()
		unit.levelcolorRed, levelcolorGreen, levelcolorBlue = regions.level:GetTextColor()
		unit.reaction, unit.type = GetUnitReaction(unit.red, unit.green, unit.blue)
		unit.class = ClassReference[ColorToString(unit.red, unit.green, unit.blue)] or "UNKNOWN"
		unit.InCombatLockdown = InCombat
		
		if regions.raidicon:IsShown() then 
			ux, uy = regions.raidicon:GetTexCoord()
			unit.raidIcon = RaidIconCoordinate[ux][uy]
		else unit.raidIcon = nil end
	end
	
	--------------------------------
	-- Graphical Updates
	--------------------------------
	-- UpdateStubbornRegions
	local function UpdateStubbornRegions()	
		visual.highlight:SetTexture(style.healthborder.glowtexture)
		visual.highlight:SetAllPoints(visual.healthborder)
		regions.spellicon:SetAlpha(0)
	end
	
	-- CheckNameplateStyle
	local function CheckNameplateStyle()
		if activetheme.SetStyle then 
			stylename = activetheme.SetStyle(unit); extended.style = activetheme[stylename]
		else extended.style = activetheme; stylename = tostring(activetheme) end
		style = extended.style
		if extended.stylename ~= stylename or forceStyleUpdate then 
			UpdateStyle()
			extended.stylename = stylename
		end
		
		UpdateStubbornRegions()
	end
	
	-- ProcessUnitChanges
	local function ProcessUnitChanges()	
			-- Unit Cache
			for key, value in pairs(unit) do 
				if unitcache[key] ~= value then 
					unitchanged = true 
				end
			end

			-- Update Style/Indicators
			if unitchanged then
				CheckNameplateStyle()
				UpdateIndicator_All()
				UpdateIndicator_HealthBar()
			end
			
			-- Update Widgets
			if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
			
			-- Cache the old unit information
			UpdateUnitCache()
	end

	--------------------------------
	-- Setup
	--------------------------------
	local function PrepareNameplate(plate)		---  UpdateStaticSegments
		-- Gather Basic Information
		GatherData_Static() 
		--unit.alpha = plate.alpha -- Set in PlateHandler's OnUpdate
		if not HasTarget then plate.alpha = 1 end
		unit.alpha = plate.alpha
		unit.isTarget = false
		unit.isMouseover = false
		extended.unitcache = wipe(extended.unitcache)				
		extended.stylename = ""		
		
		-- Graphics
		unit.isCasting = false
		bars.castbar:Hide()
		visual.highlight:Hide()
		
		-- Widgets/Extensions
		if activetheme.OnInitialize then activetheme.OnInitialize(extended) end	
	end

	--------------------------------
	-- Individual Gather/Entry-Point Functions
	--------------------------------
		
	-- OnHideNameplate
	function OnHideNameplate(plate)
		UpdateReferences(plate)
		if printEvents then print(timeSlice, "OnHideNameplate", plate, unit.name, unit.guid) end
		if unit.guid then GUID[unit.guid] = nil end
		visual.highlight:Hide()
		bars.castbar:Hide()
		PlatesVisible[plate] = nil
		wipe(extended.unit)
		wipe(extended.unitcache)
		
		if plate == currentTarget then currentTarget = nil end
	end
	
	-- [[  Intended to reduce CPU by bypassing the full update, and only checking the alpha value
	local function OnEchoNewNameplate(plate)
		if printEvents then print(timeSlice, "OnEchoNewNameplate", plate, "Starting") end
		if not plate:IsShown() then return end	
		-- Gather Information
		UpdateReferences(plate)
		if printEvents then print(timeSlice, "OnEchoNewNameplate", plate, unit.name) end
		GatherData_Alpha(plate)
		ProcessUnitChanges()
	end
	--]]
	
	function OnNewNameplate(plate)
		if printEvents then print(timeSlice, "OnNewNameplate", "Start") end
		
		local health, cast = plate:GetChildren()
		UpdateReferences(plate)
		PrepareNameplate(plate)
		
		GatherData_BasicInfo()
		GatherData_GUID()
		ProcessUnitChanges()

		-- Hook for Updates		
		health:HookScript("OnShow", function () OnShowNameplate(plate) end)
		health:HookScript("OnHide", function () OnHideNameplate(plate) end)
		health:HookScript("OnValueChanged", function () OnUpdateHealth(plate) end) 
		cast:HookScript("OnHide", function () OnStopCast(plate) end) 
		cast:HookScript("OnValueChanged", function () OnUpdateCast(plate) end) 
		
		if printEvents then health:HookScript("OnShow", function () print("Showing Health Bar", plate) end) end	-- testing
		
		--[[
		cast:HookScript("OnShow", function () 		-- Resets the castbar for the cast-hack
			bars.castbar:SetScript("OnUpdate", nil) 
			bars.castbar:Hide()
		end) 
		--]]
		
		-- Activates nameplate visibility
		PlatesVisible[plate] = true
		SetSelfEcho(plate, OnEchoNewNameplate)		-- Echo for a partial update (alpha only)
		if printEvents then print(timeSlice, "OnNewNameplate", unit.name) end
		--SetSelfEcho(plate, OnUpdateNameplate)		-- Echo for a full update
	end
	
	-- OnShowNameplate
	function OnShowNameplate(plate)
		-- Activate Plate
		PlatesVisible[plate] = true
		UpdateReferences(plate)
		PrepareNameplate(plate)
		
		GatherData_BasicInfo()
		--[[	Filtering Experiment
		-- Needs to be included in OnNew, too
		-- Needs to handle alpha of highlight
		if activetheme.ShouldDisplayUnit then 
			if not activetheme.ShouldDisplayUnit(unit) then
			PlatesVisible[plate] = nil
			-- ... Prevents the event handlers from processing this plate's data
			
			extended:SetAlpha(0)
			-- ... avoids the health and cast changes
			
			if printEvents then print(timeSlice, "OnShowNameplate", plate, unit.name, "Filtered Out") end
			return
			end
		end	
		--]]
		
		GatherData_GUID()
		ProcessUnitChanges()
		
		SetSelfEcho(plate, OnUpdateNameplate)		-- Echo for a full update
		if printEvents then print(timeSlice, "OnShowNameplate", plate, unit.name, "Shown") end
	end

	-- OnUpdateNameplate
	function OnUpdateNameplate(plate)
		if printEvents then print(timeSlice, "OnUpdate", unit.name) end
		
		if not plate:IsShown() then return end	
		-- Gather Information
		UpdateReferences(plate)
		GatherData_Alpha(plate)
		GatherData_BasicInfo()
		ProcessUnitChanges()
	end
	
	-- OnUpdateLevel
	function OnUpdateLevel(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if unit.isBoss then unit.level = "??"
		else unit.level = regions.level:GetText() end
		UpdateIndicator_Level()
	end
	
	-- OnUpdateThreatSituation
	function OnUpdateThreatSituation(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if InCombat then
			unit.threatSituation = GetUnitAggroStatus(regions.threatglow) 
		else unit.threatSituation = "LOW" end
				
		if activetheme.SetHealthbarColor then
			bars.healthbar:SetStatusBarColor(activetheme.SetHealthbarColor(unit))
		else bars.healthbar:SetStatusBarColor(bars.health:GetStatusBarColor()) end	
		
		CheckNameplateStyle()
		UpdateIndicator_ThreatGlow()
		UpdateIndicator_CustomAlpha()
		UpdateIndicator_CustomScaleText()
	end
	
	-- OnUpdateRaidIcon
	function OnUpdateRaidIcon(plate) 
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if regions.raidicon:IsShown() then 
			ux, uy = regions.raidicon:GetTexCoord()
			unit.raidIcon = RaidIconCoordinate[ux][uy]
		else unit.raidIcon = false end
		unit.isMarked = regions.raidicon:IsShown()
		UpdateIndicator_RaidIcon()
	end
	
	-- OnUpdateReaction
	function OnUpdateReaction(plate) 
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		unit.red, unit.green, unit.blue = bars.health:GetStatusBarColor()
		unit.reaction, unit.type = GetUnitReaction(unit.red, unit.green, unit.blue)
		unit.class = ClassReference[ColorToString(unit.red, unit.green, unit.blue)] or "UNKNOWN"
		UpdateIndicator_UnitColor()
		UpdateIndicator_CustomScaleText()
	end	

	-- OnUpdateReaction
	function OnLeaveNameplate(plate)
		plate.extended.unit.isMouseover = false
		-- Should I update all indicators when the mouse leaves?
		-- UpdateIndicator_CustomScaleText(plate)
		--if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end
	
	-- OnMouseoverNameplate
	function OnMouseoverNameplate(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if printEvents then print(timeSlice, "OnMouseoverNameplate", unit.name) end
		unit.isMouseover = regions.highlight:IsShown()
		
		if unit.isMouseover and (not unit.guid) then 
			-- UpdateCurrentGUID
			unit.guid = UnitGUID("mouseover") 
			if unit.guid then GUID[unit.guid] = plate end
			if activetheme.OnContextUpdate then activetheme.OnContextUpdate(unit) end
		end
		
		UpdateIndicator_CustomScaleText()
		
		-- Widgets
		if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- OnUpdateHealth
	function OnUpdateHealth(plate)
		if not IsPlateShown(plate) then return end
		
		UpdateReferences(plate)
		
		if printEvents then print(timeSlice, "OnUpdateHealth", unit.name) end
		unit.health = bars.health:GetValue() or 0
		_, unit.healthmax = bars.health:GetMinMaxValues()
		UpdateIndicator_HealthBar()
		UpdateIndicator_CustomAlpha()
		UpdateIndicator_CustomScaleText()
		--UpdateIndicator_CustomScaleText(plate)
		--if activetheme.OnUpdate then activetheme.OnUpdate(extended, unit) end
	end

	-- OnStartCast
	function OnStartCast(plate)	
		UpdateReferences(plate)
		local cast, castbar = bars.cast, bars.castbar
		if not cast:IsShown() then return end
		
		local spell, rank, displayName, icon, startTime
		local endTime, isTradeSkill, castID, notInterruptible 
		
		
		spell, rank, displayName, icon, startTime,
			endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo("target")
		if not spell then 
			spell, rank, displayName, icon, startTime, 
				endTime, isTradeSkill, notInterruptible = UnitChannelInfo("target")
		end	
		
		if spell then
			unit.isCasting = true
			UpdateStubbornRegions()
			UpdateIndicator_CustomScaleText()

			local r, g, b, a 
			if activetheme.SetCastbarColor then
				r, g, b, a = activetheme.SetCastbarColor(unit)
			else r, g, b, a = cast:GetStatusBarColor() end	
			--print(r, g, b, a)
			bars.castbar:SetStatusBarColor( r, g, b, a or 1)
			
			castbar:SetMinMaxValues(cast:GetMinMaxValues())
			castbar:SetValue(cast:GetValue())
			castbar:Show()	

			visual.spellicon:SetTexture(icon)
			if notInterruptible then 
				visual.castnostop:Show(); visual.castborder:Hide()
			else visual.castnostop:Hide(); visual.castborder:Show() end
		end
	end
	
	-- OnStopCast
	function OnStopCast(plate)
		UpdateReferences(plate)

		unit.isCasting = false
		SetSelfEcho(plate, OnUpdateNameplate)
		bars.castbar:Hide()	
	end
	
	-- OnUpdateCast
	function OnUpdateCast(plate)
		if not IsPlateShown(plate) then return end
		UpdateReferences(plate)
		if bars.castbar:IsShown() then 
			
			local castremain = bars.cast:GetValue()
			UpdateStubbornRegions()
			--bars.castbar:SetStatusBarColor(bars.cast:GetStatusBarColor())
			bars.castbar:SetMinMaxValues(bars.cast:GetMinMaxValues())
			bars.castbar:SetValue(castremain)
			bars.castbar:Show()	
		else OnStartCast(plate) end
	end	
	
	-- OnResetNameplate
	function OnResetNameplate(plate)
		local extended = plate.extended
		extended.unitcache = wipe(extended.unitcache)				
		extended.stylename = ""
		OnShowNameplate(plate)
	end
	
--[[
	-------------------------------------------------------------------------
	-- Casting Bar hack
	-------------------------------------------------------------------------

	local function UpdateSelfCast(self)
		local currentTime = GetTime()
		if currentTime > self.endTime then
			self:SetScript("OnUpdate", nil)
			self:Hide()
			return
		end
		self:SetValue(currentTime)
	end

	--local function ShowSpellCastEvent(plate,  spell, icon, startTime, endTime, notInterruptible)
	function ShowSpellFromGUID(sourceguid,  spell, icon, startTime, endTime, notInterruptible)
		if not (sourceguid and spell and icon and startTime and endTime) then return end
		local plate = GUID[sourceguid]
		if not plate then return end
		
		UpdateReferences(plate)
		if unit.isTarget then return end
		local castbar = bars.castbar
		UpdateStubbornRegions()
		
		-- unit.isCasting = true
		-- unit.spellName = spell		-- Update Core to also provide this info
		--visual.specialText2:SetText(spell);
		--visual.specialText2:Show();
		
		-- Standard Casting Graphics
		visual.spellicon:SetTexture(icon)
		if notInterruptible then visual.castnostop:Show(); visual.castborder:Hide()
		else visual.castnostop:Hide(); visual.castborder:Show() end
		
		-- Cast Bar
		castbar.endTime = endTime
		castbar:SetMinMaxValues(startTime, endTime)
		castbar:SetValue(0)
		castbar:SetStatusBarColor(1, .5, 0)
		castbar:Show()	
		castbar:SetScript("OnUpdate", UpdateSelfCast)
	end
	
	-- function HideSpellFromGUID(sourceguid) end
--]]


end

--------------------------------------------------------------------------------------------------------------
-- VI. Nameplate Extension: Applies scripts, hooks, and adds additional frame variables and elements
--------------------------------------------------------------------------------------------------------------
local ApplyPlateExtension
do
	local bars, regions, health, castbar, healthbar, visual
	local region
	
	
	function ApplyPlateExtension(plate)
		if printEvents then print(timeSlice, "ApplyPlateExtension", plate) end
		
		Plates[plate] = true
		plate.extended = CreateFrame("Frame", nil, plate)
		local extended = plate.extended
		
		extended:SetPoint("CENTER", plate)
		extended.style, extended.unit, extended.unitcache, extended.stylecache, extended.widgets = {}, {}, {}, {}, {}
		
		extended.regions, extended.bars, extended.visual = {}, {}, {}
		regions = extended.regions
		bars = extended.bars
		bars.health, bars.cast = plate:GetChildren()
		extended.stylename = ""

		-- Set Frame Levels and Parent
		regions.threatglow, regions.healthborder, regions.castborder, regions.castnostop,
			regions.spellicon, regions.highlight, regions.name, regions.level,
			regions.dangerskull, regions.raidicon, regions.eliteicon = plate:GetRegions()
			
		-- This block makes the Blizz nameplate invisible
		regions.threatglow:SetTexCoord( 0, 0, 0, 0 )
		regions.healthborder:SetTexCoord( 0, 0, 0, 0 )
		regions.castborder:SetTexCoord( 0, 0, 0, 0 )
		regions.castnostop:SetTexCoord( 0, 0, 0, 0 )
		regions.dangerskull:SetTexCoord( 0, 0, 0, 0 )
		regions.eliteicon:SetTexCoord( 0, 0, 0, 0 )
		regions.name:SetWidth( 000.1 )
		regions.level:SetWidth( 000.1 )
		regions.raidicon:SetAlpha( 0 )
	
		bars.health:SetStatusBarTexture(EMPTY_TEXTURE) 
		bars.cast:SetStatusBarTexture(EMPTY_TEXTURE) 

		-- Create Statusbars
		local level = plate:GetFrameLevel()
		bars.healthbar = CreateTidyPlatesStatusbar(extended) 
		bars.castbar = CreateTidyPlatesStatusbar(extended) 
		
		health, cast, healthbar, castbar = bars.health, bars.cast, bars.healthbar, bars.castbar
		healthbar:SetFrameLevel(level)
		castbar:Hide()
		castbar:SetFrameLevel(level)
		castbar:SetStatusBarColor(1,.8,0)
		
		-- Create Visual Regions
		visual = extended.visual
		visual.threatborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.specialArt = extended:CreateTexture(nil, "OVERLAY")
		visual.specialText = healthbar:CreateFontString(nil, "OVERLAY")
		visual.specialText2 = healthbar:CreateFontString(nil, "OVERLAY")
		visual.healthborder = healthbar:CreateTexture(nil, "ARTWORK")
		visual.threatborder = healthbar:CreateTexture(nil, "OVERLAY")
		visual.castborder = castbar:CreateTexture(nil, "ARTWORK")
		visual.castnostop = castbar:CreateTexture(nil, "ARTWORK")
		visual.spellicon = castbar:CreateTexture(nil, "OVERLAY")
		visual.dangerskull = healthbar:CreateTexture(nil, "OVERLAY")
		visual.raidicon = healthbar:CreateTexture(nil, "OVERLAY")
		visual.eliteicon = healthbar:CreateTexture(nil, "OVERLAY")
		visual.name  = extended:CreateFontString(nil, "ARTWORK")
		visual.level = extended:CreateFontString(nil, "OVERLAY")
		
		visual.highlight = regions.highlight
		
		visual.raidicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
		visual.dangerskull:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Skull")
		

        -- Box
		visual.boxicon = healthbar:CreateTexture(nil, "OVERLAY")

		-- visual.team2icon:SetTexture("Interface\\Addons\\TidyPlates\\Widgets\\BoxWidget\dog")


		OnNewNameplate(plate)
		--SetSelfEcho(plate, OnNewNameplate)
		
		if printEvents then print(timeSlice, "ApplyPlateExtension", plate, "Done") end
	end
	
end

--------------------------------------------------------------------------------------------------------------
-- VII. World Update Functions: Refers new plates to 'ApplyPlateExtension()', and watches for Alpha/Transparency
-- and Highlight/Mouseover changes, and sends those changes to the appropriate handler.
-- Also processes the update queue (ie. echos)
--------------------------------------------------------------------------------------------------------------
local OnUpdate
do
	local plate, curChildren
	local PlateSetAlpha, PlateGetAlpha	-- Local copies of methods are faster than table method lookups
	local WorldGetNumChildren, WorldGetChildren = WorldFrame.GetNumChildren, WorldFrame.GetChildren
	
	-- IsFrameNameplate: Checks to see if the frame is a Blizz nameplate
	local function IsFrameNameplate(frame)
		local region = frame:GetRegions()
		return region and region:GetObjectType() == "Texture" and region:GetTexture() == "Interface\\TargetingFrame\\UI-TargetingFrame-Flash" 
	end
	
	-- OnWorldFrameChange: Checks for new Blizz Plates
	local function OnWorldFrameChange(...)
		for index = 1, select("#", ...) do
			plate = select(index, ...)
			if not Plates[plate] and IsFrameNameplate(plate) then
				ApplyPlateExtension(plate)
				if not PlateSetAlpha then
					PlateSetAlpha = plate.SetAlpha
					PlateGetAlpha = plate.GetAlpha
				end
			end
		end
	end
	
	-- ForEachPlate
	function ForEachPlate(functionToRun, ...)
		for plate in pairs(PlatesVisible) do
			if plate.extended:IsShown() then -- Plate and extended frame both explicitly visible
				functionToRun(plate, ...)
			end
		end
	end
	
	
	local func, runIt, existMouseover
	-- OnUpdate: This function is processed every frame
	function OnUpdate(self)
		if printEvents then timeSlice = timeSlice + 1 end
		
		existMouseover = false
		
		-- This block checks for alpha and highlight changes
		for plate in pairs(PlatesVisible) do
			
			-- Alpha Changes...
			if (HasTarget) then 
				plate.alpha = PlateGetAlpha(plate)	-- Save original alpha before reset
				PlateSetAlpha(plate, 1) 			-- Restore full opacity
			end
			
			-- Highlight Changes...
			if plate.extended.regions.highlight:IsShown() then
				existMouseover = true
				if lastMouseover ~= plate then
					ForEachPlate(OnLeaveNameplate)
					lastMouseover = plate
					OnMouseoverNameplate(plate)  -- OnMouseover will change to set the current plate
				end
			end
		end

		if not existMouseover then lastMouseover = nil end

		-- Process Update Queue
		if echoUpdateList[OnResetNameplate] then
			ForEachPlate(OnResetNameplate)
			for func, runIt in pairs(echoUpdateList) do echoUpdateList[func] = nil end
		else
			-- Run an update function on all visible plates...
			for func, runIt in pairs(echoUpdateList) do
				echoUpdateList[func] = nil
				if runIt then ForEachPlate(func) end
			end
			-- Run an update on a specific plate...
			for plate, func in pairs(echoSelf) do
				echoSelf[plate] = nil
				func(plate)
			end
		end	
		
		-- Find New Plates
		curChildren = WorldGetNumChildren(WorldFrame)
		if (curChildren ~= numChildren) then
			numChildren = curChildren
			OnWorldFrameChange(WorldGetChildren(WorldFrame)) 
		end	
	end
	-- End OnUpdate
end
--------------------------------------------------------------------------------------------------------------
-- VIII. Event Handlers: sends event-driven changes to  the appropriate gather/update handler.
--------------------------------------------------------------------------------------------------------------
do
	local events = {}
	local function EventHandler(self, event, ...)
		events[event](...)
		if printEvents then print(timeSlice, event) end
	end
	local PlateHandler = CreateFrame("Frame", nil, WorldFrame)
	PlateHandler:SetFrameStrata("TOOLTIP") -- When parented to WorldFrame, causes OnUpdate handler to run close to last
	PlateHandler:SetScript("OnEvent", EventHandler)
	-- Events
	function events:PLAYER_ENTERING_WORLD() PlateHandler:SetScript("OnUpdate", OnUpdate) end
	function events:PLAYER_REGEN_ENABLED() InCombat = false; SetEchoUpdate(OnUpdateNameplate); if useAutoHide then SetCVar("nameplateShowEnemies", 0) end end
	function events:PLAYER_REGEN_DISABLED() InCombat = true; SetEchoUpdate(OnUpdateNameplate); if useAutoHide then SetCVar("nameplateShowEnemies", 1) end end
	function events:PLAYER_TARGET_CHANGED()
		HasTarget = UnitExists("target") == 1 -- Must be bool, never nil!
		if (not HasTarget) then
			currentTarget = nil
			for plate in pairs(PlatesVisible) do
				plate.alpha = 1
			end
		end
		SetEchoUpdate(OnUpdateNameplate)		-- Could be "SetEchoUpdate(UpdateTarget), someday...  :-o
	end

	function events:RAID_TARGET_UPDATE() ForEachPlate(OnUpdateRaidIcon) end
	function events:UNIT_THREAT_SITUATION_UPDATE() SetEchoUpdate(OnUpdateThreatSituation); end

	function events:UNIT_LEVEL() ForEachPlate(OnUpdateLevel) end
	function events:PLAYER_CONTROL_LOST() ForEachPlate(OnUpdateReaction) end
	function events:PLAYER_CONTROL_GAINED() ForEachPlate(OnUpdateReaction) end		
	function events:UNIT_FACTION() ForEachPlate(OnUpdateReaction) end	

	function events:UNIT_THREAT_LIST_UPDATE() 
		if currentTarget and currentTarget.extended and activetheme.OnUpdate then 
				activetheme.OnUpdate(currentTarget.extended,currentTarget.extended.unit) 
		end 
	end
	
	local function CheckGroupMembers(grouptype, size)
		local unitid, unitname, _
		for i =1,size do 
			unitid = grouptype..i
			unitname = UnitName(unitid)
			if unitname then 
				PlayerNameToGUID[unitname] = UnitGUID(unitid)
				PlayerNameToUnitID[unitname] = unitid
				_, PlayerNameToClass[unitname] = UnitClass(unitid)
				if printEvents then 
					print(unitname, PlayerNameToUnitID[unitname], PlayerNameToClass[unitname], PlayerNameToGUID[unitname] ) 
				end
			end
		end
	end
	
	function events:ARENA_OPPONENT_UPDATE()	
		if IsActiveBattlefieldArena() then
			wipe(PlayerNameToGUID)
			wipe(PlayerNameToUnitID)
			CheckGroupMembers("arena", 5)
			CheckGroupMembers("party", 5)
		end
	end
	
	function events:PARTY_MEMBERS_CHANGED()
		if UnitInParty("player") and (not UnitInRaid("player")) then
			--wipe(PlayerNameToGUID)
			wipe(PlayerNameToUnitID)
			CheckGroupMembers("party", 5)
		end
	end
	
	function events:RAID_ROSTER_UPDATE()
		if UnitInRaid("player") then
			--wipe(PlayerNameToGUID)
			wipe(PlayerNameToUnitID)
			CheckGroupMembers("raid", 40)
		end
	end
	
	-- Registration of Blizzard Events
	for eventname in pairs(events) do PlateHandler:RegisterEvent(eventname) end	
end

--------------------------------------------------------------------------------------------------------------
-- IX. External Commands: Allows widgets and themes to request updates to the plates, in response to
-- externally-captures data (such as the combat log)
--------------------------------------------------------------------------------------------------------------
function TidyPlates:ForceUpdate() SetEchoUpdate(OnResetNameplate) end
TidyPlates.Update = function() SetEchoUpdate(OnUpdateNameplate) end
function TidyPlates:UseAutoHide(option) useAutoHide = option; if useAutoHide and (not InCombat) then SetCVar("nameplateShowEnemies", 0) end end
function TidyPlates:ActivateTheme(theme) if theme and type(theme) == 'table' then activetheme = theme; end end

--[[	
	-------------------------------------------------------------------------
	-- Casting Bar hack, cont.
	-------------------------------------------------------------------------
	
	function OnCombatEventCastbar(self, event, timestamp, ...)
		local combatevent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellid, spellname = ...
		if (combatevent ~= "SPELL_CAST_START") then return end
		
		local currentTime = GetTime()
		local spell, _, icon, _, _, _, castTime, _, _ = GetSpellInfo(spellid)
		if castTime then ShowSpellFromGUID(sourceGUID, spell, icon, currentTime, currentTime + (castTime/1000), true) end
	end
	
		local CombatCastEventWatcher = CreateFrame("Frame")
		CombatCastEventWatcher:SetScript("OnEvent", OnCombatEventCastbar) 
		CombatCastEventWatcher:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");

--/run for id, plate in pairs(TidyPlates.GUID) do print(id, plate, plate.extended.unit.name, plate.extended:IsShown()) end
--/run for name, guid in pairs(TidyPlates.PlayerNameToGUID) do print(name, guid) end
--]]	
