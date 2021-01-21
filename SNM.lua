
gg.alert("Wait For  Seconds")

if gg.getTargetPackage() == "com.tencent.ig" or gg.getTargetPackage() == "com.rekoo.pubgm" or gg.getTargetPackage() == "com.vng.pubgmobile" or gg.getTargetPackage() == "com.pubg.krmobile" then
gg.clearResults()
else
gg.setVisible(false)
gg.alert("??PUBG NOT FOUND..!!??")
os.exit()
end
log = {} 
for i = 1, 40000 do 
table.insert(log, {address = 127 + i, flags = 12, values = 127}) 
end 
clock = os.clock() 
time = os.time() 
for i = 1, 6 do gg.addListItems(log) end 
if os.clock() - clock > 2 then 
gg.removeListItems(log)  
os.exit() 
end  
gg.clearList()
function split(szFullString, szSeparator)
local nFindStartIndex = 1 
local nSplitIndex = 1 
local nSplitArray = {} while true do 
local 
nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) 
if not nFindLastIndex then 
nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) 
break end 
nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) 
nFindStartIndex = nFindLastIndex + string.len(szSeparator) 
nSplitIndex = nSplitIndex + 1 end return 
nSplitArray end function 
xgxc(szpy, MS) for x = 1, #(MS) do 
xgpy = szpy + MS[x]["offset"] xglx = MS[x]["type"] 
xgsz = MS[x]["value"] 
gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) 
xgsl = xgsl + 1 end end function 
MoShinp(MoShi) 
gg.clearResults() 
gg.setRanges(MoShi[1]["memory"]) 
gg.searchNumber(MoShi[3]["value"], MoShi[3]["type"]) 
if gg.getResultCount() == 0 then 
gg.toast(MoShi[2]["name"] .. "")
else 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
if gg.getResultCount() == 0 then 
gg.toast(MoShi[2]["name"] .. "") 
else 
sl = gg.getResults(999999) 
sz = gg.getResultCount() 
xgsl = 0 if sz > 999999 then 
sz = 999999 end for i = 1, sz do 
pdsz = true for v = 4, #(MoShi) do if 
pdsz == true then 
pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + MoShi[v]["offset"] 
pysz[1].flags = MoShi[v]["type"] 
szpy = gg.getValues(pysz) 
pdpd = MoShi[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") 
tzszpd = szpd[1] 
pyszpd = szpd[2] 
if tzszpd == pyszpd then 
pdjg = true pdsz = true else 
pdjg = false pdsz = false end end end 
if pdjg == true then 
szpy = sl[i].address xgxc(szpy, MS) 
xgjg = true end end 
if xgjg == true then 
gg.toast(MoShi[2]["name"] .. "" .. xgsl .. "") 
else 
gg.toast(MoShi[2]["name"] .. "") 
end 
end 
end 
end


function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    local data = {} 
    local base = Search[1][2] 
    
   if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true 
        end
        
        for k=2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base 
            local num = Search[k][1] 
            
            for i, v in ipairs(result) do
                tmp[#tmp+1] = {} 
                tmp[#tmp].address = v.address + offset  
                tmp[#tmp].flags = v.flags  
            end
            
            tmp = gg.getValues(tmp) 
            
            for i, v in ipairs(tmp) do
                if ( tostring(v.value) ~= tostring(num) ) then 
                    result[i].isUseful = false 
                end
            end
        end
  
        for i, v in ipairs(result) do
            if (v.isUseful) then 
                data[#data+1] = v.address
            end
        end
     
        if (#data > 0) then
           gg.toast(""..#data.."")
           local t = {}
           local base = Search[1][2]
           for i=1, #data do
               for k, w in ipairs(Write) do
                   offset = w[2] - base
                   t[#t+1] = {}
                   t[#t].address = data[i] + offset
                   t[#t].flags = Type
                   t[#t].value = w[1]
                  
                   if (w[3] == true) then
                       local item = {}
                       item[#item+1] = t[#t]
                       item[#item].freeze = true
                       gg.addListItems(item)
                   end
                 
               end
           end
           gg.setValues(t)
       
        else
            gg.toast("", false)
            return false
        end
    else
        gg.toast("")
        return false
    end
end


local app = {}
function Assert(data)
if data == nil or data == "" or data == "nil" then
return false
else
return true
end
end
function mearrass(memory, array)
if Assert(memory) and Assert(array) then
return true
else
return false
end
end
function typetab(array, type)
local datatype = {}
for i = 1, #array do
if Assert(array[i].type) then
table.insert(datatype, i, array[i].type)
else
if Assert(type) then
table.insert(datatype, i, type)
else
return false
end
end
end
return true, datatype
end
function app.memorysearch(memory, array, type)
gg.setVisible(false)
local rx = mearrass(memory, array)
if rx then
local rx, datatype = typetab(array, type)
if rx then
if Assert(array[1].hv) then
gg.clearResults()
gg.setRanges(memory)
gg.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1])
else
gg.clearResults()
gg.setRanges(memory)
gg.searchNumber(array[1].lv, datatype[1])
end
if gg.getResultCount() == 0 then
return false
else
local tab = {}
local data = gg.getResults(gg.getResultCount())
gg.clearResults()
for i = 1, #data do
data[i].rx = true
end
for i = 2, #array do
local t = {}
local offset = array[i].offset
for x = 1, #data do
t[#t + 1] = {}
t[#t].address = data[x].address + offset
t[#t].flags = datatype[i]
end
local t = gg.getValues(t)
for z = 1, #t do
if Assert(array[i].hv) then
if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then
data[z].rx = false
end
else
if tostring(t[z].value) ~= tostring(array[i].lv) then
data[z].rx = false
end
end
end
end
for i = 1, #data do
if data[i].rx then
tab[#tab + 1] = data[i].address
end
end
if #tab > 0 then
return true, tab
else
return false
end
end
else
print("wrong type parameter")
gg.toast("wrong type parameter")
os.exit()
end
else
print("memory or array parameter error")
gg.toast("memory or array parameter error")
os.exit()
end
end
function app.memoryread(addr, type)
local t = {}
t[1] = {}
t[1].address = addr
t[1].flags = type
if #t > 0 then
return true, gg.getValues(t)[1].value
else
return false
end
end
function app.memorywrite(addr, type, value, freeze)
local t = {}
t[1] = {}
t[1].address = addr
t[1].flags = type
t[1].value = value
if #t > 0 then
if Assert(freeze) then
t[1].freeze = freeze
--gg.setValues(t)
return gg.addListItems(t)
else
return gg.setValues(t)
end
else
return false
end
end
function edit(orig,ret)_om=orig[1].memory or orig[1][1]_ov=orig[3].value or orig[3][1]_on=orig[2].name or orig[2][1]gg.clearResults()gg.setRanges(_om)gg.searchNumber(_ov,orig[3].type or orig[3][2])sz=gg.getResultCount()if sz<1 then gg.toast(_on.."¿ªÆôÊ§°Ü")else sl=gg.getResults(720)for i=1,sz do ist=true for v=4,#orig do if ist==true and sl[i].value==_ov then cd={{}}cd[1].address=sl[i].address+(orig[v].offset or orig[v][2])cd[1].flags=orig[v].type or orig[v][3]szpy=gg.getValues(cd)cdlv=orig[v].lv or orig[v][1]cdv=szpy[1].value if cdlv==cdv then pdjg=true ist=true else pdjg=false ist=false end end end if pdjg==true then szpy=sl[i].address for x=1,#(ret)do xgpy=szpy+(ret[x].offset or ret[x][2])xglx=ret[x].type or ret[x][3]xgsz=ret[x].value or ret[x][1]xgdj=ret[x].freeze or ret[x][4]xgsj={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xgsj[1].freeze=xgdj gg.addListItems(xgsj)else gg.setValues(xgsj)end end xgjg=true end end if xgjg==true then gg.toast(_on.."³É¹¦")else gg.toast(_on.."Ê§°Ü")end end end
function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("ËÑË÷µ½"..#data.."ÌõÊý¾Ý") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("Ð¡ÄÏ"..#t.."¸ö´úÂë") gg.addListItems(t) else gg.toast("Ð¡ÄÏ", false) return false end else gg.toast("²»·¢ÏÖ´úÂë") return false end end
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Ê§°Ü") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Ê§°Ü") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "³É¹¦" .. xgsl .. "¸ö´úÂë") else gg.toast(qmnb[2]["name"] .. "³É¹¦") end end end end
function Fxs(Search, Write,Neicun,Mingcg,Shuzhiliang)  gg.clearResults()  gg.setRanges(Neicun)  gg.setVisible(false)  gg.searchNumber(Search[1][1], Search[1][3])  local count = gg.getResultCount()  local result = gg.getResults(count)  gg.clearResults()  local data = {}   local base = Search[1][2]    if (count > 0) then  for i, v in ipairs(result) do  v.isUseful = true  end  for k=2, #Search do  local tmp = {}  local offset = Search[k][2] - base   local num = Search[k][1]    for i, v in ipairs(result) do  tmp[#tmp+1] = {}  tmp[#tmp].address = v.address + offset  tmp[#tmp].flags = Search[k][3]  end    tmp = gg.getValues(tmp)    for i, v in ipairs(tmp) do  if ( tostring(v.value) ~= tostring(num) ) then  result[i].isUseful = false  end  end  end    for i, v in ipairs(result) do  if (v.isUseful) then  data[#data+1] = v.address  end  end  if (#data > 0) then  gg.toast(Mingcg.."ËÑË÷µ½"..#data.."ÌõÊý¾Ý")  local t = {}  local base = Search[1][2]  if Shuzhiliang == "" and Shuzhiliang > 0 and Shuzhiliang < #data then   Shuzhiliang=Shuzhiliang  else  Shuzhiliang=#data  end  for i=1, Shuzhiliang do  for k, w in ipairs(Write) do  offset = w[2] - base  t[#t+1] = {}  t[#t].address = data[i] + offset  t[#t].flags = w[3]  t[#t].value = w[1]  if (w[4] == true) then  local item = {}  item[#item+1] = t[#t]  item[#item].freeze = true  gg.addListItems(item)  end  end  end  gg.setValues(t)  gg.toast(Mingcg.."already edited"..#t.."¸ö´úÂë")     gg.addListItems(t)  else  gg.toast(Mingcg.."³É¹¦", false)  return false  end  else  gg.toast("ÕÒ·ñ´æÊ§°Ü") return false  end end  

if gg.isPackageInstalled("com.gxlkj.tl") then
    gg.alert("Uninstall Your Decryption GG APK", "🇴 🇰") 
    os.exit()
  end
  if gg.isPackageInstalled("com.wtkc.gg") then
    gg.alert("Uninstall Your Decryption GG APK", "🇴 🇰") 
    os.exit()
  end
  if gg.isPackageInstalled("sstool.only.com.sstool") then
    gg.alert("uninstall your sstool to Run Script")
    os.exit() end
  if gg.isPackageInstalled("com.prabalgaming.logger") then
    gg.alert("uninstall your logger gg to Run Script")
    os.exit()
  end
   if gg.isPackageInstalled("app.greyshirts.sslcapture") then
    gg.alert("uninstall your packet capture app")
    os.exit()
  end
   if gg.isPackageInstalled("com.guoshi.httpcanary") then
    gg.alert("uninstall your Http Canary app")
    os.exit()
  end
   if gg.isPackageInstalled("com.minhui.networkcapture") then
    gg.alert("uninstall your Capture")
    os.exit()
  end
   if gg.isPackageInstalled("com.js.internetguard") then
    gg.alert("uninstall your capture")
    os.exit()
  end
   if gg.isPackageInstalled("com.unitedapps.netguard") then
    gg.alert("uninstall your capture")
    os.exit()
  end
 
gg.setVisible(false)
gg.alert(_ENV["os"]["date"]("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁   \n\n 📆 ᴛᴏᴅᴀʏ - %x 📅 \n ⏰ ɴᴏᴡ ᴛɪᴍᴇ - %H:%M %p  ⏰  \n 11လပိုင်း30ရက်နေ့တွင်းသက်တမ််းကုန်ဆုံးပါမည်"),  "🅽🅴🆇🆃") 

	

Date = "2020113013:31"
date = os.date("%Y%m%d%X")
if date > Date then
gg.alert("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁   \n\n  သက်တန်းကုန်ဆုံးသွားပါပြီ  Adminထံ Date ထပ်တောင်းပါ  TELEGRAM - @DoctorMaster199", "🇴 🇰") 
return
end
gg.setVisible(false)
gg.alert("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁   \n\n ADMIN - SNM  \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁   \n 💻TELEGRAM - @DoctorMaster199   ",  "🅽🅴🆇🆃")
gg.toast("■□□□□□□□□□10%")
gg.sleep("150")
gg.toast("■■□□□□□□□□20%")
gg.sleep("150")
gg.toast("■■■□□□□□□□30%")
gg.sleep("150")
gg.toast("■■■■□□□□□□40%")
gg.sleep("150")
gg.toast("■■■■■□□□□□50%")
gg.sleep("150")
gg.toast("■■■■■■□□□□60%")
gg.sleep("150")
gg.toast("■■■■■■■□□□70%")
gg.sleep("150")
gg.toast("■■■■■■■■□□80%")
gg.sleep("150")
gg.toast("■■■■■■■■■□90%")
gg.sleep("150")
gg.toast("■■■■■■■■■■100%")
gg.sleep("100")
gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁") 
 gg.clearResults()

function HOME()
  SMN = gg.choice({
" 🤹‍🆘 🅱🆈🅿🅰🆂🆂 🆘 🤹‍♀️  ",
" 🤼 ‍🅸🅻🅰🅽🅳 🤼‍♂️",
"🏡 🆆🅰🅻🅻 🅷🅰🅲🅺 🅰🅽🅳 🅲🅾🅻🅾🆁 🏡",
"🏡 🅰🅻🅻 🆆🅰🅻🅻 🅷🅰🅲🅺 🅰🅽🅳 🅲🅾🅻🅾🆁 🆂🅽🅰🅿🅳🆁🅰🅶🅾🅽 🏡",
"🎮 🅶🅰🅼🅴 🅷🅰🅲🅺 🎮",
"📽 🅸🅿🅰🅳 🆅🅸🅴🆆 📽",
" 🆑🅸🅽🆃🅰🅽🅰🆑",
"🆁🅴🅿🅾🆁🆃 🅲🅻🅴🅰🆁",
"⛔ EXIT SCRIPT ⛔ ",
    }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n\n ADMIN - SNM \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n 💻TELEGRAM - @DoctorMaster199 \n " .. Time)
  if SMN == nil then
  else
    if SMN == 1 then
      BYPASS()
    end  
    if SMN == 2 then
      I()
    end
    if SMN == 3 then
      SNMB()
    end
    if SMN == 4 then
     SNMW()
    end
    if SMN == 5 then
      GH()
    end
    if SMN == 6 then
      Cam()
    end
   if SMN == 7 then
      rp()
    end
   if SMN == 8 then
      rrp()
    end
   if SMN == 9 then
      CLOSE()
    end
  end
  PUBGMH = -1
end


function BYPASS()
    SNBY = gg.choice({
      "GLOBAL AND KOREA",
      "KOREA ",
      "[ Exit ]",
    }, nil, "")
    if SNBY == nil then
    else
	if SNBY == 1 then
        BY()
      end
      if SNBY == 2 then
        BYK()
      end 
    if SNBY == 3 then
        HOME()
      end
    end
    PUBGMH = -1
  end



function I()
  SNMO = gg.multiChoice({
"🔫 ʟESS ʀECOɪʟ 🔫〘Iland〙",
"🌆 ʙʟACK SKY〘Iland〙 ",
"🔫 ʜEASʜOT 100% 〘ɢAME〙 ",
"📽SKIN ALL HACK  📽 ",
"⫷ ⫷ ʙᴀᴄᴋ ⫸ ⫸",
}, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
if SNMO == nil then
  else
    if SNMO [1] == true then
      LR()
    end
        if SNMO [2] == true then
      AHS()
    end
    if SNMO [3] == true then
      AHSS()
    end
   if SNMO [4] == true then
      skii()
    end
     if SNMO[5] == true then
    HOME()
  end
  end
  PUBGMH = -1
end


function fly()
gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1099511900928", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
  FLYSITOFF = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("-5.029132178451386e+26", gg.TYPE_DOUBLE)
  gg.toast("❤️ғʟʏɪɴɢ sɪᴛ")
end
 
function sk()
    SNN = gg.multiChoice({
      "SKIN 1",
      "SKIN 2",
      "[ Exit ]"
    }, nil, "")
    if SNN == nil then
    else
	if SNN == 1 then
        ski()
      end
      if SNN == 2 then
        skii()
      end 
    
    if SNN == 3 then
        sk()
      end
    end
    PUBGMH = -1
  end
  
  function skii()
    SN = gg.choice({
      "[ OUTFITS ]",
      "[ BACKPACKS ]",
      "[ HELMETS]",
      "ff",
      "[ Exit ]"
    }, nil, "" )
    if SN == nil then
    else
	if SN == 1 then
        OUT()
      end
      if SN == 2 then
        BAG()
      end
      if SN == 3 then
        HEL()
      end
  if SN == 4 then
        ski()
      end
    if SN == 5 then
        HOME()
      end
    end
    PUBGMH = -1
  end
  function OUT()
    OUT = gg.multiChoice({
	"winter queen new",
	"yellow mummy",
	"wishing treeman",
	"classic santa",
    "BACK"
}, nil,"" )
if OUT == nil then
  else
    if OUT [1] == true then
      OUT1()
    end
    if OUT [2] == true then
     OUT2()
    end
    if OUT [3] == true then
     OUT3()
    end
    if OUT [4] == true then
     OUT4()
    end
if OUT [5] == true then
      HOME()
    end
  end
  PUBGMH = -1
end



function OUT1()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Mummy set"},
{["value"] = 1400129, ["type"] = 4},
{["lv"] = 519, ["offset"] = 4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1405706, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function OUT2()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Mummy set"},
{["value"] = 1400129, ["type"] = 4},
{["lv"] = 519, ["offset"] = 4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1405623, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function OUT3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Mummy set"},
{["value"] = 1400129, ["type"] = 4},
{["lv"] = 519, ["offset"] = 4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1405708, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function OUT4()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Mummy set"},
{["value"] = 1400129, ["type"] = 4},
{["lv"] = 519, ["offset"] = 4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1405004, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function BAG()
    BAG = gg.multiChoice({
	"winter queen bag new",
	"Brilliant anniversary",
	"kiss emoji",
	"Christmas Bag",
    "BACK"
}, nil, "BAG MENU BY HAMZA")
if BAG == nil then
  else
    if BAG [1] == true then
      BAG1()
    end
    if BAG [2] == true then
     BAG2()
    end
    if BAG [3] == true then
     BAG3()
    end
    if BAG [4] == true then
     BAG4()
    end
if BAG [5] == true then
      HOME()
    end
  end
  PUBGMH = -1
end
function BAG1()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501001, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501001216, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501002, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002216, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501003, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003216, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501004, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002216, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501005, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003216, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501006, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003216, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function BAG2()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501001, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501001045, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501002, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002045, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501003, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003045, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501004, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002045, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501005, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003045, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501006, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003045, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function BAG3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501001, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501001229, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501002, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002229, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501003, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003229, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501004, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002229, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501005, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003229, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501006, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003229, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function BAG4()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501001, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501001217, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501002, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002217, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501003, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003217, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501004, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501002217, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501005, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003217, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Backpack"},
{["value"] = 501006, ["type"] = 4},
{["lv"] = 501, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1501003217, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
end 
function HEL()
    HEL = gg.multiChoice({
	"cast iron new",
	"Stylish Santa",
	"anubian helmet",
	"Glacier Helmet",
    "BACK"
}, nil, "HELMET MENU BY HAMZA")
if HEL == nil then
  else
    if HEL [1] == true then
      HEL1()
    end
    if HEL [2] == true then
     HEL2()
    end
    if HEL [3] == true then
     HEL3()
    end
    if HEL [4] == true then
     HEL4()
    end
if HEL [5] == true then
      HOME()
    end
  end
  PUBGMH = -1
end
function HEL1()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502001, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502001050, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502004, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002050, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502002, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002050, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502005, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002050, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502003, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502003050, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
end 
function HEL2()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502001, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502001030, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502004, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002030, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502002, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002030, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502005, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002030, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502003, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502003030, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
end 
function HEL3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502001, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502001093, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502004, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002093, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502002, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002093, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502005, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002093, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502003, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502003093, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
end 
function HEL4()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502001, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502001023, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502004, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002023, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502002, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002023, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502005, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002023, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
qmnb = {
{["memory"] = 32},
{["name"] = "Brilliant Anniversary Helmet"},
{["value"] = 502003, ["type"] = 4},
{["lv"] = 502, ["offset"] = -4, ["type"] = 4},
}
gg.setVisible(false)
qmxg = {
{["value"] = 1502002023, ["offset"] = 0, ["type"] = 4},
}
gg.setVisible(false)
xqmnb(qmnb)
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
end


function ski()
GAMAT = gg.multiChoice({
    "╔✧[lobi] 『✔』\n╚✧M416 buz diyarı",
    "╔✧[lobi] 『🌡』\n╚✧M416 Maskara",
    "╔✧[lobi] 『🦎』\n╚✧M416 Kertenkele",
    "╔✧[lobi] 『🚵‍♀️』\n╚✧Akm buz diyarı",
    "╔✧[lobi] 『🎡』\n╚✧Scral-L Skin",
    "╔✧[lobi] 『🎮』\n╚✧Kar 98 skin",
    "╔✧[lobi] 『📞』\n╚✧Awm Mor İntikam",
    "╔✧[lobi] 『☃️』\n╚✧Uzi skin",
    "╔✧[lobi] 『⛱』\n╚✧Buz tava deseni  ",
    "╔✧[lobi] 『🎽』\n╚✧Firavun deseni",
    "╔✧[lobi] 『🏛』\n╚✧NOEL M762",
    "╔✧[lobi] 『🌶』\n╚✧Kanlı leydi Giysisi",
    "╔✧[lobi] 『🍺』\n╚✧Dikenli iblis Seti",
    "╔✧[lobi] 『🍟』\n╚✧Mezarlık lord Seti",
    "╔✧[lobi] 『🚧』\n╚✧Maskara Seti",
    "╔✧[lobi] 『🏠』\n╚✧Unicorn Seti",
    "╔✧\n╚☩🅱🅰🅲🅺" 
  }, nil, "━━━━━━━━━━━━━━━━━━━━━\n┏  @Arap siker\n━━━━━━━━━━━━━━━━━━━━━")
  if GAMAT == nil then
  else
    if GAMAT[1] == true then
     Buz()
     end
     if GAMAT[2] == true then
     mask()
     end
     if GAMAT[3] == true then
     ker()
     end
  if GAMAT[4] == true then
    Rp()
    end
    if GAMAT[5] == true then
    cs()
    end
    if GAMAT[6] ==  true then
    godd()
    end
    if GAMAT[7] ==  true then
    Awm()
    end
    if GAMAT[8] ==  true then
    goddd()
    end
    if GAMAT[9] ==  true then
    godddd()
    end
    if GAMAT[10] ==  true then
    dd()
    end
    if GAMAT[11] ==  true then
    buz()
    end
    if GAMAT[12] ==  true then
    Leydi()
    end
    if GAMAT[13] ==  true then
    Rkk()
    end
    if GAMAT[14] ==  true then
    Rkkk()
    end
    if GAMAT[15] ==  true then
    Rkkkk()
    end
    if GAMAT[16] ==  true then
    Rkkkkk()
    end
  if GAMAT[17] == true then
      HOME()
    end
 end
 end

function Buz()
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1101004046", gg.TYPE_DWORD)
end
function mask()
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1101004062", gg.TYPE_DWORD)
gg.toast("Aktif")
end

function ker()
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1101004086", gg.TYPE_DWORD)
gg.toast("M416 kertenkele ")
end

function Rp()
gg.searchNumber("10100100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10100100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1101001089", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Akm Skin ️")
end

function cs()
gg.searchNumber("10100300", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10100300", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1101003057", gg.TYPE_DWORD)
gg.toast("Scral-L Skin ️")
end

function godd()
gg.searchNumber(" 10300100 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber(" 10300100 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll(" 1103001060 ", gg.TYPE_DWORD)
gg.toast("kr98 Skin ️")
end

function Awm()
gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("91000;2.29999995232;1.8", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber("2.29999995232;1.8", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(15)
    gg.editAll("0", gg.TYPE_FLOAT)
gg.toast("Awm Mor İntikam Akif")
end


function goddd()
gg.searchNumber("10200100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10200100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1102001004", gg.TYPE_DWORD)
gg.toast("Uzi Skin ️")
end

function godddd()
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10100400 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1101004062", gg.TYPE_DWORD)
end

function dd()
  function split(szFullString, szSeparator)
local nFindStartIndex = 1 
local nSplitIndex = 1 
local nSplitArray = {} while true do 
local 
nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) 
if not nFindLastIndex then 
nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) 
break end 
nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) 
nFindStartIndex = nFindLastIndex + string.len(szSeparator) 
nSplitIndex = nSplitIndex + 1 end return 
nSplitArray end function 
xgxc(szpy, MS) for x = 1, #(MS) do 
xgpy = szpy + MS[x]["offset"] xglx = MS[x]["type"] 
xgsz = MS[x]["value"] 
gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) 
xgsl = xgsl + 1 end end function 
MoShinp(MoShi) 
gg.clearResults() 
gg.setRanges(MoShi[1]["memory"]) 
gg.searchNumber(MoShi[3]["value"], MoShi[3]["type"]) 
if gg.getResultCount() == 0 then 
gg.toast(MoShi[2]["name"] .. "")
else 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
if gg.getResultCount() == 0 then 
gg.toast(MoShi[2]["name"] .. "") 
else 
sl = gg.getResults(999999) 
sz = gg.getResultCount() 
xgsl = 0 if sz > 999999 then 
sz = 999999 end for i = 1, sz do 
pdsz = true for v = 4, #(MoShi) do if 
pdsz == true then 
pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + MoShi[v]["offset"] 
pysz[1].flags = MoShi[v]["type"] 
szpy = gg.getValues(pysz) 
pdpd = MoShi[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") 
tzszpd = szpd[1] 
pyszpd = szpd[2] 
if tzszpd == pyszpd then 
pdjg = true pdsz = true else 
pdjg = false pdsz = false end end end 
if pdjg == true then 
szpy = sl[i].address xgxc(szpy, MS) 
xgjg = true end end 
if xgjg == true then 
gg.toast(MoShi[2]["name"] .. "" .. xgsl .. "") 
else 
gg.toast(MoShi[2]["name"] .. "") 
end 
end 
end 
end

function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    local data = {} 
    local base = Search[1][2] 
    
   if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true 
        end
        
        for k=2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base 
            local num = Search[k][1] 
            
            for i, v in ipairs(result) do
                tmp[#tmp+1] = {} 
                tmp[#tmp].address = v.address + offset  
                tmp[#tmp].flags = v.flags  
            end
            
            tmp = gg.getValues(tmp) 
            
            for i, v in ipairs(tmp) do
                if ( tostring(v.value) ~= tostring(num) ) then 
                    result[i].isUseful = false 
                end
            end
        end
  
        for i, v in ipairs(result) do
            if (v.isUseful) then 
                data[#data+1] = v.address
            end
        end
     
        if (#data > 0) then
           gg.toast(""..#data.."")
           local t = {}
           local base = Search[1][2]
           for i=1, #data do
               for k, w in ipairs(Write) do
                   offset = w[2] - base
                   t[#t+1] = {}
                   t[#t].address = data[i] + offset
                   t[#t].flags = Type
                   t[#t].value = w[1]
                  
                   if (w[3] == true) then
                       local item = {}
                       item[#item+1] = t[#t]
                       item[#item].freeze = true
                       gg.addListItems(item)
                   end
                 
               end
           end
           gg.setValues(t)
       
        else
            gg.toast("", false)
            return false
        end
    else
        gg.toast("")
        return false
    end
end


local app = {}
function Assert(data)
if data == nil or data == "" or data == "nil" then
return false
else
return true
end
end
function mearrass(memory, array)
if Assert(memory) and Assert(array) then
return true
else
return false
end
end
function typetab(array, type)
local datatype = {}
for i = 1, #array do
if Assert(array[i].type) then
table.insert(datatype, i, array[i].type)
else
if Assert(type) then
table.insert(datatype, i, type)
else
return false
end
end
end
return true, datatype
end
function app.memorysearch(memory, array, type)
gg.setVisible(false)
local rx = mearrass(memory, array)
if rx then
local rx, datatype = typetab(array, type)
if rx then
if Assert(array[1].hv) then
gg.clearResults()
gg.setRanges(memory)
gg.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1])
else
gg.clearResults()
gg.setRanges(memory)
gg.searchNumber(array[1].lv, datatype[1])
end
if gg.getResultCount() == 0 then
return false
else
local tab = {}
local data = gg.getResults(gg.getResultCount())
gg.clearResults()
for i = 1, #data do
data[i].rx = true
end
for i = 2, #array do
local t = {}
local offset = array[i].offset
for x = 1, #data do
t[#t + 1] = {}
t[#t].address = data[x].address + offset
t[#t].flags = datatype[i]
end
local t = gg.getValues(t)
for z = 1, #t do
if Assert(array[i].hv) then
if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then
data[z].rx = false
end
else
if tostring(t[z].value) ~= tostring(array[i].lv) then
data[z].rx = false
end
end
end
end
for i = 1, #data do
if data[i].rx then
tab[#tab + 1] = data[i].address
end
end
if #tab > 0 then
return true, tab
else
return false
end
end
else
print("wrong type parameter")
gg.toast("wrong type parameter")
os.exit()
end
else
print("memory or array parameter error")
gg.toast("memory or array parameter error")
os.exit()
end
end
function app.memoryread(addr, type)
local t = {}
t[1] = {}
t[1].address = addr
t[1].flags = type
if #t > 0 then
return true, gg.getValues(t)[1].value
else
return false
end
end
function app.memorywrite(addr, type, value, freeze)
local t = {}
t[1] = {}
t[1].address = addr
t[1].flags = type
t[1].value = value
if #t > 0 then
if Assert(freeze) then
t[1].freeze = freeze
--gg.setValues(t)
return gg.addListItems(t)
else
return gg.setValues(t)
end
else
return false
end
end


function edit(orig,ret)_om=orig[1].memory or orig[1][1]_ov=orig[3].value or orig[3][1]_on=orig[2].name or orig[2][1]gg.clearResults()gg.setRanges(_om)gg.searchNumber(_ov,orig[3].type or orig[3][2])sz=gg.getResultCount()if sz<1 then gg.toast(_on.."开启失败")else sl=gg.getResults(720)for i=1,sz do ist=true for v=4,#orig do if ist==true and sl[i].value==_ov then cd={{}}cd[1].address=sl[i].address+(orig[v].offset or orig[v][2])cd[1].flags=orig[v].type or orig[v][3]szpy=gg.getValues(cd)cdlv=orig[v].lv or orig[v][1]cdv=szpy[1].value if cdlv==cdv then pdjg=true ist=true else pdjg=false ist=false end end end if pdjg==true then szpy=sl[i].address for x=1,#(ret)do xgpy=szpy+(ret[x].offset or ret[x][2])xglx=ret[x].type or ret[x][3]xgsz=ret[x].value or ret[x][1]xgdj=ret[x].freeze or ret[x][4]xgsj={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xgsj[1].freeze=xgdj gg.addListItems(xgsj)else gg.setValues(xgsj)end end xgjg=true end end if xgjg==true then gg.toast(_on.."Open successfully")else gg.toast(_on.."Open failed")end end end
function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("搜索到"..#data.."条数据") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("already edited"..#t.."Article data") gg.addListItems(t) else gg.toast("not found", false) return false end else gg.toast("Not Found") return false end end
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Open failed") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Open failed") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "Opensuccess,Totalmodify" .. xgsl .. "Article data") else gg.toast(qmnb[2]["name"] .. "Open failed") end end end end
function Fxs(Search, Write,Neicun,Mingcg,Shuzhiliang)  gg.clearResults()  gg.setRanges(Neicun)  gg.setVisible(false)  gg.searchNumber(Search[1][1], Search[1][3])  local count = gg.getResultCount()  local result = gg.getResults(count)  gg.clearResults()  local data = {}   local base = Search[1][2]    if (count > 0) then  for i, v in ipairs(result) do  v.isUseful = true  end  for k=2, #Search do  local tmp = {}  local offset = Search[k][2] - base   local num = Search[k][1]    for i, v in ipairs(result) do  tmp[#tmp+1] = {}  tmp[#tmp].address = v.address + offset  tmp[#tmp].flags = Search[k][3]  end    tmp = gg.getValues(tmp)    for i, v in ipairs(tmp) do  if ( tostring(v.value) ~= tostring(num) ) then  result[i].isUseful = false  end  end  end    for i, v in ipairs(result) do  if (v.isUseful) then  data[#data+1] = v.address  end  end  if (#data > 0) then  gg.toast(Mingcg.."搜索到"..#data.."条数据")  local t = {}  local base = Search[1][2]  if Shuzhiliang == "" and Shuzhiliang > 0 and Shuzhiliang < #data then   Shuzhiliang=Shuzhiliang  else  Shuzhiliang=#data  end  for i=1, Shuzhiliang do  for k, w in ipairs(Write) do  offset = w[2] - base  t[#t+1] = {}  t[#t].address = data[i] + offset  t[#t].flags = w[3]  t[#t].value = w[1]  if (w[4] == true) then  local item = {}  item[#item+1] = t[#t]  item[#item].freeze = true  gg.addListItems(item)  end  end  end  gg.setValues(t)  gg.toast(Mingcg.."already edited"..#t.."Article data")     gg.addListItems(t)  else  gg.toast(Mingcg.."Open failed", false)  return false  end  else  gg.toast("Search failed") return false  end end  
qmnb = {
{["memory"] = 32},
{["name"] = "Crd👉@Arapsiker"},
{["value"] = 1400129, ["type"] = 4},
{["lv"] = 519, ["offset"] = 4, ["type"] = 4},
}
qmxg = {
{["value"] = 1405628, ["offset"] = 0, ["type"] = 4},

}
xqmnb(qmnb)
gg.searchNumber("10300300", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("10300300", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("1103003022", gg.TYPE_DWORD)
  gg.alert("Antik Zırh-X Aktif Edildi Lütfen Elbisenizi Çıkarınız😁 ")
  end


function buz()
gg.searchNumber("10100800", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("10100800", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1101008010", gg.TYPE_DWORD)
  gg.toast("SKİN AÇILDI") 
end

function Leydi()
gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1405655", gg.TYPE_DWORD)
  gg.clearResults()
  gg.alert("Kanlı leydi Giysisi Aktif Edildi Lütfen Elbisenizi Çıkarınız😁 ")
  
  end

function Rkk()
gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1405657", gg.TYPE_DWORD)
  gg.clearResults()
  gg.alert("Dikenli iblis Seti Aktif Edildi Lütfen Elbisenizi Çıkarınız😁 ")
  end

function Rkkk()
gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1405658", gg.TYPE_DWORD)
  gg.clearResults()
  gg.alert("Mezarlık lord Seti Aktif Edildi Lütfen Elbisenizi Çıkarınız😁 ")
  end
  
function Rkkkk()
gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1405092", gg.TYPE_DWORD)
  end
 
 function Rkkkkk()
 gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1400129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1405482", gg.TYPE_DWORD)
  end

function rrp()
gg.clearResults()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("909391408;808923191::8", gg.TYPE_DWORD)
gg.getResults(999)
gg.editAll("1089886885", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("909391408", gg.TYPE_DWORD)
gg.getResults(999)
gg.editAll("1089886885", gg.TYPE_DWORD)
os.remove("/data/data/com.pubg.krmobile/app_appcache")
os.remove("/data/data/com.pubg.krmobile/app_bugly")
os.remove("/data/data/com.pubg.krmobile/app_crashrecord")
os.remove("/data/data/com.pubg.krmobile/app_databases")
os.remove("/data/data/com.pubg.krmobile/app_geolocation")
os.remove("/data/data/com.pubg.krmobile/app_tbs")
os.remove("/data/data/com.pubg.krmobile/app_textures")
os.remove("/data/data/com.pubg.krmobile/app_webview")
os.remove("/data/data/com.pubg.krmobile/app_webview_imsdk_inner_webview")
os.remove("/data/data/com.pubg.krmobile/cache")
os.remove("/data/data/com.pubg.krmobile/code_cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/Tencent")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.pubg.krmobile/app_appcache")
  os.remove("/data/data/com.pubg.krmobile/app_bugly")
  os.remove("/data/data/com.pubg.krmobile/app_crashrecord")
  os.remove("/data/data/com.pubg.krmobile/app_databases")
  os.remove("/data/data/com.pubg.krmobile/app_geolocation")
  os.remove("/data/data/com.pubg.krmobile/app_tbs")
  os.remove("/data/data/com.pubg.krmobile/app_textures")
  os.remove("/data/data/com.pubg.krmobile/app_webview")
  os.remove("/data/data/com.pubg.krmobile/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.pubg.krmobile/cache")
  os.remove("/data/data/com.pubg.krmobile/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.vng.pubgmobile/app_appcache")
  os.remove("/data/data/com.vng.pubgmobile/app_bugly")
  os.remove("/data/data/com.vng.pubgmobile/app_crashrecord")
  os.remove("/data/data/com.vng.pubgmobile/app_databases")
  os.remove("/data/data/com.vng.pubgmobile/app_geolocation")
  os.remove("/data/data/com.vng.pubgmobile/app_tbs")
  os.remove("/data/data/com.vng.pubgmobile/app_textures")
  os.remove("/data/data/com.vng.pubgmobile/app_webview")
  os.remove("/data/data/com.vng.pubgmobile/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.vng.pubgmobile/cache")
  os.remove("/data/data/com.vng.pubgmobile/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.vng.pubgmobile/app_appcache")
  os.remove("/data/data/com.vng.pubgmobile/app_bugly")
  os.remove("/data/data/com.vng.pubgmobile/app_crashrecord")
  os.remove("/data/data/com.vng.pubgmobile/app_databases")
  os.remove("/data/data/com.vng.pubgmobile/app_geolocation")
  os.remove("/data/data/com.vng.pubgmobile/app_tbs")
  os.remove("/data/data/com.vng.pubgmobile/app_textures")
  os.remove("/data/data/com.vng.pubgmobile/app_webview")
  os.remove("/data/data/com.vng.pubgmobile/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.vng.pubgmobile/cache")
  os.remove("/data/data/com.vng.pubgmobile/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.tencent.ig/app_appcache")
  os.remove("/data/data/com.tencent.ig/app_bugly")
  os.remove("/data/data/com.tencent.ig/app_crashrecord")
  os.remove("/data/data/com.tencent.ig/app_databases")
  os.remove("/data/data/com.tencent.ig/app_geolocation")
  os.remove("/data/data/com.tencent.ig/app_tbs")
  os.remove("/data/data/com.tencent.ig/app_textures")
  os.remove("/data/data/com.tencent.ig/app_webview")
  os.remove("/data/data/com.tencent.ig/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.tencent.ig/cache")
  os.remove("/data/data/com.tencent.ig/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.tencent.ig/app_appcache")
  os.remove("/data/data/com.tencent.ig/app_bugly")
  os.remove("/data/data/com.tencent.ig/app_crashrecord")
  os.remove("/data/data/com.tencent.ig/app_databases")
  os.remove("/data/data/com.tencent.ig/app_geolocation")
  os.remove("/data/data/com.tencent.ig/app_tbs")
  os.remove("/data/data/com.tencent.ig/app_textures")
  os.remove("/data/data/com.tencent.ig/app_webview")
  os.remove("/data/data/com.tencent.ig/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.tencent.ig/cache")
  os.remove("/data/data/com.tencent.ig/code_cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/Tencent")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/.backups")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.tencent.ig/app_appcache")
os.remove("/data/data/com.tencent.ig/app_bugly")
os.remove("/data/data/com.tencent.ig/app_crashrecord")
os.remove("/data/data/com.tencent.ig/cache")
os.remove("/data/data/com.tencent.ig/code_cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.pubg.krmobile/app_appcache")
os.remove("/data/data/com.pubg.krmobile/app_bugly")
os.remove("/data/data/com.pubg.krmobile/app_crashrecord")
os.remove("/data/data/com.pubg.krmobile/cache")
os.remove("/data/data/com.pubg.krmobile/code_cache")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.vng.pubgmobile/app_appcache")
os.remove("/data/data/com.vng.pubgmobile/app_bugly")
os.remove("/data/data/com.vng.pubgmobile/app_crashrecord")
os.remove("/data/data/com.vng.pubgmobile/cache")
os.remove("/data/data/com.vng.pubgmobile/code_cache")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/cache")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.rekoo.pubgm/app_appcache")
os.remove("/data/data/com.rekoo.pubgm/app_bugly")
os.remove("/data/data/com.rekoo.pubgm/app_crashrecord")
os.remove("/data/data/com.rekoo.pubgm/cache")
os.remove("/data/data/com.rekoo.pubgm/code_cache")
gg.toast("REPORTLAR ")

end

function SNMB()

SNMQ = gg.multiChoice({

"🏘️ WAʟʟʜACK Aʟʟ SɴAP DʀAɢOɴ 🏘️ ",

"🏘️ WAʟʟʜACK FɪX ʙʟɪɴK  🏘️ ",

"🏘️ WAʟʟʜACK FɪX SCOPE🏘️ ",

"🏘️ WAʟʟʜACK SD 675 🏘️",

"🏘️ WAʟʟʜACK SD 710🏘️",

"🏘️ WAʟʟʜACK SD 439 🏘️",

"🏡 COʟOʀ YEʟʟOW Aʟʟ SD 1  🏡 ",
"🏡 COʟOʀ 675 RED 🏡 ",
"📽ɪPAD VɪEW  📽 ",
"⫷ ⫷ ʙᴀᴄᴋ ⫸ ⫸",
}, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n\n ADMIN - SNM \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n 💻TELEGRAM - @DoctorMaster199 \n " .. Time)
if SNMQ == nil then
  else
if SNMQ[1] == true then
      WHASD()
    end
if SNMQ[2] == true then
      WHFB()
    end
if SNMQ[3] == true then
      WHFS()
    end
    if SNMQ[4] == true then
      WH675()
    end
if SNMQ[5] == true then
      WH710()
    end
if SNMQ[6] == true then
      WH7()
    end
if SNMQ[7] == true then
      CYASDVO()
    end
    if SNMQ[8] == true then
      C675()
   end
 if SNMQ[9] == true then
      Cam()
   end
if SNMQ[10] == true then
    HOME()
  end
  end
  PUBGMH = -1
end
    
    
function GH()
SNMN = gg.multiChoice({
"✨🎩✨ MAɢɪC ʙUʟʟET 〘ɢAME〙",
" 🔘 AɪM ʙOT 🔘〘ɢAME〙",
"🚙 UAᴢ CAʀ FʟY〘ɢAME〙",
" ☢ Small Crosshair ☢ ",
" 🚴‍♀️ Micro Speed 🚴‍♀️ ",
"⫷ ⫷ ʙᴀᴄᴋ ⫸ ⫸",
}, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n\n ADMIN - SNM \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n 💻TELEGRAM - @DoctorMaster199 \n " .. Time)
 if SNMN == nil then
  else
 if SNMN[1] == true then
      MB()
    end
 if SNMN[2] == true then
      AHSS()
    end
   if SNMN[3] == true then
      CAR()
    end
    if SNMN[4] == true then
      Ca()
    end
    if SNMN[5] == true then
      MICR()
    end
   if SNMN[6] == true then
      HOME()
    end
  end
  PUBGMH = -1
end

function FFF()
SNMNB = gg.choice({
"✨🎩✨ WALL ON〘ɢAME〙",
"✨🎩✨ WALL OFF〘ɢAME〙",
"⫷ ⫷ ʙᴀᴄᴋ ⫸ ⫸",
}, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n\n ADMIN - SNM \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n 💻TELEGRAM - @DoctorMaster199 \n " .. Time)
 if SNMNB == nil then
  else
 if SNMNB[1] == true then
    WA1()
  end
 if SNMNB[2] == true then
   WA2()
   end
   if SNMNB[3] == true then
   HOME()
   end
  end
  PUBGMH = -1
end

function HJP()
gg.clearResults()
 gg.setVisible(false)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("90.775703430176;0;8;15;16;18;28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1000", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("90.775703430176;8;27.25;18;16", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("18", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("140", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_BSS)
  gg.searchNumber("1.0e-7;1.0e-7;2;2;1::512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("0", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("𝘋𝘰𝘯𝘦✓")
end
function WA2()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_BSS)
  gg.searchNumber("3.4e38", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("9.9999997e-10", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ᴡᴀʟʟʜᴀᴄᴋ ᴏғ")
end


function rp()
gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("88.50576019287F;87.27782440186F;-100.91194152832F;1F::13", 16, false, 536870912, 0, -1)
  gg.searchNumber("88.50576019287F;87.27782440186F;1F", 16, false, 536870912, 0, -1)
  gg.getResults(100)
  gg.editAll("1.96875;1.96875;999;1.96875;1.96875;999", 16)
  gg.clearResults()
  gg.toast("✨Antenna Activated✨")
end

function BY()
gg.toast("🇸 ")
gg.sleep("100")
gg.toast(" 🇸 🇹")
gg.sleep("100")
gg.toast(" 🇸 🇹 🇦")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 -")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬")
gg.sleep("100")
gg.toast(" 🇸 🇹 🇦 🇷 🇹 - 🇬 🇱")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧")
gg.sleep("100")
gg.toast(" 🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦  ")
gg.sleep("100")
gg.toast(" 🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱 - ")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱 - 🇧")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱 - 🇧 🇾")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱 - 🇧 🇾 🇵")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱 - 🇧 🇾 🇵 🇦")
gg.sleep("100")
gg.toast(" 🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱 - 🇧 🇾 🇵 🇦 🇸")
gg.sleep("100")
gg.toast("🇸 🇹 🇦 🇷 🇹 - 🇬 🇱 🇴 🇧 🇦 🇱 - 🇧 🇾 🇵 🇦 🇸 🇸 ")
gg.sleep("100")
gg.clearResults()
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/cache')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.ini')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/ca-bundle.pem')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/ProgramBinaryCache')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/1375135419_47_0.13.0.11098_20190617165748_1981158817_cures.ifs.res')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir')
os.remove('/data/data/com.tencent.ig/app_appcache')
os.remove('/data/data/com.tencent.ig/app_bugly')
os.remove('/data/data/com.tencent.ig/app_crashrecord')
os.remove('/data/data/com.tencent.ig/cache')
os.remove('/data/data/com.tencent.ig/code_cache')
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("70658~590336;67109377;67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("70658~590336", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end-----SAVAGE-----
  end--SAVAGE--
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
  os.remove("/data/data/com.tencent.ig/app_crashrecord/1004")
  os.remove("/data/data/com.tencent.ig/files/__tsecache.dat")
  os.remove("/data/data/com.tencent.ig/files/AdjustAttribution")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoActivityState")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoPackageQueue")
  os.remove("/data/data/com.tencent.ig/files/apm_cc")
  os.remove("/data/data/com.tencent.ig/files/AppEventsLogger.persistedevents")
  os.remove("/data/data/com.tencent.ig/files/cache.crc.dat")
  os.remove("/data/data/com.tencent.ig/files/gcTestConfig.txt")
  os.remove("/data/data/com.tencent.ig/files/hawk_data_init")
  os.remove("/data/data/com.tencent.ig/files/local_crash_lock")
  os.remove("/data/data/com.tencent.ig/files/tersafe.update")
  os.remove("/data/data/com.tencent.ig/files/mycpuinfo")
  os.remove("/data/data/com.tencent.ig/files/tpnlcache.data")
  os.remove("/data/data/com.tencent.ig/files/tss_app_915c.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_cs_stat2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_uts_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss.i.m.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config2.xml.6dab626b")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config3.xml")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/mn_cache.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss_emu_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss.ano2.dat")
  os.remove("/storage/emulated/0/tencent/Midas/Log/com.pubg.krmobile/MidasLog.mmap")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache/GCloud.config")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/vmpcloudconfig.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/Epic Games/KeyValueStore.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate/SaveGames/JKGuestRegisterCnt.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppBaseConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AudioPluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/BuildConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/CustomDeviceList.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceProfiles.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceSwitchers.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/EditorPerProjectUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Engine.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Game.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/GameUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Hardware.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IMSDKConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Input.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/LogSuppression.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/MidasConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OBHttp.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OpenIDCommand.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/PufferDownloader.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Scalability.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/ServerSwitch.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UAE.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Updater.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserCustom.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora/dns.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/CommonSaveGame_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/LeagueStatue.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/loginInfoFile.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/MailPhoneLogin.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/playerprefs.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/business_res_download_priority_table_new")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/cadge_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/dubber_table_ext")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/easy_buy_cfg")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_award_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_task_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/new_level_task_cover_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/social_authorize_config")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/upgrade_parameter")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_loglist.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_uuid_define.json")
  os.remove("/data/data/com.tencent.ig/app_crashrecord/1004")
  os.remove("/data/data/com.tencent.ig/files/__tsecache.dat")
  os.remove("/data/data/com.tencent.ig/files/AdjustAttribution")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoActivityState")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoPackageQueue")
  os.remove("/data/data/com.tencent.ig/files/apm_cc")
  os.remove("/data/data/com.tencent.ig/files/AppEventsLogger.persistedevents")
  os.remove("/data/data/com.tencent.ig/files/cache.crc.dat")
  os.remove("/data/data/com.tencent.ig/files/gcTestConfig.txt")
  os.remove("/data/data/com.tencent.ig/files/hawk_data_init")
  os.remove("/data/data/com.tencent.ig/files/local_crash_lock")
  os.remove("/data/data/com.tencent.ig/files/tersafe.update")
  os.remove("/data/data/com.tencent.ig/files/mycpuinfo")
  os.remove("/data/data/com.tencent.ig/files/tpnlcache.data")
  os.remove("/data/data/com.tencent.ig/files/tss_app_915c.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_cs_stat2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_uts_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss.i.m.dat")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config2.xml.6dab626b")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config3.xml")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/mn_cache.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss_emu_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss.ano2.dat")
  os.remove("/storage/emulated/0/tencent/Midas/Log/com.tencent.ig/MidasLog.mmap")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.config")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/Epic Games/KeyValueStore.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate/SaveGames/JKGuestRegisterCnt.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppBaseConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AudioPluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/BuildConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/CustomDeviceList.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceProfiles.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceSwitchers.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/EditorPerProjectUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Engine.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Game.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/GameUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Hardware.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IMSDKConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Input.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/LogSuppression.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/MidasConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OBHttp.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OpenIDCommand.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/PufferDownloader.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Scalability.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/ServerSwitch.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UAE.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Updater.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserCustom.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora/dns.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/CommonSaveGame_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/LeagueStatue.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/loginInfoFile.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/MailPhoneLogin.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/playerprefs.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/business_res_download_priority_table_new")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/cadge_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/dubber_table_ext")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/easy_buy_cfg")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_award_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_task_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/new_level_task_cover_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/social_authorize_config")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/upgrade_parameter")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_loglist.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_uuid_define.json")
  os.remove("/data/data/com.tencent.ig/app_crashrecord/1004")
  os.remove("/data/data/com.tencent.ig/files/__tsecache.dat")
  os.remove("/data/data/com.tencent.ig/files/AdjustAttribution")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoActivityState")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoPackageQueue")
  os.remove("/data/data/com.tencent.ig/files/apm_cc")
  os.remove("/data/data/com.tencent.ig/files/AppEventsLogger.persistedevents")
  os.remove("/data/data/com.tencent.ig/files/cache.crc.dat")
  os.remove("/data/data/com.tencent.ig/files/gcTestConfig.txt")
  os.remove("/data/data/com.tencent.ig/files/hawk_data_init")
  os.remove("/data/data/com.tencent.ig/files/local_crash_lock")
  os.remove("/data/data/com.tencent.ig/files/tersafe.update")
  os.remove("/data/data/com.tencent.ig/files/mycpuinfo")
  os.remove("/data/data/com.tencent.ig/files/tpnlcache.data")
  os.remove("/data/data/com.tencent.ig/files/tss_app_915c.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_cs_stat2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_uts_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss.i.m.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config2.xml.6dab626b")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config3.xml")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/mn_cache.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss_emu_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss.ano2.dat")
  os.remove("/storage/emulated/0/tencent/Midas/Log/com.rekoo.pubgm/MidasLog.mmap")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/cacheFile.txt")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/cache/GCloud.config")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/vmpcloudconfig.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/Epic Games/KeyValueStore.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate/SaveGames/JKGuestRegisterCnt.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppBaseConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AudioPluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/BuildConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/CustomDeviceList.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceProfiles.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceSwitchers.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/EditorPerProjectUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Engine.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Game.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/GameUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Hardware.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IMSDKConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Input.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/LogSuppression.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/MidasConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OBHttp.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OpenIDCommand.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/PufferDownloader.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Scalability.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/ServerSwitch.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UAE.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Updater.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserCustom.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora/dns.txt")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/CommonSaveGame_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/LeagueStatue.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/loginInfoFile.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/MailPhoneLogin.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/playerprefs.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/business_res_download_priority_table_new")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/cadge_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/dubber_table_ext")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/easy_buy_cfg")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_award_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_task_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/new_level_task_cover_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/social_authorize_config")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/upgrade_parameter")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_loglist.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_uuid_define.json")
gg.toast("■■■■■■■■■■100%")
gg.alert("🛡️ Global Bypass Successfully🛡️", "🇴 🇰") 
end

function BYK()
gg.toast("༆𝐑𝐄𝐃𝐆𝐀𝐌𝐈𝐍𝐆𝐈𝐃🇲🇨")
gg.clearResults()
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/1375135419_47_0.13.0.11098_20190617165748_1981158817_cures.ifs.res")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.tencent.ig/app_appcache")
os.remove("/data/data/com.tencent.ig/app_bugly")
os.remove("/data/data/com.tencent.ig/app_crashrecord")
os.remove("/data/data/com.tencent.ig/cache")
os.remove("/data/data/com.tencent.ig/code_cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
gg.clearResults()
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("196,864;16,842,753::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1) 
if gg.getResultCount() == 0 then
else
gg.searchNumber("196,864", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
n = gg.getResultCount()
jz = gg.getResults(n)
for i = 1, n do
gg.addListItems({[1] = {address = jz[i].address + 236,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 232,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 228,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 340,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 344,flags = 4,freeze = true,value = 67109633}})
end
end
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("133634;134914", gg.TYPE_DWORD)
gg.refineNumber("133634", gg.TYPE_DWORD)
gg.getResults(50500)
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("134914;131330", gg.TYPE_DWORD)
gg.refineNumber("134914", gg.TYPE_DWORD)
gg.getResults(50500)
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("131586;131842", gg.TYPE_DWORD)
gg.refineNumber("131586", gg.TYPE_DWORD)
gg.getResults(50500)
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("132098;133635", gg.TYPE_DWORD)
gg.refineNumber("132098", gg.TYPE_DWORD)
gg.getResults(50500)
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("༆𝐑𝐄𝐃𝐆𝐀𝐌𝐈𝐍𝐆𝐈𝐃🇲🇨")
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("196,864;16,842,753::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1) 
if gg.getResultCount() == 0 then
else
gg.searchNumber("196,864", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
n = gg.getResultCount()
jz = gg.getResults(n)
for i = 1, n do
gg.addListItems({[1] = {address = jz[i].address + 236,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 232,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 228,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 340,flags = 4,freeze = true,value = 67109633}})
gg.addListItems({[1] = {address = jz[i].address + 344,flags = 4,freeze = true,value = 67109633}})
end
end
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("133634;134914", gg.TYPE_DWORD)
gg.refineNumber("133634", gg.TYPE_DWORD)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
if v.flags == gg.TYPE_DWORD then
v.value = "67109633"
v.freeze = true
end 
end 
gg.addListItems(t)
t = nil
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("134914;131330", gg.TYPE_DWORD)
gg.refineNumber("134914", gg.TYPE_DWORD)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
if v.flags == gg.TYPE_DWORD then
v.value = "67109633"
v.freeze = true
end 
end 
gg.addListItems(t)
t = nil
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("131586;131842", gg.TYPE_DWORD)
gg.refineNumber("131586", gg.TYPE_DWORD)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
if v.flags == gg.TYPE_DWORD then
v.value = "67109633"
v.freeze = true
end 
end 
gg.addListItems(t)
t = nil
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("132098;133635", gg.TYPE_DWORD)
gg.refineNumber("132098", gg.TYPE_DWORD)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
if v.flags == gg.TYPE_DWORD then
v.value = "67109633"
v.freeze = true
end 
end 
gg.addListItems(t)
t = nil
gg.editAll("67109633", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("༆𝐑𝐄𝐃𝐆𝐀𝐌𝐈𝐍𝐆𝐈𝐃🇲🇨")
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.setVisible(false)
gg.searchNumber("65795~590336;67109377;67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
gg.refineNumber("65795~590336", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
local t = gg.getResults(99999)
for i, v in ipairs(t) do
t[i].flags = 4, gg.TYPE_DWORD
t[i].value = '67109633'
t[i].freeze = true
end
gg.setVisible(false)
gg.addListItems(t)
gg.clearList()
gg.clearResults()
gg.setVisible(false)
gg.toast("༆𝐑𝐄𝐃𝐆𝐀𝐌𝐈𝐍𝐆𝐈𝐃🇲🇨")
gg.clearResults()
os.remove("/mnt/shell/0/emulated/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.tmgp.pubgmhd/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.igce/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.igce/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.iglite/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.iglite/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
gg.clearResults()
 gg.alert("😆 BYPASS KOREA ACTIVATED 👍\n YOUTUBE 🇮🇩 REDGAMINGID")
 end

 



function WHASD()

gg.setRanges(131072)

gg.searchNumber("5.6447121e21;-8.3252823e-40;4.9252852e21::", 16, false, 536870912, 0, -1)

gg.searchNumber("-8.3252823e-40", 16, false, 536870912, 0, -1)

gg.getResults(100)

gg.editAll("6444", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("4.9068373e21;-3.5875931e-39;4.8699618e21::", 16, false, 536870912, 0, -1)

gg.searchNumber("-3.5875931e-39", 16, false, 536870912, 0, -1)

gg.getResults(100)

gg.editAll("6444", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("5.0544113e21;-3.4039221e-39;4.8699607e21::", 16, false, 536870912, 0, -1)

gg.searchNumber("-3.4039221e-39", 16, false, 536870912, 0, -1)

gg.getResults(100)

gg.editAll("6444", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("5.6447206e21;-1.0161992e-39;4.9068396e21::", 16, false, 536870912, 0, -1)

gg.searchNumber("-1.0161992e-39", 16, false, 536870912, 0, -1)

gg.getResults(100)

gg.editAll("6444", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("4.7223665e21;-8.3246237e-40;4.8330515e21::", 16, false, 536870912, 0, -1)

gg.searchNumber("-8.3246237e-40", 16, false, 536870912, 0, -1)

gg.getResults(100)

gg.editAll("6444", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("4.7408149e21;-5.5695588e-40;4.814603e21::", 16, false, 536870912, 0, -1)

gg.searchNumber("-5.5695588e-40", 16, false, 536870912, 0, -1)

gg.getResults(6)

gg.editAll("6444", 16)

gg.alert("WallHack For All SnapDragon")

end



function WH7()

  gg.clearResults()

  gg.setRanges(gg.REGION_BAD)

  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

  gg.getResults(30)

  gg.editAll("120", gg.TYPE_FLOAT)

  gg.clearResults()

  gg.setRanges(gg.REGION_BAD)

  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;-127.0F::520", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

  gg.getResults(20)

  gg.editAll("120", gg.TYPE_FLOAT)

  gg.clearResults()

  gg.alert(" 🏘️ Wallhack 439  🏘️", "🇴 🇰") 

end



function WHFB()

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("5.2806111e-40;6.50000333786;3.7615819e-37;2", 16, false, 536870912, 0, -1)

gg.refineNumber("2", 16, false, 536870912, 0, -1)

gg.getResults(20)

gg.editAll("9999", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("1.1202011e-19;1.1202015e-19;3.7615819e-37;255.0;2", 16, false, 536870912, 0, -1)

gg.refineNumber("2", 16, false, 536870912, 0, -1)

gg.getResults(20)

gg.editAll("9999", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("4140D;1.1202011e-19~1.1202013e-19;1.1202015e-19~1.1202017e-19;2::", 16, false, 536870912, 0, -1)

gg.refineNumber("2", 16, false, 536870912, 0, -1)

gg.getResults(2)

gg.editAll("99999", 16)

gg.clearResults()

gg.alert(" Wallhack Fix Blink ")

end



function WHFS()

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200", 16, false, 536870912, 0, -1)

gg.searchNumber(2, 16, false, 536870912, 0, -1)

gg.getResults(3)

gg.editAll("2.001", 16)

gg.searchNumber(2, 16, false, 536870912, 0, -1)

gg.getResults(10)

gg.editAll("120", 16)

gg.clearResults()

gg.setRanges(131072)

gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", 16, false, 536870912, 0, -1)

gg.searchNumber("2", 16, false, 536870912, 0, -1)

gg.getResults(3)

gg.editAll("2.001", 16)

gg.searchNumber("2", 16, false, 536870912, 0, -1)

gg.getResults(10)

gg.editAll("120", 16)

gg.clearResults()

gg.alert(" Wallhack Fix Scope ")

end





function WH675()
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200")
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("930")
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.alert("Wallhack 675", "🇴 🇰") 
  
 end
function WH710()
gg.clearResults()
gg.setRanges(131072)
gg.searchNumber("6.03209094e21", 16, false, 536870912, 0, -1)
gg.getResults(6281913639784)
gg.editAll("0", 16)
gg.clearResults()
gg.setRanges(131072)
gg.searchNumber("-2.57741948e-39", 16, false, 536870912, 0, -1)
gg.getResults(6281913639784)
gg.editAll("0", 16)
gg.clearResults()
gg.toast("Wallhack 710 ")
end

function CH()
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("7,7", gg.TYPE_DWORD)
  gg.alert("Color Mediatek Red ✔")
end




function C6755()
   gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("11", gg.TYPE_DWORD)
  
 

end
function C675()
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
 gg.alert("Color Mediatek Red ✔")
end




function CYASDVO()
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
gg.alert("COLOR YELLOW ALL SD V1 ✔", "🇴 🇰") 
end


function CYASDVT()

gg.clearResults()

gg.setRanges(gg.REGION_BAD)

gg.searchNumber("8200;3,75F;8;9;10;11;12;13;14;15;16;227;8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)

gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)

gg.refineAddress("098", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)

gg.getResults(100)

gg.editAll("8198", gg.TYPE_DWORD)

gg.clearResults()

gg.alert("COLOR YELLOW ALL SD V2 ✔", "🇴 🇰") 

end



function Cam()

  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("220;178;15 ", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("220", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(300)
gg.editAll("335", gg.TYPE_FLOAT)
gg.clearResults()
  gg.alert("Ipad View Success ", "🇴 🇰") 

end





function AHS()

gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.75;150;1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(100000)
gg.editAll("30", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("0.75;150;30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("0.75", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(100000)
gg.editAll("0", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert(" 🅱🅻🅰🅲🅺 🆂🅺🆈 ", "🇴 🇰") 

end

 

function MB()
gg.clearResults()gg.setRanges(gg.REGION_BAD)
gg.searchNumber("-88.66608428955;26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-466", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("-88.73961639404;28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-568", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.201618;30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("280", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("0.10000000149;64.50088500977", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("0.10000000149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(50)
gg.editAll("8", gg.TYPE_FLOAT)
gg.clearResults()
gg.clearResults()
gg.setRanges(gg.REGION_BAD)
gg.searchNumber("-88.66608428955;26:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-460", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("-88.73961639404;28:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-560", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.201618;30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("250", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("-298284466;-1.304566e23F", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-298284466", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(99)
gg.editAll("0", gg.TYPE_DWORD)
gg.clearResults()
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("25;30.5", 16, false, 536870912, 0, -1)
gg.getResults(10)
gg.editAll("999999", 16)
gg.clearResults()
gg.alert(" MB  ", "🇴 🇰")
end


function AHSS()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(100000)
gg.editAll("400", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("24;26;46.36692428589", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("24;26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(100000)
gg.editAll("-9999999", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("25;23;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("23;25;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("25;23;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("23;25;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(3)
gg.editAll("180",gg.TYPE_FLOAT)
gg.clearResults()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
 if v.flags == gg.TYPE_FLOAT then
v.value = "200"
v.freeze = true
 end
end
gg.addListItems(t)
t = nil
gg.clearResults()
gg.alert(" AUTO HEATSHOT  ", "🇴 🇰") 
end



 

function LR()

gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-1331928307225851337", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineAddress("DEC", -1, gg.TYPE_QWORD, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(2)
gg.editAll("-1331928311210704896", gg.TYPE_QWORD)
gg.clearResults()
gg.alert("LR")
gg.toast("■■■■■■■■■■100%")
end

 

function AB()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("2046820354;-336587221:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2046820354", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("2046820353", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("2015175168", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(6)
gg.editAll("0", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("-476053504;-349478012:189", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-476053504", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("-476053503;-476053504", gg.TYPE_DWORD)
gg.clearResults()
gg.toast(" 🧿 Special Aimbot  ")
end
 

 

 

function CAR()

gg.clearResults()

gg.setRanges(gg.REGION_ANONYMOUS)

gg.searchNumber("0.00055555557;49.9999961853;24.99999809265", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

gg.searchNumber("0.00055555557", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

gg.getResults(10)

gg.editAll("0.00455555557", gg.TYPE_FLOAT)

gg.toast("UAZ Fly Actived....✔️")

gg.setVisible(false)

end


function Ca()
 gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.clearResults()
gg.searchNumber("-1.2382424e28;-1.4239333e28;-1.1144502e28;-1.8331474e27;-7.1608877e24::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-1.1144502e28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("90", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast(" Small CrossHair✔")
end



function SNMW()
WALL = gg.choice({
"🏡 sɴᴀᴘᴅʀᴀɢᴏɴ",
"🏡 ᴏᴛʜᴇʀ Phone",
"🏡 COLOR HACK",
"⫷ ⫷ ʙᴀᴄᴋ ⫸ ⫸",
}, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if WALL == nil then
  else
    if WALL == 1 then
      SNAPDRAGON()
    end
    if WALL == 2 then
      CHIPSET()
    end
    if WALL == 3 then
      COLORHACK()
    end
   if WALL == 4then
      HOME()
    end
  end
  PUBGMH = -1
end
function SNAPDRAGON()
  WALL11 = gg.multiChoice({
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴀʟʟ ᴅᴇᴠɪᴄᴇ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴀʟʟ sɴᴀᴘᴅʀᴀɢᴏɴ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ғɪx ʙʟɪɴᴋ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 400",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 410",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 415",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 425",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 430",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 435",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 439",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 450",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 600",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 610",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 615",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 616",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 625",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 626",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 630",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 632",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 636",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 650",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 652",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 653",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 660",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 665",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 670",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 675",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 710",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 712",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 800",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 801",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 805",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 808",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 810",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 815",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 820",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 821",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 835",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 845",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ sᴅ 855",
  "⫷ ⫷ ʙᴀᴄᴋ ⫸ ⫸",
}, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n\n ADMIN - SNM \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n 💻TELEGRAM - @DoctorMaster199 \n " .. Time)
  if WALL11 == nil then
  else
    if WALL11[1] == true then
      wh1()
    end
    if WALL11[2] == true then
      wh2()
    end
    if WALL11[3] == true then
      wh3()
    end
    if WALL11[4] == true then
      wh4()
    end
    if WALL11[5] == true then
      wh5()
    end
    if WALL11[6] == true then
      wh6()
    end
    if WALL11[7] == true then
      wh7()
    end
    if WALL11[8] == true then
      wh8()
    end
    if WALL11[9] == true then
      wh9()
    end
    if WALL11[10] == true then
      wh10()
    end
    if WALL11[11] == true then
      wh11()
    end
    if WALL11[12] == true then
      wh12()
    end
    if WALL11[12] == true then
      wh12()
    end
    if WALL11[13] == true then
      wh13()
    end
    if WALL11[14] == true then
      wh14()
    end
    if WALL11[15] == true then
      wh15()
    end
    if WALL11[16] == true then
      wh16()
    end
    if WALL11[17] == true then
      wh17()
    end
    if WALL11[18] == true then
      wh18()
    end
    if WALL11[19] == true then
      wh19()
    end
    if WALL11[20] == true then
      wh20()
    end
    if WALL11[21] == true then
      wh21()
    end
    if WALL11[22] == true then
      wh22()
    end
    if WALL11[23] == true then
      wh23()
    end
    if WALL11[24] == true then
      wh24()
    end
    if WALL11[25] == true then
      wh25()
    end
    if WALL11[26] == true then
      wh26()
    end
    if WALL11[27] == true then
      wh27()
    end
    if WALL11[28] == true then
      wh28()
    end
    if WALL11[29] == true then
      wh29()
    end
    if WALL11[30] == true then
      wh30()
    end
    if WALL11[31] == true then
      wh31()
    end
    if WALL11[32] == true then
      wh32()
    end
    if WALL11[33] == true then
      wh33()
    end
    if WALL11[34] == true then
      wh34()
    end
    if WALL11[35] == true then
      wh35()
    end
    if WALL11[35] == true then
      wh35()
    end
    if WALL11[36] == true then
      wh36()
    end
    if WALL11[37] == true then
      wh37()
    end
    if WALL11[38] == true then
      wh38()
    end
    if WALL11[39] == true then
      wh39()
    end
    if WALL11[40] == true then
      wh40()
    end
    if WALL11[41] == true then
      HOME()
    end
  end
  PUBGMH = -1
end

function wh1()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("200744D;4140D;277889028D;2;135215D;65541D;1074790401D", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("900", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh2()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.6447121e21;-8.3252823e-40;4.9252852e21::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-8.3252823e-40", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("6444", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4.9068373e21;-3.5875931e-39;4.8699618e21::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-3.5875931e-39", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("6444", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.0544113e21;-3.4039221e-39;4.8699607e21::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-3.4039221e-39", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("6444", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.6447206e21;-1.0161992e-39;4.9068396e21::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-1.0161992e-39", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("6444", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4.7223665e21;-8.3246237e-40;4.8330515e21::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-8.3246237e-40", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("6444", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4.7408149e21;-5.5695588e-40;4.814603e21::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-5.5695588e-40", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(6)
  gg.editAll("6444", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh3()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("6.50000333786;1.1202013e-19;3.7615819e-37;2::", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(1)
  gg.editAll("99999", 16)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh4()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("228;1,073,741,824;1,073,741,824;229;-1,082,130,432:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1,073,741,824", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("1,123,024,896", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("3.3631163e-44;2.0;3.5032462e-44;-1.0;3.643376e-44;3.7835059e-44;-1.0;3.9236357e-44;4.0637655e-44;1.0;-127.0:129", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh5()
  gg.clearResults()
  gg.setRanges(1)
  gg.searchNumber("3.1949605e-43;3.1809475e-43;2.0;3.2089735e-43", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("150", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8204;8205;1,194,344,451", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("15", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("1,669,693,440;8205", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8205", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("8204", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh6()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_HEAP)
  gg.searchNumber("228;1,073,741,824;1,073,741,824;229;-1,082,130,432:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1,073,741,824", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("1,123,024,896", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_HEAP)
  gg.searchNumber("3.3631163e-44;2.0;3.5032462e-44;-1.0;3.643376e-44;3.7835059e-44;-1.0;3.9236357e-44;4.0637655e-44;1.0;-127.0:129", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("3.1809475e-43;3.1949605e-43;2.0;3.2089735e-43:53", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh7()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("2.9427268e-44;2.0;3.0828566e-44;-1.0;3.2229865e-44;3.3631163e-44;3.643376e-44", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("3.1529215e-43;2.0F;3.1669345e-43F;3.1809475e-43:49", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh8()
  gg.clearResults()
  gg.searchNumber("3.2229865e-43F;2.0F;-1.0F;-1.0F;2.0F:145", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(360)
  gg.editAll("150", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh9()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO)
  gg.searchNumber("-5.56955884e-40;4.81460302e21;2.0:61", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("138", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO)
  gg.searchNumber("1.39125666e-19;3.9236357e-44;1.1202056e-19;2.0;0.24022650719:65", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(35)
  gg.editAll("138", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh10()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;-127.0F::520", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh11()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("135,215D;4,140D;3.7615819e-37;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1.1202013e-19;1.1202017e-19;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("9999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;0.00999999978F::200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("150", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("150", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4.7961574e21;3.7615819e-37;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("150", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh12()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4,140D;4.7408166e21F;4.7223665e21;0D;0D;0D;0D;0D;0D;-0.0F;2.0F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43;2.0F;-1.0F;1.0F;-127F;0.24022650719F;-0.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh13()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4,140D;4.7408166e21F;4.7223665e21;0D;0D;0D;0D;0D;0D;-0.0F;2.0F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43;2.0F;-1.0F;1.0F;-127F;0.24022650719F;-0.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh14()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_HEAP)
  gg.searchNumber("3.3631163e-44;2.0;3.5032462e-44;-1.0;3.643376e-44;3.7835059e-44;-1.0;3.9236357e-44;4.0637655e-44;1.0;-127.0:129", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("3.1809475e-43;3.1949605e-43;2.0;3.2089735e-43:53", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh15()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4,140D;4.7408166e21F;4.7223665e21;0D;0D;0D;0D;0D;0D;-0.0F;2.0F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43;2.0F;-1.0F;1.0F;-127F;0.24022650719F;-0.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh16()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("135,215D;4,140D;3.7615819e-37;2::", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("130", 16)
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("130", 16)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh17()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,900,553;178;37;2F::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.25;3.75000071526;331,813D;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("720,918;1,081,081,860;397,358;50,331,648;2F::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("671,236,101;1,074,790,406;178;12;2F::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh18()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504")
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("900")
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh19()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504")
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("900")
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh20()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh21()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh22()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh23()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh24()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", 16, false, 536870912, 0, -1)
  gg.refineNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", 16, false, 536870912, 0, -1)
  gg.refineNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

--table 34
--table 25


function wh25()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("95D;2;9.2194229e-41::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  ggg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh26()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200")
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("930")
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh27()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("1.4912565e-19;2.0;1.6623113e-19:9", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(20)
  gg.editAll("138", 16)
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::29", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(20)
  gg.editAll("138", 16)
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("1,081,081,865;8,200;1,446,128;348,401:21", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(2)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh28()
  gg.setRanges(131072)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", 16, false, 536870912, 0, -1)
  gg.refineNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", 16, false, 536870912, 0, -1)
  gg.refineNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh29()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("95D;2;9.2194229e-41::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh30()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;2.0;1.6623071e-19;3.6734297e-39;1.66433e10::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.0;-1.0;0.0;1.0;-127.0::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh31()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("3.15292154e-43;2.0;2.0;3.1949605e-43:73", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(3000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("3.15292154e-43;2.0;2.0;3.1949605e-43;4.34402524e-44;2.0;4.62428493e-44;4.76441478e-44:241", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(3000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh32()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4,140D;4.7408166e21F;4.7223665e21;0D;0D;0D;0D;0D;0D;-0.0F;2.0F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43;2.0F;-1.0F;1.0F;-127F;0.24022650719F;-0.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh33()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4,140D;4.7408166e21F;4.7223665e21;0D;0D;0D;0D;0D;0D;-0.0F;2.0F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43;2.0F;-1.0F;1.0F;-127F;0.24022650719F;-0.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh34()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh35()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("135,215D;4,140D;3.7615819e-37;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh36()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh37()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("135,215D;4,140D;3.7615819e-37;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh38()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;0.00999999978F::200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("7.1746481e-43;1.0842022e-19;94.015625;7.0776718e-15;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(5)
  gg.editAll("9999", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh39()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("2.0;-1.0;0.0;1.0;-127.0;0.24022650719;0.69314718246;0.00999999978::29", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(30)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.searchNumber("2.4382593e-43;1.3312335e-43;2::", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(30)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wh40()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("95D;2;9.2194229e-41::100", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(100)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30", 16, false, 536870912, 0, -1)
  gg.searchNumber("2", 16, false, 536870912, 0, -1)
  gg.getResults(100)
  gg.editAll("120", 16)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function CHIPSET()
  WALL22 = gg.multiChoice({
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴀʟʟ ᴅᴇᴠɪᴄᴇ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ғɪx ʙʟɪɴᴋ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ғɪx sᴄᴏᴘᴇ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 7420",
    "🏡️ ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 7570",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 7870",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 7880",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 7885",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 8890",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 8895",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 9610",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴇxʏɴᴏs 9810",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ʜᴜᴀᴡᴇɪ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 650",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 655",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 658",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 659",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 710",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 955",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 970",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴋɪʀɪɴ 980",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ 6750",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ 6765",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ɢ90ᴛ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ10",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ22",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ23",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ35",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ60",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ65",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ70",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ x20",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇᴅɪᴀᴛᴇᴋ x25",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ɴᴏᴛᴇ 3",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴏᴘᴘᴏ",
    "🏡 ᴡᴀʟʟʜᴀᴄᴋ ᴠɪᴠᴏ",
  "⫷ ⫷ ʙᴀᴄᴋ ⫸ ⫸",
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n\n ADMIN - SNM \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n 💻TELEGRAM - @DoctorMaster199 \n " .. Time)
  if WALL22 == nil then
  else
    if WALL22[1] == true then
      wc1()
    end
    if WALL22[2] == true then
      wc2()
    end
    if WALL22[3] == true then
      wc3()
    end
    if WALL22[4] == true then
      wc4()
    end
    if WALL22[5] == true then
      wc5()
    end
    if WALL22[6] == true then
      wc6()
    end
    if WALL22[7] == true then
      wc7()
    end
    if WALL22[8] == true then
      wc8()
    end
    if WALL22[9] == true then
      wc9()
    end
    if WALL22[10] == true then
      wc10()
    end
    if WALL22[11] == true then
      wc11()
    end
    if WALL22[12] == true then
      wc12()
    end
    if WALL22[13] == true then
      wc13()
    end
    if WALL22[14] == true then
      wc14()
    end
    if WALL22[15] == true then
      wc15()
    end
    if WALL22[16] == true then
      wc16()
    end
    if WALL22[17] == true then
      wc17()
    end
    if WALL22[18] == true then
      wc18()
    end
    if WALL22[19] == true then
      wc19()
    end
    if WALL22[20] == true then
      wc20()
    end
    if WALL22[21] == true then
      wc21()
    end
    if WALL22[22] == true then
      wc22()
    end
    if WALL22[23] == true then
      wc23()
    end
    if WALL22[24] == true then
      wc24()
    end
    if WALL22[25] == true then
      wc25()
    end
    if WALL22[26] == true then
      wc26()
    end
    if WALL22[27] == true then
      wc27()
    end
    if WALL22[28] == true then
      wc28()
    end
    if WALL22[29] == true then
      wc29()
    end
    if WALL22[30] == true then
      wc30()
    end
    if WALL22[31] == true then
      wc31()
    end
    if WALL22[32] == true then
      wc32()
    end
    if WALL22[33] == true then
      wc33()
    end
    if WALL22[34] == true then
      wc34()
    end
    if WALL22[35] == true then
      wc35()
    end
    if WALL22[36] == true then
      wc36()
    end
    if WALL22[37] == true then
      WALLHACK()
    end
  end
  PUBGMH = -1
end

function wc1()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("200744D;4140D;277889028D;2;135215D;65541D;1074790401D", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("900", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc2()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.2806111e-40;6.50000333786;3.7615819e-37;2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("9999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1.1202011e-19;1.1202015e-19;3.7615819e-37;255.0;2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("9999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4140D;1.1202011e-19~1.1202013e-19;1.1202015e-19~1.1202017e-19;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("99999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc3()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("2.001", gg.TYPE_FLOAT)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("2.001", gg.TYPE_FLOAT)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc4()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("360;0;0;0;-640;1;1;1;0;0;0;0;1;360;640;0.5;0;0;0;0.5;1;1;0;0;0;0;0;1;1;1;1;1,098618e-48:373", gg.TYPE_FLOAT)
  gg.searchNumber("0.5", gg.TYPE_FLOAT)
  t = gg.getResults(10)
  gg.editAll("50", gg.TYPE_FLOAT)
  print("addListItems: ", gg.addListItems(t))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc5()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("360;0;0;0;-640;1;1;1;0;0;0;0;1;360;640;0.5;0;0;0;0.5;1;1;0;0;0;0;0;1;1;1;1;1,098618e-48:373", gg.TYPE_FLOAT)
  gg.searchNumber("0.5", gg.TYPE_FLOAT)
  t = gg.getResults(10)
  gg.editAll("50", gg.TYPE_FLOAT)
  print("addListItems: ", gg.addListItems(t))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc6()
  if w == 1 then
    WHFIX7870()
  else
    gg.clearList()
    gg.clearResults()
    gg.setRanges(4)
    gg.clearResults()
    gg.searchNumber("0.5;1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.processResume()
    gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("1", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("0.5;2.8025969e-45:161", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.processResume()
    gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("0.5", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("0.5;1.4012985e-45;1.4012985e-45;2.8025969e-45;2.2958874e-41::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if gg.getResultCount() == 0 then
      gg.alert("🅴🆁🆁🅾🆁\nvᴀʟuᴇ ɴoт ғouɴᴅ")
    else
      gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      _Count = gg.getResultCount()
      _A = gg.getResults(_Count)
      last_Count = _Count + 1
      w = 1
      _T = "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁"
      WHFIX7870()
    end
  end
end

function WHFIX7870()
  if w == 0 then
    gg.alert("🅴🆁🆁🅾🆁\nvᴀʟuᴇ ɴoт ғouɴᴅ")
  else
    gg.setVisible(false)
    _CL = {}
    for i = 1, _Count do
    end
    _C_ = gg.choice(_CL, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
    for i = 1, _Count do
      if _C_ == i then
        for i, i in ipairs(_A) do
          gg.addListItems(_A)
        end
        gg.addListItems(_A)
        i = _Count
      elseif K_2 == _Count + 1 then
        HOME()
      end
    end
  end
  gg.setVisible(true)
end

function wc7()
  gg.searchNumber("0.5;0.5;5.1567783e-43;2.2958874e-41:125", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(20, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(20, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(20, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc8()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.clearResults()
  gg.searchNumber("3162688022693019688Q;4915678994331860992Q:2293", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("4915678994331860992", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.addListItems({})
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.clearResults()
  gg.searchNumber("1.5694543e-43F;3162688022693019688Q;1.6209256e-12F;4.4841551e-44F;6.7262326e-44F;2.2420775e-44F::177", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("3162688022693019688", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("36", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc9()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("9.70070386e-38;4.59177481e-40;9.70070386e-38;3.13890856e-43;1.40129846e-45;2.80259693e-45;0.5:441", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc10()
  if w == 1 then
    WHFIX8895()
  else
    gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("0.5;2.8025969e-45;4D;2D;14D;5D;-1D", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll("0", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("0.5;2.8025969e-45;4D;2D;14D;5D;-1D", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if gg.getResultCount() == 0 then
      gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 👑 Wallhack Exynos 8895 🤣")
    else
      gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      _Count = gg.getResultCount()
      _A = gg.getResults(_Count)
      last_Count = _Count + 1
      w = 1
      _T = "🇮 Wallhack Exynos 8895 🤣"
      WHFIX8895()
    end
  end
end

function WHFIX8895()
  if w == 0 then
    gg.toast("Loading...")
  else
    gg.setVisible(false)
    _CL = {}
    for i = 1, _Count do
    end
    _C_ = gg.choice(_CL, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
    for i = 1, _Count do
      if _C_ == i then
        for i, i in ipairs(_A) do
          gg.addListItems(_A)
        end
        gg.addListItems(_A)
        i = _Count
      elseif K_2 == _Count + 1 then
        CHIPSET()
      end
    end
  end
  gg.setVisible(true)
end

function wc11()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("0.5;1.098618e-42;2.80259693e-45;1.40129846e-45;4.48415509e-44;2.80259693e-45;2.2958874e-41;7.00649232e-45::", gg.TYPE_FLOAT)
  gg.searchNumber("0.5", gg.TYPE_FLOAT)
  z = gg.getResults(9)
  Bydz_4 = gg.getResultCount()
  for i = 1, Bydz_4 do
    y = z[i].address
    addListItems({})
  end
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc12()
  if w == 1 then
    WHFIX9810()
  else
    gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("0.5;360.0;736.0;0.5;1.0;1.0;1.0;1.0:85", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if gg.getResultCount() == 0 then
      gg.alert("Value Not Found")
    else
      gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      _Count = gg.getResultCount()
      _A = gg.getResults(_Count)
      last_Count = _Count + 1
      w = 1
      _T = "Edit Wallhack Value"
      WHFIX9810()
    end
  end
end

function WHFIX9810()
  if w == 0 then
    gg.alert("Value Not Found")
  else
    gg.setVisible(false)
    _CL = {}
    for i = 1, _Count do
    end
    C = gg.choice(_CL, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
    for i = 1, _Count do
      if C == i then
        for i, i in ipairs(_A) do
          gg.addListItems(_A)
        end
        gg.addListItems(_A)
        i = _Count
      elseif K_2 == _Count + 1 then
        WA()
      end
    end
  end
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc13()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;1.1204989e-19;1.6815582e-44;1.5414283e-44", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;4.7408166e21;5.6896623e-29;4.7961574e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;4.8699472e21;2.718519e-43;1.3912525e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;3.2363458e-17;7.3900417e-40;5.3249342e-44", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(40)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;4.9252829e21;2.718519e-43;1.3912552e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("1;4.8699472e21;2.718519e-43;1.3912525e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("1;4.9252829e21;2.718519e-43;1.3912552e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc14()
  gg.clearResults()
  gg.searchNumber("8.4077908e-45;4.2038954e-45;1.5694543e-43;1.4012985e-45;2.8025969e-45;268.0;480.0;0.5:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc15()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("8.5077908e-45;4.2038954e-45;2.8025969e-45;0.5;0.5;2.8025969e-45;1.4012985e-45;7.0064923e-45:337", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
  gg.searchNumber("56;64;80;16;80:93", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc16()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("0.5;1.4012985e-45;1.4012985e-45;3.8115318e-43;2.8025969e-45;2.2958874e-41:125", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function wc17()
  gg.searchNumber("0.5;1.4012985e-45;4.7083628e-43;2.8025969e-45;2.2958874e-41::109", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.addListItems()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc18()
  gg.clearResults()
  gg.searchNumber("1.8367379e-40;4.5917748e-40;4.2038954e-45;1.4012985e-45;1.793662e-43;1.4012985e-45;2.8025969e-45;1.1210388e-44;0.5:281", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc19()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("4.2038954e-45;1.4012985e-45;1.5694543e-43;1.4012985e-45;2.8025969e-45;0.5:109", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(4)
  gg.editAll("1", gg.TYPE_FLOAT)
  var = gg.getResults(22)
  gg.addListItems(var)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc20()
  gg.setRanges(gg.REGION_C_ALLOC, gg.REGION_BAD)
  gg.searchNumber("4.2038954e-45;1.4012985e-45;1.793662e-43;1.4012985e-45;2.8025969e-45;3.5873241e-43;0.5;2.8025969e-45;1.4012985e-45;1.4012985e-45:249", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
    end
  end
  gg.addListItems((gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.processResume()
  gg.setRanges(gg.REGION_C_ALLOC, gg.REGION_BAD)
  gg.processResume()
  gg.clearResults()
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("90", gg.TYPE_DWORD)
  gg.addListItems((gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function wc21()
  if w == 1 then
    WHFIX980()
  else
    gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("0.5;360.0;360.0;752.0;752.0;1.0;1.0;1.0;1.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if gg.getResultCount() == 0 then
      gg.alert("Value Not Found")
    else
      gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      _Count = gg.getResultCount()
      _A = gg.getResults(_Count)
      last_Count = _Count + 1
      w = 1
      _T = "Edit Wallhack Value"
      WHFIX980()
    end
  end
end

function WHFIX980()
  if w == 0 then
    gg.alert("Value Not Found")
  else
    gg.setVisible(false)
    _CL = {}
    for i = 1, _Count do
    end
    _C_ = gg.choice(_CL, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
    for i = 1, _Count do
      if _C_ == i then
        for i, i in ipairs(_A) do
          gg.addListItems(_A)
        end
        gg.addListItems(_A)
        i = _Count
      elseif K_2 == _Count + 1 then
        WHK4()
      end
    end
  end
  gg.setVisible(true)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc22()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("9.63412312e-38F;56D:229", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("56;54", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc23()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("131,074;1;1,131,413,504;1,137,967,104;1,056,964,608:225", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("1,056,964,608", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(4, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(4, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
      gg.clearResults()
    end
  end
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc24()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("36", gg.TYPE_DWORD)
  gg.clearResults()
  gg.searchNumber("\"1.793662e-43F;3.5873241e-43F;1.1210388e-44F;0.5F:512\"", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("\"0.5\"", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_FLOAT then
      i.value = "\"2\""
      i.freeze = true
    end
  end
  gg.addListItems((gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.processResume()
  gg.processResume()
  gg.processResume()
  gg.processResume()
  gg.processResume()
  gg.processResume()
  gg.processResume()
  gg.processResume()
  revert = gg.getListItems()
  for i, i in ipairs((gg.getListItems())) do
    if i.flags == gg.TYPE_FLOAT then
      i.value = "\"2.0\""
      i.freeze = true
      i.freezeType = gg.FREEZE_NORMAL
    end
  end
  gg.addListItems((gg.getListItems()))
  gg.processResume()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc25()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("304D;328D;328D;64D;3,552D:100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("64", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("61", gg.TYPE_DWORD)
  for i, i in ipairs((gg.getResults(10))) do
  end
  gg.addListItems((gg.getResults(10)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc26()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("4;4;2;6;5;5;1;1;1;3::769", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("3", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(1)
  gg.editAll("140", gg.TYPE_FLOAT)
  var = gg.getResults(100)
  var[1].value = 140
  var[1].freeze = true
  gg.addListItems(var)
  gg.toast("🆂🅽🅼 ??🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc27()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("0.5;0.27913400531;1.0:57", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(20)
  gg.editAll("2", gg.TYPE_FLOAT)
  var = gg.getResults(100)
  gg.addListItems(var)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc28()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("5;3;1;5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("3", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  t = gg.getResults(100)
  for i = 1, #t do
  end
  gg.addListItems(t)
  gg.clearResults()
  gg.setVisible(false)
  gg.sleep(150)
  for i = 1, 3 do
    for i = 1, 15 do
      gg.sleep(70)
    end
  end
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc29()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("5.1567783e-43;3.5873241e-43;3.2229865e-44;0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(20)
  gg.editAll("2", gg.TYPE_FLOAT)
  var = gg.getResults(100)
  gg.addListItems(var)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc30()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.793662e-43;3.5873241e-43;1.1210388e-44;0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(20)
  gg.editAll("2", gg.TYPE_FLOAT)
  var = gg.getResults(100)
  gg.addListItems(var)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function wc31()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.793662e-43;3.5873241e-43;1.1210388e-44;0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(20)
  gg.editAll("2", gg.TYPE_FLOAT)
  var = gg.getResults(100)
  var[1].value = 2
  var[1].freeze = true
  var[2].value = 2
  var[2].freeze = true
  var[3].value = 2
  var[3].freeze = true
  var[4].value = 2
  var[4].freeze = true
  var[5].value = 2
  var[5].freeze = true
  var[6].value = 2
  var[6].freeze = true
  var[7].value = 2
  var[7].freeze = true
  var[8].value = 2
  var[8].freeze = true
  var[9].value = 2
  var[9].freeze = true
  gg.addListItems(var)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc32()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("0.5;360;640;1;1;1;-640;360::", gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(20)
  gg.editAll("0", gg.POINTER_WRITABLE)
  var = gg.getResults(100)
  gg.addListItems(var)
  gg.clearResults()
  gg.clearResults()
  gg.searchNumber("56;64;48::35", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("47", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc33()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("640.0;360;0.5;0;640;360;0.5;12000;0.27913400531;0.56855899096::", gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(20)
  gg.editAll("2", gg.POINTER_WRITABLE)
  var = gg.getResults(100)
  gg.addListItems(var)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc34()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;2.0;1.6623071e-19;3.6734297e-39;1.66433e10::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.0;-1.0;0.0;1.0;-127.0::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc35()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.0;4.7961574e21;4.7408166e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.0; 4.8699472e21;4.8699466e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.0;4.7777152e21;4.7777146e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.0;4.7961574e21;4.7408166e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.0;4.8699472e21;4.8699466e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2.0; 4.7777152e21;4.7777146e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function wc36()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4,140D;4.7408166e21;5.6896623e-29;4.7961574e21;3.7615819e-37;2:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("200,866D;0.24022650719;0.69314718246;0.00999999978;1;-1;2;-127:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("32,770D;0.01799999923;0.29907226562;-1;2:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(4)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("50,331,648D;0.01799999923;0.29907226562;0.5869140625;0.11401367188;-1;2:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("50,331,648D;0.04000854492;0.11999511719;-0.02749633789;-0.57177734375;-1;2:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("-1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("266,400D;0.24022650719;0.69314718246;0.00999999978;1;-1;-127;2:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("50,331,648D;0.04000854492;0.11999511719;-0.02749633789;-0.571777343751;2:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("4,140D;4.7408149e21;-5.5695588e-40;4.814603e21;3.7615819e-37;2:", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end
    
   

function COLORHACK()
  CHACKKK1 = gg.choice({
    "❏ ᴄᴏʟᴏʀ ᴀʟʟ ᴅᴇᴠɪᴄᴇ",
    "❏ ᴄᴏʟᴏʀ ᴇxʏɴᴏs",
    "❏ ᴄᴏʟᴏʀ ʜᴅʀ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ",
    "❏ ᴄᴏʟᴏʀ ᴠᴇʜɪᴄʟᴇ",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 400",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 410",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 415",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 425",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 430",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 435",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 450",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 610",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 615",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 625",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 636",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 650",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 653",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 660",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 665",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 675",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 710",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 712",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 835",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 845",
    "❏ ᴄᴏʟᴏʀ sɴᴀᴘ 855",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CHACKKK1 == nil then
  else
    if CHACKKK1 == 1 then
      cr1()
    end
    if CHACKKK1 == 2 then
      cr2()
    end
    if CHACKKK1 == 3 then
      cr3()
    end
    if CHACKKK1 == 4 then
      cr4()
    end
    if CHACKKK1 == 5 then
      cr5()
    end
    if CHACKKK1 == 6 then
      cr6()
    end
    if CHACKKK1 == 7 then
      cr7()
    end
    if CHACKKK1 == 8 then
      cr8()
    end
    if CHACKKK1 == 9 then
      cr9()
    end
    if CHACKKK1 == 10 then
      cr10()
    end
    if CHACKKK1 == 11 then
      cr11()
    end
    if CHACKKK1 == 12 then
      cr12()
    end
    if CHACKKK1 == 13 then
      cr13()
    end
    if CHACKKK1 == 14 then
      cr14()
    end
    if CHACKKK1 == 15 then
      cr15()
    end
    if CHACKKK1 == 16 then
      cr16()
    end
    if CHACKKK1 == 17 then
      cr17()
    end
    if CHACKKK1 == 18 then
      cr18()
    end
    if CHACKKK1 == 19 then
      cr19()
    end
    if CHACKKK1 == 20 then
      cr20()
    end
    if CHACKKK1 == 21 then
      cr21()
    end
    if CHACKKK1 == 22 then
      cr22()
    end
    if CHACKKK1 == 23 then
      cr23()
    end
    if CHACKKK1 == 24 then
      cr24()
    end
    if CHACKKK1 == 25 then
      cr25()
    end
    if CHACKKK1 == 26 then
      cr26()
    end
    if CHACKKK1 == 27 then
      cr27()
    end
    if CHACKKK1 == 28 then
      HOME()
    end
  end
  PUBGMH = -1
end

function cr1()
  CLRALLDEVICE1 = gg.multiChoice({
    "❏ Color Red",
    "❏ Color Yellow",
    "❏ Color Green",
    "❏ Color Blue",
    "❏ Color White",
    "❏ Color Pink",
    "❏ Color Rainbow",
    "• • •『 BACK 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRALLDEVICE1 == nil then
  else
    if CLRALLDEVICE1[1] == true then
      crldevice1()
    end
    if CLRALLDEVICE1[2] == true then
      crldevice2()
    end
    if CLRALLDEVICE1[3] == true then
      crldevice3()
    end
    if CLRALLDEVICE1[4] == true then
      crldevice4()
    end
    if CLRALLDEVICE1[5] == true then
      crldevice5()
    end
    if CLRALLDEVICE1[6] == true then
      crldevice6()
    end
    if CLRALLDEVICE1[7] == true then
      crldevice7()
    end
    if CLRALLDEVICE1[10] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crldevice1()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crldevice2()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("256;8200;13::150", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("6", 4)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldevice3()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("2305913382252838926", 32, false, 536870912, 0, -1)
  gg.refineNumber("2305913382252838926", 32, false, 536870912, 0, -1)
  gg.refineAddress("0D0", -1, 32, 536870912, 0, -1)
  gg.refineNumber("2305913382252838926", 32, false, 536870912, 0, -1)
  gg.getResults(1401)
  gg.editAll("2305913382252838924", 32)
  gg.clearResults()
  gg.searchNumber("7169730606773899507", 32, false, 536870912, 0, -1)
  gg.refineNumber("7169730606773899507", 32, false, 536870912, 0, -1)
  gg.refineAddress("0C8", -1, 32, 536870912, 0, -1)
  gg.refineNumber("7169730606773899507", 32, false, 536870912, 0, -1)
  gg.getResults(1401)
  gg.editAll("7169730606773831033", 32)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldevice4()
  gg.setRanges(131072)
  gg.searchNumber("2305913416612577295", 32, false, 536870912, 0, -1)
  gg.refineNumber("2305913416612577295", 32, false, 536870912, 0, -1)
  gg.refineAddress("0E0", -1, 32, 536870912, 0, -1)
  gg.refineNumber("2305913416612577295", 32, false, 536870912, 0, -1)
  gg.getResults(1401)
  gg.editAll("2305913416612577292", 32)
  gg.clearResults()
  gg.clearResults()
  gg.searchNumber("2305913382252838926", 32, false, 536870912, 0, -1)
  gg.refineNumber("2305913382252838926", 32, false, 536870912, 0, -1)
  gg.refineAddress("0D0", -1, 32, 536870912, 0, -1)
  gg.refineNumber("2305913382252838926", 32, false, 536870912, 0, -1)
  gg.getResults(1401)
  gg.editAll("2305913382252838924", 32)
  gg.clearResults()
  gg.searchNumber("7169730606773899507", 32, false, 536870912, 0, -1)
  gg.refineNumber("7169730606773899507", 32, false, 536870912, 0, -1)
  gg.refineAddress("0C8", -1, 32, 536870912, 0, -1)
  gg.refineNumber("7169730606773899507", 32, false, 536870912, 0, -1)
  gg.getResults(1401)
  gg.editAll("7169730606773831033", 32)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldevice5()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8200;16;13;14:57", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("4", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldevice6()
  gg.clearResults()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("32768;-2134900726;32769;-2134900725;32770;-2134900724::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("32768;32770::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("4", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldevice7()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4.5926155869782e-41;1.0863202718415e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1.0863202718415e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1.0863202718415e-25", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr2()
  CHACK22 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ ᴇxʏɴᴏs ʙʟᴀᴄᴋ",
    "❏ ᴄᴏʟᴏʀ ᴇxʏɴᴏs ᴘɪɴᴋ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ ᴇxʏɴᴏs ʀᴇᴅ ",
    "❏ ᴄᴏʟᴏʀ ᴇxʏɴᴏs ʀᴇᴅ ʜᴅʀ",
    "❏ ᴄᴏʟᴏʀ ᴇxʏɴᴏs ᴡʜɪᴛᴇ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ ᴇxʏɴᴏs ʏᴇʟʟᴏᴡ",
    "❏ ᴄᴏʟᴏʀ ᴇxʏɴᴏs 7870 ʀᴇᴅ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ ᴇxʏɴᴏs 7870 ʏᴇʟʟᴏᴡ",
    "❏ ᴄᴏʟᴏʀ ᴇxʏɴᴏs 8890 ʀᴇᴅ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CHACK22 == nil then
  else
    if CHACK22[1] == true then
      cree1()
    end
    if CHACK22[2] == true then
      cree2()
    end
    if CHACK22[3] == true then
      cree3()
    end
    if CHACK22[4] == true then
      cree4()
    end
    if CHACK22[5] == true then
      cree5()
    end
    if CHACK22[6] == true then
      cree6()
    end
    if CHACK22[7] == true then
      cree7()
    end
    if CHACK22[8] == true then
      cree8()
    end
    if CHACK22[9] == true then
      cree9()
    end
    if CHACK22[10] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function cree1()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("573.70306396484;0.05499718338;1::50", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("-999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree2()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("56;64;3:21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("38", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree3()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.1210388e-44;360.0;0.5:41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.addListItems({})
  gg.processResume()
  gg.clearResults()
  gg.searchNumber("40;32;48;16;802824192:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.addListItems({})
  gg.processResume()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree4()
  gg.clearResults()
  gg.searchNumber("40D;32D;16D;2D::53", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  for i, i in ipairs((gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree5()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("573.70306396484;0.05499718338;1::50", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree6()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.1210388e-44;360.0;0.5:41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.addListItems({})
  gg.processResume()
  gg.clearResults()
  gg.searchNumber("40;32;48;16;802824192:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.addListItems({})
  gg.processResume()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree7()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("24;802824704;32;2::21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("24", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(5)
  gg.editAll("22", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree8()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("232;80;6;160;88;6;128;4", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("88", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(25)
  gg.editAll("89", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cree9()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.clearResults()
  gg.searchNumber("224D;128D;224D;14D;40D;64D;64D;12D;140D;16D;156D;32D;168D:533", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(786)
  gg.editAll("40;102", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr3()
  CLHDRAEVICE1 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ ʜᴅʀ ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ ʜᴅʀ ᴅɪᴀᴍᴏɴᴅ",
    "❏ ᴄᴏʟᴏʀ ʜᴅʀ ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ ʜᴅʀ ʀᴀɪɴʙᴏᴡ",
    "❏ ᴄᴏʟᴏʀ ʜᴅʀ ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ ʜᴅʀ ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLHDRAEVICE1 == nil then
  else
    if CLHDRAEVICE1[1] == true then
      crldhdrce1()
    end
    if CLHDRAEVICE1[2] == true then
      crldhdrce2()
    end
    if CLHDRAEVICE1[3] == true then
      crldhdrce3()
    end
    if CLHDRAEVICE1[4] == true then
      crldhdrce4()
    end
    if CLHDRAEVICE1[5] == true then
      crldhdrce5()
    end
    if CLHDRAEVICE1[6] == true then
      crldhdrce6()
    end
    if CLHDRAEVICE1[7] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crldhdrce1()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0B0")
  gg.getResults(999)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldhdrce2()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,661,337,615D;8,200D;1,194,380,049D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("70", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldhdrce3()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,661,337,615D;8,200D;1,194,380,049D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("8230", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldhdrce4()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,661,337,615D;8,200D;1,194,380,049D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("74", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldhdrce5()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8200;1,194,380,071;0;256:21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.editAll("3", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldhdrce6()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,661,337,615D;8,200D;1,194,380,049D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("65", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr4()
  CHACK33 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ ʙʟᴀᴄᴋ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ ᴡʜɪᴛᴇ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ ʏᴇʟʟᴏᴡ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ 659 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ 659 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ 710 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ ᴋɪʀɪɴ 710 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CHACK33 == nil then
  else
    if CHACK33[1] == true then
      creee1()
    end
    if CHACK33[2] == true then
      creee2()
    end
    if CHACK33[3] == true then
      creee3()
    end
    if CHACK33[4] == true then
      creee4()
    end
    if CHACK33[5] == true then
      creee5()
    end
    if CHACK33[6] == true then
      creee6()
    end
    if CHACK33[7] == true then
      creee7()
    end
    if CHACK33[8] == true then
      creee8()
    end
    if CHACK33[9] == true then
      creee9()
    end
    if CHACK33[10] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function creee1()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40D;32D;16D;2D::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("39", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee2()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("2;2;8;6;40:45", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("32", gg.TYPE_DWORD)
  gg.processResume()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee3()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("25", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee4()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40D;32D;16D;2D::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("42", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee5()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("36", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee6()
  gg.clearResults()
  gg.searchNumber("24;802824704;32;2:21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("24", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("20", gg.TYPE_DWORD)
  gg.processResume()
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee7()
  gg.clearResults()
  gg.searchNumber("24;802824704;32;2::21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("24", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("22", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee9()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0A0")
  gg.getResults(999)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creee10()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("3152519739159347240", gg.TYPE_QWORD)
  gg.addListItems((gg.getResults(20)))
  gg.editAll("150", gg.TYPE_QWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr5()
  CHACK44 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ɢʀᴇᴇɴ [sᴍᴏᴏᴛʜ]",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ɢʀᴇᴇɴ [ʜᴅ]",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ʀᴇᴅ [sᴍᴏᴏᴛʜ]",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ʀᴇᴅ [ʜᴅ]",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ʏᴇʟʟᴏᴡ [sᴍᴏᴏᴛʜ]",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ᴡʜɪᴛᴇ [sᴍᴏᴏᴛʜ]",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ᴡʜɪᴛᴇ [ʜᴅʀ]",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ10 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ60 ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ60 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ60 ʏᴇʟʟᴏᴡ",
    "❏ ᴄᴏʟᴏʀ ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ22 ʙʟᴜᴇ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CHACK44 == nil then
  else
    if CHACK44[1] == true then
      creeee1()
    end
    if CHACK44[2] == true then
      creeee2()
    end
    if CHACK44[3] == true then
      creeee3()
    end
    if CHACK44[4] == true then
      creeee4()
    end
    if CHACK44[5] == true then
      creeee5()
    end
    if CHACK44[6] == true then
      creeee6()
    end
    if CHACK44[7] == true then
      creeee7()
    end
    if CHACK44[8] == true then
      creeee8()
    end
    if CHACK44[9] == true then
      creeee9()
    end
    if CHACK44[10] == true then
      creeee10()
    end
    if CHACK44[11] == true then
      creeee11()
    end
    if CHACK44[12] == true then
      creeee12()
    end
    if CHACK44[13] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function creeee1()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("56;64;48::40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("52", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee2()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("38D;14D;24D;48D;41D;16D::209", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("48", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("33", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee3()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("8;16;32;48;40::169", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("38", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee4()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("49D;18D;50D;19D;51D;20D;59D;21D;75D;22D::89", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("59", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("44", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee5()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("38D;14D;24D;48D;41D;16D::209", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("48", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("39", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee6()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("573.70306396484;0.05499718338;1::50", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("999", gg.TYPE_FLOAT)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee7()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("74D;48D;49D;18D;50D;19D;51D;20D;59D;22D::121", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("49", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("44", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee8()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("232;88;352:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("88", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("-2", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee9()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("802,824,192;48;937,041,920;40;736,370,688;32;802,824,192;48;802,824,192;16;802,824,192;2;2::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("28", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee10()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.68155816e-44F;1.62092562e-12F;3162688022693019688Q;1.62092562e-12F;2.24207754e-44F:241", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("3162688022693019688", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(25, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("38", gg.TYPE_QWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 Color Mediatek P60 Red 🤣")
end

function creeee11()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.68155816e-44F;1.62092562e-12F;3162688022693019688Q;1.62092562e-12F;2.24207754e-44F:241", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("3162688022693019688", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(25, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("36", gg.TYPE_QWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function creeee12()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;29;29;56:21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("33", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
  gg.clearResults()
  gg.setVisible(false)
end

function cr6()
  CLRVECHILEICE1 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ ᴠᴇʜɪᴄʟᴇ ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ ᴠᴇʜɪᴄʟᴇ ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ ᴠᴇʜɪᴄʟᴇ ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
   }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRVECHILEICE1 == nil then
  else
    if CLRVECHILEICE1[1] == true then
      crldvechioae1()
    end
    if CLRVECHILEICE1[2] == true then
      crldvechioae2()
    end
    if CLRVECHILEICE1[3] == true then
      crldvechioae3()
    end
    if CLRVECHILEICE1[4] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crldvechioae1()
  gg.searchNumber("8200;1194380048;283705351;1081098260;15:17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("11", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crldvechioae2()
  gg.searchNumber("8200;1194380048;283705351;1081098260;15:17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crldvechioae3()
  gg.searchNumber("8200;1194380048;283705351;1081098260;15:17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr7()
  CLRSNAP4001 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 400 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 400 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP4001 == nil then
  else
    if CLRSNAP4001[1] == true then
      crl4001()
    end
    if CLRSNAP4001[2] == true then
      crl4002()
    end
    if CLRSNAP4001[3] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl4001()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,201;8,202;538,968,081:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8202", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("8", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl4002()
  gg.setRanges(gg.REGION_BAD)
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("856128", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(4)
  gg.editAll("856118", gg.TYPE_DWORD)
  gg.clearResults()
  gg.searchNumber("196610;1280;196608:25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("196608", gg.TYPE_DWORD, false)
  gg.getResults(10)
  gg.editAll("9999", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function cr8()
  CLRSNAP4101 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 410 ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ 410 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 410 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 410 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP4101 == nil then
  else
    if CLRSNAP4101[1] == true then
      crl4101()
    end
    if CLRSNAP4101[2] == true then
      crl4102()
    end
    if CLRSNAP4101[3] == true then
      crl4103()
    end
    if CLRSNAP4101[4] == true then
      crl4104()
    end
    if CLRSNAP4101[5] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl4101()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1.1490647e-41;1.0863203e-19::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1.0863203e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("1.0863203e-25", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl4102()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,201;8,202;538,968,081:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8202", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("8", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl4103()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,192;8,204;1,507,345;8,200:129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl4104()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("856128", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(4)
  gg.editAll("856118", gg.TYPE_DWORD)
  gg.clearResults()
  gg.searchNumber("196610;1280;196608:25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("196608", gg.TYPE_DWORD, false)
  gg.getResults(10)
  gg.editAll("9999", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function cr9()
  CLRSNAP4151 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 415 ɢʀᴇᴇɴ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP4151 == nil then
  else
    if CLRSNAP4151[1] == true then
      crl4151()
    end
    if CLRSNAP4151[2] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl4151()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("200761;92;8204;856124;108;196610:409", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1000)
  gg.editAll("8500", gg.TYPE_DWORD)
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("856,128", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("856093", gg.TYPE_DWORD)
  gg.clearResults()
  gg.searchNumber("196,610;1,280;196,608::25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("196608", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(5)
  gg.editAll("9999", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function cr10()
  CLRSNAP4251 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 425 ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ 425 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 425 ᴍɪx",
    "❏ ᴄᴏʟᴏʀ 425 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 425 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP4251 == nil then
  else
    if CLRSNAP4251[1] == true then
      crl4251()
    end
    if CLRSNAP4251[2] == true then
      crl4252()
    end
    if CLRSNAP4251[3] == true then
      crl4253()
    end
    if CLRSNAP4251[4] == true then
      crl4254()
    end
    if CLRSNAP4251[5] == true then
      crl4255()
    end
    if CLRSNAP4251[6] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl4251()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("32,769D;1,086,324,737D;68D;538,968,069D;8,204D:17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("9", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl4252()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("856,128", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResultsCount()
  gg.getResults(3)
  gg.editAll("856095", gg.TYPE_DWORD)
  gg.clearResults()
  gg.searchNumber("196,610;1,280;196,608::25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("196608", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(5)
  gg.editAll("9999", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl4253()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("856128", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(4)
  gg.editAll("99", gg.TYPE_DWORD)
  gg.clearResults()
  gg.searchNumber("200761;92;8204;856124;108;196610:409", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("1", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl4254()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("200,761;92;8,204;856,124;108;196,610:409", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("8203", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl4255()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("856128", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(4)
  gg.editAll("99", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4060000BhA;0000200ChA", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("6666", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr11()
  CLRSNAP4301 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 430 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 430 ʀᴇᴅ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP4301 == nil then
  else
    if CLRSNAP4301[1] == true then
      crl4301()
    end
    if CLRSNAP4301[2] == true then
      crl4302()
    end
    if CLRSNAP4301[3] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl4301()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("200761;92;8204;856124;108;196610:409", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("99", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl4302()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4060000BhA;0000200ChA", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("75", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr12()
  CLRSNAP4351 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 435 ɢʀᴇᴇɴ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ 435 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 435 ʏᴇʟʟᴏᴡ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ 435 ᴡʜɪᴛᴇ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP4351 == nil then
  else
    if CLRSNAP4351[1] == true then
      crl4351()
    end
    if CLRSNAP4351[2] == true then
      crl4352()
    end
    if CLRSNAP4351[3] == true then
      crl4353()
    end
    if CLRSNAP4351[4] == true then
      crl4354()
    end
    if CLRSNAP4351[5] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl4351()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("200761;92;8204;856124;108;196610:409", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("99", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl4352()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,661,239,308;8,200;1,194,380,045:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(6)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl4353()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("284,164,106;1,080,035,849;8,200:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl4354()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("284,164,106;1,080,035,849;8,200:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr13()
  CLRSNAP4501 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 450 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 450 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 450 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP4501 == nil then
  else
    if CLRSNAP4501[1] == true then
      crl4501()
    end
    if CLRSNAP4501[2] == true then
      crl4502()
    end
    if CLRSNAP4501[3] == true then
      crl4503()
    end
    if CLRSNAP4501[4] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl4501()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("200761;92;8204;856124;108;196610:409", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("99", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl4502()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("4060000BhA;0000200ChA", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8204", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("75", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl4503()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1.3912525e-19F;8200;96", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr14()
  CLRSNAP6101 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 610 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 610 ʏᴇʟʟᴏᴡ",
    "❏ ᴄᴏʟᴏʀ 610 ᴡʜɪᴛᴇ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6101 == nil then
  else
    if CLRSNAP6101[1] == true then
      crl6101()
    end
    if CLRSNAP6101[2] == true then
      crl6102()
    end
    if CLRSNAP6101[3] == true then
      crl6103()
    end
    if CLRSNAP6101[4] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6101()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,080,033,292D;786,441D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("7", gg.TYPE_DWORD)
  ggg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6102()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,080,033,292D;786,441D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6103()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,080,033,292D;786,441D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("9", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr15()
  CLRSNAP6151 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 615 ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ 615 ᴄʏᴀɴ",
    "❏ ᴄᴏʟᴏʀ 615 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 615 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 615 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6151 == nil then
  else
    if CLRSNAP6151[1] == true then
      crl6151()
    end
    if CLRSNAP6151[2] == true then
      crl6152()
    end
    if CLRSNAP6151[3] == true then
      crl6153()
    end
    if CLRSNAP6151[4] == true then
      crl6154()
    end
    if CLRSNAP6151[5] == true then
      crl6155()
    end
    if CLRSNAP6151[6] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6151()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("R_R({5,159,46,192,78,222,123,7,151,45,189,79,229,110,5,148,47,185,81,221,110,255,150,45,181,79,222,112,252,150,42,179,70,215})", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("R_R({5,159,46,192,76,230})", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("R_R({5,159,46,192,77,230})", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6152()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,669,398,531;1,280;196,608;1,310,720;268,435,456:45", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("196608", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("196619", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,280;196,619;1,310,720;268,435,456;1,212,416;393,216;196,608:421", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("196608", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("196619", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6153()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("R_R({5,159,46,192,78,222,123,7,151,45,189,79,229,110,5,148,47,185,81,221,110,255,150,45,181,79,222,112,252,150,42,179,70,215})", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("R_R({5,159,46,192,76,230})", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("R_R({5,159,46,192,77,231})", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6154()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("R_R({5,159,46,192,78,222,123,7,151,45,189,79,229,110,5,148,47,185,81,221,110,255,150,45,181,79,222,112,252,150,42,179,70,215})", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("R_R({5,159,46,192,76,230})", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("R_R({5,159,46,192,78,222})", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6155()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,192D;256D;65,540D;12D;8200D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,192D;256D;65,540D;12D;8200D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,192D;256D;65,540D;12D;8200D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr16()
  CLRSNAP6251 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 625 ʙʟᴜᴇ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ 625 ɢʀᴇᴇɴ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ 625 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 625 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6251 == nil then
  else
    if CLRSNAP6251[1] == true then
      crl6251()
    end
    if CLRSNAP6251[2] == true then
      crl6252()
    end
    if CLRSNAP6251[3] == true then
      crl6253()
    end
    if CLRSNAP6251[4] == true then
      crl6254()
    end
    if CLRSNAP6251[5] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6251()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256;655370;128;8200;16;243;201;539246603:129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("3", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6252()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256;655370;128;8200;16;243;201;539246603:129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("78", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6253()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256D;8,200D;13D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResultsCount()
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6254()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256D;8,200D;13D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResultsCount()
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr17()
  CLRSNAP6361 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 636 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 636 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 636 ʏᴇʟʟᴏᴡ",
    "❏ ᴄᴏʟᴏʀ 636 ᴡʜɪᴛᴇ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6361 == nil then
  else
    if CLRSNAP6361[1] == true then
      crl6361()
    end
    if CLRSNAP6361[2] == true then
      crl6362()
    end
    if CLRSNAP6361[3] == true then
      crl6363()
    end
    if CLRSNAP6361[4] == true then
      crl6364()
    end
    if CLRSNAP6361[5] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6361()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1669332992;536887297;536887305:25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("9999", gg.TYPE_DWORD)
  gg.clearResults()
  ggg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6362()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,200D;1,194,380,045D;786,443D:9", ggTYPE_DWORD, false, ggSIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", ggTYPE_DWORD, false, ggSIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("6", ggTYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("B({50,46,52,57,48,51,49,52,55,101,50,49,70,59,56,50,48,48,68,59,52,53,50,53,57,46,48,54,50,53,70,58,49,55})", ggTYPE_DWORD, false, ggSIGN_EQUAL, 0, -1)
  gg.refineNumber("B({56,50,48,48})", ggTYPE_DWORD, false, ggSIGN_EQUAL, 0, -1)
  revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("B({55})", ggTYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6363()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8192;256;6;8200:129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6364()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256D;8,200D;13D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResultsCount()
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr18()
  CLRSNAP6501 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 650 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6501 == nil then
  else
    if CLRSNAP6501[1] == true then
      crl6501()
    end
    if CLRSNAP6501[2] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6501()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,661,239,308;8,200;1,194,380,045:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr19()
  CLRSNAP6531 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 653 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6531 == nil then
  else
    if CLRSNAP6531[1] == true then
      crl6531()
    end
    if CLRSNAP6531[2] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6531()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,192D;256D;65,540D;12D;8200D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr20()
  CLRSNAP6601 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 660 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 660 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 660 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6601 == nil then
  else
    if CLRSNAP6601[1] == true then
      crl6601()
    end
    if CLRSNAP6601[2] == true then
      crl6602()
    end
    if CLRSNAP6601[3] == true then
      crl6603()
    end
    if CLRSNAP6601[4] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6601()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256;655370;128;8200;16;243;201;539246603:129", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("78", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6602()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256D;8,200D;13D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResultsCount()
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("8198", gg.TYPE_DWORD)
 gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6603()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("256D;8,200D;13D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResultsCount()
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr21()
  CLRSNAP6651 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 665 ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ 665 ɢʀᴇᴇɴ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ 665 ʀᴇᴅ ",
    "❏ ᴄᴏʟᴏʀ 665 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6651 == nil then
  else
    if CLRSNAP6651[1] == true then
      crl6651()
    end
    if CLRSNAP6651[2] == true then
      crl6652()
    end
    if CLRSNAP6651[3] == true then
      crl6653()
    end
    if CLRSNAP6651[4] == true then
      crl6654()
    end
    if CLRSNAP6651[5] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6651()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("32.773D;50.331.648D;1.039.516.303D;1.025.761.280D;1.123.024.896D;1.050.800.659D;1.065.353.216D;1.170.939.904D;1.050.222.592D;1.058.422.784D::177", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("32773", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(25)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6652()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("69,897;147,457;69,739", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6653()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6654()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr22()
gg.alert("Graphic HD များအား HD ထားပြီးမှသုံးပါ")
  CLRSNAP6751 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 675 ʙʟᴀᴄᴋ 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "❏ ᴄᴏʟᴏʀ 675 ʙʟᴜᴇ 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "❏ ᴄᴏʟᴏʀ 675 ɢʀᴇᴇɴ 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "❏ ᴄᴏʟᴏʀ 675 ɢʀᴇᴇɴ 👉 ɢʀᴀᴘʜɪᴄ ʜᴅ",
    "❏ ᴄᴏʟᴏʀ 675 ᴡʜɪᴛᴇ 👉 ɢʀᴀᴘʜɪᴄ ʜᴅ",
    "❏ ᴄᴏʟᴏʀ 675 ʏᴇʟʟᴏᴡ ᴠ1 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "❏ ᴄᴏʟᴏʀ 675 ʏᴇʟʟᴏᴡ ᴠ2 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP6751 == nil then
  else
    if CLRSNAP6751[1] == true then
      crl6751()
    end
    if CLRSNAP6751[2] == true then
      crl6752()
    end
    if CLRSNAP6751[3] == true then
      crl6753()
    end
    if CLRSNAP6751[4] == true then
      crl6754()
    end
    if CLRSNAP6751[5] == true then
      crl6755()
    end
    if CLRSNAP6751[6] == true then
      crl6756()
    end
    if CLRSNAP6751[7] == true then
      crl6757()
    end
    if CLRSNAP6751[8] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl6751()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1,988,957,478,846,464", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("1,988,957,478,846,464", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineAddress("65C", -1, gg.TYPE_QWORD, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("1,988,957,478,846,464", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("1,988,957,532,585,984", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6752()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0B0")
  gg.getResults(999)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6753()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("69,897;147,457;69,739", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6754()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5,129,670,511,822,905,353", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.getResults(1401)
  gg.editAll("7", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6755()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8202", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(330)
  gg.editAll("14", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6756()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("69,897;147,457;69,739", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  ggg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl6757()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8196D;8192D;8200D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr23()
  CLRSNAP7101 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 710 ʙʟᴜᴇ",
    "❏ ᴄᴏʟᴏʀ 710 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 710 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 710 ᴡʜɪᴛᴇ",
    "❏ ᴄᴏʟᴏʀ 710 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP7101 == nil then
  else
    if CLRSNAP7101[1] == true then
      crl7101()
    end
    if CLRSNAP7101[2] == true then
      crl7102()
    end
    if CLRSNAP7101[3] == true then
      crl7103()
    end
    if CLRSNAP7101[4] == true then
      crl7104()
    end
    if CLRSNAP7101[5] == true then
      crl7105()
    end
    if CLRSNAP7101[6] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl7101()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,194,344,475D;8,201D;1,194,379,806D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl7102()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0A0", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(5)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl7103()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1,194,344,475D;8,201D;1,194,379,806D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl7104()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8,192D;256D;8200D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("4", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl7105()
  gg.setRanges(131072)
  gg.searchNumber("1.3912525e-19F;8200;96", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("6", 4)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr24()
  CLRSNAP7121 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 712 ɢʀᴇᴇɴ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ 712 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 712 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP7121 == nil then
  else
    if CLRSNAP7121[1] == true then
      crl7121()
    end
    if CLRSNAP7121[2] == true then
      crl7122()
    end
    if CLRSNAP7121[3] == true then
      crl7123()
    end
    if CLRSNAP7121[4] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl7121()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(999)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl7122()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1,081,081,875D;8,200D;1,194,344,485D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("13", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl7123()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1703959D;8200D;8201D:17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("1703959;8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6;7;8199", gg.TYPE_DWORD)
  gg.toast("🅼r🅼🅺 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr25()
  CLRSNAP8351 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 835 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 835 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 835 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP8351 == nil then
  else
    if CLRSNAP8351[1] == true then
      crl8351()
    end
    if CLRSNAP8351[2] == true then
      crl8352()
    end
    if CLRSNAP8351[3] == true then
      crl8353()
    end
    if CLRSNAP8351[4] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl8351()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0A0")
  gg.getResults(999)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl8352()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("098", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 ??🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl8353()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("098", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("8198", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr26()
  CLRSNAP8451 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 845 ɢʀᴇᴇɴ",
    "❏ ᴄᴏʟᴏʀ 845 ʀᴇᴅ",
    "❏ ᴄᴏʟᴏʀ 845 ʀᴇᴅ ʜᴅʀ",
    "❏ ɴᴇᴡ ᴄᴏʟᴏʀ 845 ʏᴇʟʟᴏᴡ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP8451 == nil then
  else
    if CLRSNAP8451[1] == true then
      crl8451()
    end
    if CLRSNAP8451[2] == true then
      crl8452()
    end
    if CLRSNAP8451[3] == true then
      crl8453()
    end
    if CLRSNAP8451[4] == true then
      crl8454()
    end
    if CLRSNAP8451[5] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl8451()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl8452()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1703959D;8200D;8201D:17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl8453()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8200;1,194,380,071;0;256:21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.editAll("3", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl8454()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("536887312;539246610;-2128609280;8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function cr27()
  CLRSNAP8551 = gg.multiChoice({
    "❏ ᴄᴏʟᴏʀ 855 ʀᴇᴅ 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "❏ ᴄᴏʟᴏʀ 855 ʏᴇʟʟᴏᴡ 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "❏ ᴄᴏʟᴏʀ 855 ɢʀᴇᴇɴ 👉 ɢʀᴀᴘʜɪᴄ ʜᴅ",
    "❏ ᴄᴏʟᴏʀ 855 ᴡʜɪᴛᴇ 👉 ɢʀᴀᴘʜɪᴄ sᴍᴏᴏᴛʜ",
    "• • •『 ʙᴀᴄᴋ 』• • •"
 }, nil, "🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  ADMIN - SNM  sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁  💻TELEGRAM - @DoctorMaster199  " .. Time)
  if CLRSNAP8551 == nil then
  else
    if CLRSNAP8551[1] == true then
      crl8551()
    end
    if CLRSNAP8551[2] == true then
      crl8552()
    end
    if CLRSNAP8551[3] == true then
      crl8553()
    end
    if CLRSNAP8551[4] == true then
      crl8554()
    end
    if CLRSNAP8551[5] == true then
      COLORHACK()
    end
  end
  PUBGMH = -1
end

function crl8551()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end

function crl8552()
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.refineAddress("0A8", -1, 4, 536870912, 0, -1)
  gg.getResults(1000)
  gg.editAll("8198", 4)
  gg.clearResults()
  gg.searchNumber("8201", 4, false, 536870912, 0, -1)
  gg.refineAddress("0B0", -1, 4, 536870912, 0, -1)
  gg.getResults(1000)
  gg.editAll("8199", 4)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl8553()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 ")
end

function crl8554()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("8200;1,194,380,071;0;256:21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.editAll("3", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁")
end



function MICR()
MN1 = gg.choice({
"🏃MICRO SPEED ON🏃\n",
"🏃MICRO SPEED OFF🏃\n",
"🔙 BACK\n",
}, nil, "")
if MN1 == nil then
else
if MN1 == 1 then
MION()
end-- Ghost
if MN1 == 2 then
MIOFF()
end-- Ghost
if MN1 == 3 then
HOME()
end-- Ghost
end-- Ghost
PUBGMH = -1
end----------------------------------------------------------------------------------------------------------------------------------- 
 
function MION()
    gg.clearResults()
    gg.setRanges(8)
    gg.searchNumber('-1,296,744,149,883,614,555', 32, false, 536870912, 0, -1)
    gg.getResults(99)
    gg.editAll(' -1,296,744,153,870,237,696', 32)
    gg.clearResults()
    gg.setRanges(8)
    gg.searchNumber('-1,904,987,454,010,553,855', 32, false, 536870912, 0, -1)
    gg.getResults(99)
    gg.editAll('-1,904,987,454,002,165,247', 32)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber('1;1;1;0.0001;20;0.0005;0.4::50', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('1', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(300)
    gg.editAll('1.07', gg.TYPE_FLOAT)
    gg.toast(' MICRO ON ')
    gg.clearResults()
  end
 
  function MIOFF()
    gg.clearResults()
    gg.setRanges(8)
    gg.searchNumber('-1,296,744,153,870,237,696', 32, false, 536870912, 0, -1)
    gg.getResults(99)
    gg.editAll(' -1,296,744,149,883,614,555', 32)
    gg.clearResults()
    gg.setRanges(8)
    gg.searchNumber('-1,904,987,454,002,165,247', 32, false, 536870912, 0, -1)
    gg.getResults(99)
    gg.editAll('-1,904,987,454,010,553,855', 32)
    gg.toast(' MICRO OFF ')
    gg.clearResults()
  end
 


function CLOSE()
gg.alert("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n\n ADMIN - SNM \n sᴄʀɪᴘᴛ : 🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁 \n 💻TELEGRAM - @DoctorMaster199 \n  ", "🔚 🅴🆇🅸🆃")
  gg.skipRestoreState()
  os.exit()
  gg.setVisible(true)
end
while true do
  Time = os.date("%G-%m-%d | Time: %H:%M:%S")
  if gg.isVisible(true) then
    gg.setVisible(false)
    HOME()
  end
end
while true do
  if gg.isVisible(true) then
    PUBGSM = 1
    gg.setVisible(false)
  end
  gg.clearResults()
  if PUBGSM == 1 then
    HOME()
  end
end
