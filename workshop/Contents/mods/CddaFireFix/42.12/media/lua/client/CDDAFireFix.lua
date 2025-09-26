require "AReallyCDDAy.lua"

CDDA.OnGameStart = function()
	local pl = getPlayer();

	if pl:getHoursSurvived() > 0 then return end

	local square = pl:getCurrentSquare();
	print(square)
	if not square then return end
	local room = square:getRoom();
	print(room)
	if not room then return end
	local building = room:getBuilding();
	print(building);
	if not building then return end

	local i = 0
	while i <= 4 do
		local tile = building:getRandomRoom():getRandomSquare();
		if tile:getRoom() == room then
			-- nothing
		else
			i = i + 1;
			print(tile);
			IsoFireManager.explode(tile:getCell(), tile, 100000);
		end
	end
end
