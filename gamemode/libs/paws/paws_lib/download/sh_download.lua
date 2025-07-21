/*

Download for Paws Lib.

Made by Kot from '🐾 Aw... Paws!'

*/

local MODULE = PAW_MODULE('lib')

function MODULE:Download(filename, url, callback, errorCallback)
	local path = 'paws/downloads/'..filename
	local dPath = 'data/'..path

	if(file.Exists(path, 'DATA')) then return callback(dPath) end
	if(!file.IsDir(string.GetPathFromFilename(path), 'DATA')) then file.CreateDir(string.GetPathFromFilename(path)) end

	errorCallback = errorCallback || function(reason)
		MsgC(Color(255, 0, 0), '[Aw... Paws!][Lib] Download failed. Reason: ', reason, ', url: ', url)
	end

	http.Fetch(url, function(body, size, headers, code)
		if(code != 200) then return errorCallback(code) end
		file.Write(path, body)
		callback(dPath)
	end, errorCallback)
end