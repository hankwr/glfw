project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "off"
    warnings "off"

    -- do these go to the 'master' directory or just the directory with GLFW?
    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin/" .. outputdir .. "/obj/%{prj.name}")

    files
    {
        "include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",

        "src/null_init.c",
		"src/null_joystick.c",
		"src/null_monitor.c",
		"src/null_window.c",

        "src/platform.c",
		"src/vulkan.c",
		"src/window.c"
    }

    filter "system:windows"
        systemversion "latest"

        files
        {
            "src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_WIN32"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
    
    filter {"configurations:Release", "configurations:Distribution"}
        runtime "Release"
        optimize "Speed"
    
    filter "configurations:Distribution"
        symbols "Off"
        -- figure out macros that need to be defined for generating static library on windows
        -- _WIN32 is involved somewhere...

        -- what configuration settings does GLFW want to compile??
        -- remember: the configuration is defined by the class, but project-specific macros are not
        -- there probably will not be a difference between debug/release/distribution for GLFW but idk
        -- i don't know what GLFW would like for linux or macios systems