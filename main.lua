local cardIO = require "plugin.cardIO"
cardIO.init()
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
local logo = display.newImage( "cardio.png" )
logo.x, logo.y = display.contentCenterX, 50
local logoBg = display.newRect( logo.x, logo.y, logo.width, logo.height  )
logo:toFront( )
bg:setFillColor( .4,1,.4 )
local widget = require("widget")
local show
show = widget.newButton( {
	label = "show",
	id = "show",
	onEvent = function ( e )
		if (e.phase == "began") then
			show.alpha = .3
		else
			show.alpha = 1
			cardIO.show(function(ev)
		    	local json = require("json")
		    	print("-------")
		    	print(json.encode(ev))
		    	print("-------")
		    end, {cvv = true})
		end
	end
} )
show.x, show.y = display.contentCenterX, display.contentCenterY

