private ["_useRevive"];
private ["_volume", "_dynamicWeather", "_isJipPlayer"];
private ["_showIntro", "_showPlayerMapAndCompass", "_fog", "_playerIsImmortal", "_playersEnteredWorld"];

diag_log format["init run for %1", name player];

_isJipPlayer = false;
if (!isServer && isNull player) then
{
    _isJipPlayer = true;
};

//call compile preprocessFileLineNumbers "config.sqf"; // FIXME

//enableSaving [true, true];
enableSaving [ false, false ]; // Saving disabled without autosave.

setTerrainGrid ( ("Param_Grass" call BIS_fnc_getParamValue)*3.125 );
setViewDistance ("Param_ViewDistance" call BIS_fnc_getParamValue);
setObjectViewDistance [("Param_ObjectViewDistance" call BIS_fnc_getParamValue),("Param_ObjectViewDistance" call BIS_fnc_getParamValue)*0.05];
setDetailMapBlendPars [("Param_DetailBlend" call BIS_fnc_getParamValue),("Param_DetailBlend" call BIS_fnc_getParamValue)*2.5];

// Enable/Disbale animals, flies, and bugs -- false turns them off
enableEnvironment true; 

setDate [1970, 6, 20, 16, 45];

addMissionEventHandler ["entityKilled", 
{
    _victim = _this select 0;
    if (local _victim) then
    {
        [_victim, [missionNamespace, name _victim]] call BIS_fnc_saveInventory; 
        _victim setVariable ["MGI_ammo1",_victim ammo (primaryWeapon _victim)];
        _victim setVariable ["MGI_ammo2",_victim ammo (handgunWeapon _victim)];
        _victim setVariable ["MGI_ammo3",_victim ammo (secondaryWeapon _victim)];
        _victim setVariable ["MGI_mags",magazinesAmmoFull _victim];
        _victim setVariable ["MGI_weapon",currentWeapon _victim];
    };
}];

addMissionEventHandler ["entityRespawned",
{
    _unit = _this select 0;
    _corpse = _this select 1;
    if (local _unit) then
    {
        [_unit, [missionNamespace, name _unit]] call BIS_fnc_loadInventory;
        {_unit removeMagazine _x} forEach magazines _unit;
        _unit setAmmo [primaryWeapon _unit, 0];
        _unit setAmmo [handGunWeapon _unit, 0];
        _unit setAmmo [secondaryWeapon _unit, 0];
        {
            if (((_unit getVariable "MGI_mags") select _foreachindex select 3) <= 0) then
            {
                _unit addMagazine [_x select 0,_x select 1]
            }
        } forEach (_unit getVariable "MGI_mags");
        _unit setAmmo [primaryWeapon _unit,_unit getVariable "MGI_ammo1"];
        _unit setAmmo [handGunWeapon _unit,_unit getVariable  "MGI_ammo2"];
        _unit setAmmo [secondaryWeapon _unit,_unit getVariable "MGI_ammo3"];
        _unit selectWeapon (_unit getVariable "MGI_weapon");
        removeAllWeapons _corpse;
        //removeBackpackGlobal _corpse;
        //removeVest _corpse;
        removeAllAssignedItems _corpse;
        removeAllItems _corpse;
        //removeGoggles _corpse;
        //removeHeadgear _corpse;
        {
            deleteVehicle _x
        } forEach nearestObjects [(getPosATL _corpse),["WeaponHolderSimulated","groundWeaponHolder"],5];
    };
}];
