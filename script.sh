{
	"log": {
		"access": "/var/log/v2ray/access.log",
		"error": "/var/log/v2ray/error.log",
		"loglevel": "warning"
	},
	"inbounds": [{
		"port": xxxxx,
		"protocol": "vmess",
		"settings": {
			"clients": [{
				"id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
				"level": 1,
				"alterId": xxx
			}]
		},
		"streamSettings": {
			"network": "ws"
		},
		"sniffing": {
			"enabled": true,
			"destOverride": [
				"http",
				"tls"
			]
		}
	}],
	"outbounds": [{
			"protocol": "freedom",
			"settings": {
				"domainStrategy": "UseIP"
			},
			"tag": "direct"
		},
		{
			"protocol": "blackhole",
			"settings": {},
			"tag": "blocked"
		},
		{
			"protocol": "mtproto",
			"settings": {},
			"tag": "tg-out"
		}
	],
	"dns": {
		"servers": [
		    {
                "address": "xxxx",    
                "port": 53,
                "domains": [
                    "domain:netflix.com",
                    "domain:netflix.net",
                    "domain:nflximg.net",
                    "domain:nflxvideo.net",
                    "domain:nflxso.net",
                    "domain:nflxext.com",
                    "domain:ext-twitch.tv",
                    "domain:jtvnw.net",
                    "domain:live-video.net",
                    "domain:ttvnw.net",
                    "domain:twitch.tv",
                    "domain:twitchcdn.net",
                    "domain:twitchsvc.net"
                ]
            },
			"https+local://cloudflare-dns.com/dns-query",
			"1.1.1.1",
			"1.0.0.1",
			"8.8.8.8",
			"8.8.4.4",
			"localhost"
		]
	},
	"routing": {
		"domainStrategy": "IPOnDemand",
		"rules": [{
				"type": "field",
				"ip": [
					"10.0.0.0/8",
					"127.0.0.0/8",
					"169.254.0.0/16",
					"172.16.0.0/12",
					"192.168.0.0/16"
				],
				"outboundTag": "blocked"
			},
			{
				"type": "field",
				"inboundTag": ["tg-in"],
				"outboundTag": "tg-out"
			}
		]
	},
	"transport": {
		"kcpSettings": {
			"uplinkCapacity": 100,
			"downlinkCapacity": 100,
			"congestion": true
		}
	}
}
