-----------------------------------------------------------------------------------------
--
-- Faiyaz Hossain
-- 2018-04-23
-- 7-04
-----------------------------------------------------------------------------------------

-- Gravity

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )
physics.setDrawMode( "hybrid" )   -- Shows collision engine outlines only


local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )

leftWall.alpha = 0.0
physics.addBody( leftWall, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )


local theGround = display.newImage( "./assets/sprites/land.png" )
theGround.x = display.contentCenterX
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local theGround2 = display.newImage( "./assets/sprites/land.png" )
theGround2.x = 2000
theGround2.y = 1000
theGround2.id = "the ground"
physics.addBody( theGround2, 'static', {
    friction = 0.5, 
    bounce = 0.3 
    } )



local myGuy = display.newImage( "./assets/sprites/Idle.png" )
myGuy.x = display.contentCenterX
myGuy.y = display.contentCenterY
myGuy.id = "the guy"
physics.addBody( myGuy, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )
myGuy.isFixedRotation = true

local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 150
dPad.alpha = 0.50
dPad.id = "d-pad"

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 260
upArrow.id = "up arrow"

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 40
downArrow.id = "down arrow"

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 150
leftArrow.id = "left arrow"

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 150
rightArrow.id = "right arrow"
 
function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up

        myGuy:setLinearVelocity( 0, -750 )

    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up

        myGuy:setLinearVelocity( 0, 650 )

    end
    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( myGuy, { 
            x = -50, -- move 0 in the x direction 
            y = 0, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( myGuy, { 
            x = 50, -- move 0 in the x direction 
            y = 0, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function checkCharacterPosition( event )
    -- check every frame to see if character has fallen
    if 
    	myGuy.y > display.contentHeight + 500 then
        myGuy.x = display.contentCenterX - 200
        myGuy.y = display.contentCenterY
    end
end


Runtime:addEventListener( "enterFrame", checkCharacterPosition )
upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )
