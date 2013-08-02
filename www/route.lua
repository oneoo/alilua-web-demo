file = 'index.lua'
if headers.uri ~= '/' then file = headers.uri end

local fexists = file_exists(file)

if not fexists then
	-- try stat file.lua
	fexists = file_exists(file .. '.lua')
	if fexists then
		file = file .. '.lua'
	end
end

if fexists then
	if file:find('.css') or file:find('.js') or file:find('font') or file:find('.ico') or file:find('images') then
		header('HTTP/1.1 200 OK')
		header('Cache-Control: max-age=864000')
		sendfile(file)
	else
		header({'Expires:Thu, 19 Nov 1981 08:52:00 GMT',
				'Pragma:no-cache'})
		
		dofile(file)
	end
else
	header('HTTP/1.1 404 Not Found')
	die('File Not Found!')
end

die()