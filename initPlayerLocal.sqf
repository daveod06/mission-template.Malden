diag_log format["initPlayerLocal run for %1 (prewaituntil)", name player];
if (!hasInterface || isDedicated) exitWith {};
waituntil{!isNull(player)};
params ["_player", "_didJIP"];
//Clientside Stuff

diag_log format["initPlayerLocal run for %1", name _player];

// stamina stuff
_player setFatigue 0.0;
_player enableStamina false;
0 = [] spawn
{
    while {alive _player} do
    {
        _player setFatigue 0.0;
        _player enableStamina false;
        sleep 5.0;
    };
};

// reduce damage
_player removeAllEventHandlers "HandleDamage";
_player removeAllEventHandlers "Killed";
_player addEventHandler ["HandleDamage", DJORevive_fnc_HandleDamageCustom];

// Start saving player loadout periodically
[] spawn {
	while {true} do {
		sleep 5;
		if (alive _player) then {
			_player setVariable ["respawnLoadout", getUnitLoadout _player]; 
		};
	};
};

//BIS
_player unassignItem "ItemMap";
_player removeItem "ItemMap";
_player unassignItem "ItemCompass";
_player removeItem "ItemCompass";
_player unassignItem "itemGPS";
_player removeItem "itemGPS";
_player unassignItem "O_UavTerminal";
_player removeItem "O_UavTerminal";
_player unassignitem "B_UavTerminal"; 
_player removeitem "B_UavTerminal";
_player unassignitem "I_UavTerminal"; 
_player removeitem "I_UavTerminal";
_player unassignItem "NVGoggles";
_player removeItem "NVGoggles";
_player unassignItem "NVGoggles_OPFOR";
_player removeItem "NVGoggles_OPFOR";
_player unassignItem "NVGoggles_INDEP";
_player removeItem "NVGoggles_INDEP";
//RHS
_player unassignItem "rhsusf_ANPVS_14";
_player removeItem "rhsusf_ANPVS_14";
_player unassignItem "rhsusf_ANPVS_15";
_player removeItem "rhsusf_ANPVS_15";
_player unassignItem "rhs_1PN138";
_player removeItem "rhs_1PN138";
_player unassignItem "rhsusf_ANPVS_15";
_player removeItem "rhsusf_ANPVS_15";
//
_player unassignItem "A3_GPNVG18_REC_BLK_F";
_player removeItem "A3_GPNVG18_REC_BLK_F";
//BIS Apex
_player unassignItem "O_NVGoggles_hex_F";
_player removeItem "O_NVGoggles_hex_F";
_player unassignItem "O_NVGoggles_urb_F";
_player removeItem "O_NVGoggles_urb_F";
_player unassignItem "O_NVGoggles_ghex_F";
_player removeItem "O_NVGoggles_ghex_F";
_player unassignItem "NVGoggles_tna_F";
_player removeItem "NVGoggles_tna_F";
_player unassignItem "NVGogglesB_blk_F";
_player removeItem "NVGogglesB_blk_F";
_player unassignItem "NVGogglesB_grn_F";
_player removeItem "NVGogglesB_grn_F";
_player unassignItem "NVGogglesB_gry_F";
_player removeItem "NVGogglesB_gry_F";
//CUP
_player unassignItem "CUP_NVG_HMNVS";
_player removeItem "CUP_NVG_HMNVS";
_player unassignItem "CUP_NVG_PVS7";
_player removeItem "CUP_NVG_PVS7";
_player unassignItem "CUP_NVG_PVS14";
_player removeItem "CUP_NVG_PVS14";


removeAllWeapons _player;
removeAllItems _player;
removeUniform _player;
removeBackpack _player;
removeVest _player;
removeHeadgear _player;
removeGoggles _player;
if(hmd _player != "") then {
	private _hmd = hmd _player;
	_player unlinkItem _hmd;
};


if (Tooth_playerUniform != "") then
{
	player forceAddUniform Tooth_playerUniform;
};
if (Tooth_playerVest != "") then
{
	player addVest Tooth_playerVest;
};
if (Tooth_playerHeadgear != "") then
{
	player addHeadgear Tooth_playerHeadgear;
};
if (Tooth_playerGoggles != "") then
{
	player addGoggles Tooth_playerGoggles;
};
if (Tooth_playerBackpack != "") then
{
	player addBackpack Tooth_playerBackpack;
};

if (Tooth_playersHaveRadio) then
{
	player addItem "ItemRadio";
	player assignItem "ItemRadio";
};

if (Tooth_playersHaveWatch) then
{
	player addItem "ItemWatch";
	player assignItem "ItemWatch";
};

if (Tooth_playersHaveMap) then
{
	player addItem "ItemMap";
	player assignItem "ItemMap";
};

if (Tooth_playersHaveCompass) then
{
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
};

enableTeamSwitch false;

// Start saving player loadout periodically
[] spawn {
	while {true} do {
		sleep 5;
		if (alive _player) then {
			_player setVariable ["respawnLoadout", getUnitLoadout _player]; 
		};
	};
};

ZeusVariable = [_player]; //ie player
publicVariableServer "ZeusVariable";
