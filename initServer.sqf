//if (!isServer or hasInterface) exitWith {};

// set up zeus for 4 players
missionCurators = [];
CuratorLogicGroup = creategroup sideLogic;

[] spawn
{
    while {true} do 
    {
        {
            _x addCuratorEditableObjects [allUnits, true];
            _x addCuratorEditableObjects [vehicles, true];
            sleep 60;
        } forEach allCurators; 
    };
};

//# Add Spawning for Zeus modules and HCs

