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

setTerrainGrid (Param_Grass*3.125);
setViewDistance (Param_ViewDistance);
setObjectViewDistance [Param_ObjectViewDistance,Param_ObjectViewDistance*0.05];
setDetailMapBlendPars [Param_DetailBlend,Param_DetailBlend*2.5];

// Enable/Disbale animals, flies, and bugs -- false turns them off
enableEnvironment true; 

