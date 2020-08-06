module("luci.controller.myvpn", package.seeall)  --notice that myvpn is the name of the file myvpn.lua
 function index()
     entry({"admin", "myvpn"}, firstchild(), "MyVPN", 60).dependent=false
	 entry({"admin", "myvpn", "mystatus"}, template("mystatus"), "mystatus", 1)
     entry({"admin", "myvpn", "myconfig"}, cbi("myconfig"), "myconfig", 2)

end
 