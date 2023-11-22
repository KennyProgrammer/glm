--
-- Main Premake5 file for building Glm project.
-- Copyright (c) 2020-2023 by Danil (Kenny) Dukhovenko, All rights reserved.
-- 
-- Requirement:
--  - ForceEngine.lua
--

-- Glm C++ Project
project "Glm"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++11"
	staticruntime "on"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/lib")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/obj")

	files {
		"include/glm/**.hpp",
        "include/glm/**.h",
		"src/**.cpp"
	}

	includedirs {
		"include"
	}

	filter "system:windows" {
		systemversion "latest"
	}

	filter "configurations:Debug" {
		runtime "Debug",
		symbols "on"
	}

	filter "configurations:Release" {
		runtime  "Release",
		optimize "on"
	}