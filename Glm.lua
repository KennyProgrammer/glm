--
-- Main Premake5 file for building Glm project.
-- Copyright (c) 2020-2023 by Danil (Kenny) Dukhovenko, All rights reserved.
-- 
-- Requirement:
--  - ForceEngine.lua
-- 
-- NOTE: Current latest release of Glm is 0.9.8 from 2020 at 2023, so dont upgrade to new
-- version until stable release or you run in to errors with templates.
--

-- Glm C++ Project
project "Glm"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++11"
	staticruntime "on"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Lib")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Obj")

	files {
		-- NOTE: Glm is header only library so you cannot go around this, only can if you build it with one project,
		-- in other cases like in my, it was broke Yaml tempalte instantiation because glm already builds to library
		-- and when i include glm in Force h/cpp files it basically not define this types.
		--
		"include/glm/**.hpp",
        "include/glm/**.h",
		"include/**.inl"
		--"src/**.cpp"
	}

	includedirs {
		"include"
	}

	filter "system:windows" 
		systemversion "latest"

	filter "configurations:Debug" 
		runtime "Debug"
		symbols "on"

	filter "configurations:Release" 
		runtime  "Release"
		optimize "on"