-- premake5.lua
local RAYLIB_DIR = "3rdparty/raylib"

workspace "FishFlockingSimulation"
    configurations { "Debug", "Release" }
    platforms { "win64", "linux", "arm64_linux" }
    targetdir "bin/%{cfg.platform}/%{cfg.buildcfg}"
    location "build/%{_ACTION}"
    startproject "FlockingApp"
    filter "platforms:win64"
        system "windows"
        architecture "x86_64"
	filter "platforms:linux"
        system "linux"
        architecture "x86_64"
    filter "platforms:arm64_linux"
        system "linux"
        architecture "ARM64"
		toolset "gcc"
		gccprefix "aarch64-linux-gnu-"
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "Full"
	
project "FlockingApp"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    files { 
		"include/**.h", 
		"src/**.cpp" 
	}
    includedirs {
        "include/",
        path.join(RAYLIB_DIR, "include")
    }
    links { "raylib" }
    
project "raylib"
    kind "StaticLib"
    language "C"
    exceptionhandling "Off"
	rtti "Off"
	defines "__STDC_FORMAT_MACROS"
	files {
		path.join(BGFX_DIR, "include/bgfx/**.h"),
		path.join(BGFX_DIR, "src/*.cpp"),
		path.join(BGFX_DIR, "src/*.h"),
	}
	excludes {
		path.join(BGFX_DIR, "src/amalgamated.cpp"),
	}
	includedirs {
		path.join(BX_DIR, "include"),
		path.join(BIMG_DIR, "include"),
		path.join(BGFX_DIR, "include"),
		path.join(BGFX_DIR, "3rdparty"),
		path.join(BGFX_DIR, "3rdparty/dxsdk/include"),
		path.join(BGFX_DIR, "3rdparty/khronos")
	}
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
