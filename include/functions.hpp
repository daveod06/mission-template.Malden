class CfgFunctions
{
	class DJORevive
	{
		class Revive
		{
			#include "\functions\revive\revive.hpp"
		};
	};
    class ToothFunctions
	{
		class Tooth
		{
			#include "\functions\Tooth\Functions.hpp"
			class preinit {
                preInit = 1; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                postInit = 0; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                recompile = 0; // 1 to recompile the function upon mission start
            };
            class postinit {
                preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                recompile = 0; // 1 to recompile the function upon mission start
            };
        };
	};
};
