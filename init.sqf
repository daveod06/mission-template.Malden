private ["_useRevive"];
private ["_volume", "_dynamicWeather", "_isJipPlayer"];
private ["_showIntro", "_showPlayerMapAndCompass", "_fog", "_playerIsImmortal", "_playersEnteredWorld"];

diag_log format["init run for %1", name player];

_isJipPlayer = false;
if (!isServer && isNull player) then
{
    _isJipPlayer = true;
};

call compile preprocessFileLineNumbers "config.sqf";

//enableSaving [true, true];
enableSaving [ false, false ]; // Saving disabled without autosave.

setViewDistance 9000;
setTerrainGrid 6.25;
setObjectViewDistance [4000,800];
setDetailMapBlendPars [50, 150];

// Enable/Disbale animals, flies, and bugs -- false turns them off
enableEnvironment true; 

