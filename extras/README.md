# DNS List for extra LAN Cache
Select a game/platform from list, copy an entire section and modify on an editor like **_notepad_** or **_gedit_**, change IP address to match with your new  defined IP address.
Login to pfSense and paste the modified section on **pfSense > Service > DNS Forwarder** on **_Custom Options_** text box and apply.

## lancache-ncsoft
```
address=/lineage2.patcher.ncsoft.com/192.168.0.0
address=/lineage2.patcher.gtm.ncsoft.com/192.168.0.0
address=/lineage2.patcher.ncsoft.com.cdngc.net/192.168.0.0
address=/live.patcher.bladeandsoul.com/192.168.0.0
address=/live.patcher.bladeandsoul.com.cdngc.net/192.168.0.0
address=/aion.patcher.ncsoft.com/192.168.0.0
address=/aion.patcher.gtm.ncsoft.com/192.168.0.0
address=/aion.patcher.ncsoft.com.cdngc.net/192.168.0.0
address=/wildstar.patcher.ncsoft.com/192.168.0.0
address=/wildstar.patcher.gtm.ncsoft.com/192.168.0.0
address=/wildstar.patcher.ncsoft.com.cdngc.net/192.168.0.0
```

## lancache-enmasse
```
address=/patch.tera.enmasse-game.com/192.168.0.0
address=/patch.zmr.enmasse-game.com/192.168.0.0
address=/patch.tera.enmasse-game.com.edgesuite.net/192.168.0.0
address=/patch.zmr.enmasse-game.com.edgesuite.net/192.168.0.0
```

## lancache-smitela
```
address=/cdn.juegoslevelup.com/192.168.0.0
```

## lancache-turbine
```
address=/download.ic.akamai.turbine.com/192.168.0.0
address=/launcher.infinitecrisis.com/192.168.0.0
```

## lancache-uplay
```
address=/uplaypc-s-ubisoft.cdn.ubi.com/192.168.0.0
address=/uplaypc-s-ubisoft.edgesuite.net/192.168.0.0
```

## lancache-gog
```
address=/cdn.gog.com/192.168.0.0
address=/wpc.11df.deltacdn.net/192.168.0.0
address=/11df-eu-lb.wpc.edgecastcdn.net/192.168.0.0
address=/11df-eu-lb.apr-11df.edgecastdns.net/192.168.0.0
```
