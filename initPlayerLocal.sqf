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

_player forceAddUniform ""; // FIXME
_player addVest "rhsgref_alice_webbing";
_player addBackpack "rhsgref_hidf_alicepack";
_player addGoggles ""; // FIXME
_player addItem "ItemRadio";
_player assignItem "ItemRadio";
_player addItem "ItemWatch";
_player assignItem "ItemWatch";
_player addItem "ItemMap";
_player assignItem "ItemMap";
_player addItem "ItemCompass";
_player assignItem "ItemCompass";
_player addHeadgear "rhs_beanie_green";


enableTeamSwitch false;

setViewDistance 9000;
setTerrainGrid 6.25;
setObjectViewDistance [4000,800];
setDetailMapBlendPars [50, 150];


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
