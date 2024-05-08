project "GLFW"
    location "Wally/vendor/GLFW"
    kind "StaticLib"
    language "C"

    -- do these go to the 'master' directory or just the directory with GLFW?
    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin/" .. outputdir .. "/obj/%{prj.name}")

    files
    {

    }

    filter "system:windows"
        staticruntime "off"
        systemversion "latest"

        -- figure out macros that need to be defined for generating static library on windows
        -- _WIN32 is involved somewhere...

        -- what configuration settings does GLFW want to compile??
        -- remember: the configuration is defined by the class, but project-specific macros are not
        -- there probably will not be a difference between debug/release/distribution for GLFW but idk
        -- i don't know what GLFW would like for linux or macios systems