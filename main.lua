-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: March 2
--
-- This program calculates the cost of a pizza depending on its size and toppings.
-- 
-----------------------------------------------------------------------------------------

-- Background and title
display.setDefault('background', 0.6, 0, 0)
local myTitle = display.newText('Welcome to ICS20 Pizza!!!\n        Would you like...', 1024, 200, native.SystemFont, 100)

-- Size Pizza
local mySize = display.newText('Size (Large or Extra Large): ', 600, 400, native.SystemFont, 100)
local mySizeTextField = native.newTextField( 1360, 410, 400, 105)
mySizeTextField.id = 'Size text'

-- Number of Topings
local myToppings = display.newText('# of Toppings: ', 340, 600, native.SystemFont, 100)
local myToppingsTextField = native.newTextField(780, 610, 250, 105)
myToppingsTextField.id = 'Toppings box'

-- Initiation Button
local myButton = display.newImageRect('Assets/Sprites/Pizza-icon.png', 300, 300)
myButton.x = 1800
myButton.y = 530
myButton.id = 'On button' 

-- My Function
local function theTotalCost(event)
	-- Variables
	local costSize = mySizeTextField.text
	local costToppings = tonumber(myToppingsTextField.text)
	local subtotal
	local tax
	local total
	local result 
	-- Process
	if costToppings < 1 or costToppings > 4 then
		result = display.newText('Please input a valid amount of Toppings\nBetween 1 and 4', 1024, 900, native.SystemFont, 100) 
	elseif costSize ~= 'Large' and costSize ~= 'Extra Large' then
		result = display.newText('Please input a valid size Large or Extra Large', 1024, 900, native.SystemFont, 100)
	elseif costSize == 'Extra Large' and costToppings >= 1 then
		subtotal = 10.0 + (0.25+(costToppings*0.75))
		tax = math.floor(subtotal * 0.13)
		total = subtotal + tax
		result = display.newText('   Subtotal: $'..subtotal..'     Tax: $'..tax..'      Total: $'..total, 1020, 900, native.SystemFont, 100)
	elseif costSize == 'Large' and costToppings >= 1 then
		subtotal = 6.0 + (0.25+(costToppings*0.75))
		tax = math.floor(subtotal * 0.13)
		total = subtotal + tax
		result = display.newText('   Subtotal: $'..subtotal..'     Tax: $'..tax..'      Total: $'..total, 1015, 900, native.SystemFont, 100)
	end
	return true 
end

myButton: addEventListener('touch', theTotalCost)






