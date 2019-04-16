-- scaffold geniefile for sparsepp

sparsepp_script = path.getabsolute(path.getdirectory(_SCRIPT))
sparsepp_root = path.join(sparsepp_script, "sparsepp")

sparsepp_includedirs = {
	path.join(sparsepp_script, "config"),
	sparsepp_root,
}

sparsepp_libdirs = {}
sparsepp_links = {}
sparsepp_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { sparsepp_includedirs }
	end,

	_add_defines = function()
		defines { sparsepp_defines }
	end,

	_add_libdirs = function()
		libdirs { sparsepp_libdirs }
	end,

	_add_external_links = function()
		links { sparsepp_links }
	end,

	_add_self_links = function()
		links { "sparsepp" }
	end,

	_create_projects = function()

project "sparsepp"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		sparsepp_includedirs,
	}

	defines {}

	files {
		path.join(sparsepp_script, "config", "**.h"),
		path.join(sparsepp_root, "**.h"),
		path.join(sparsepp_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
