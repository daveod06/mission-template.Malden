params ["_player", "_didJIP"];

diag_log format["initPlayerServer run for %1", name _player];

if(name _player == "HC1") then 
{
    ["HC present. Offloading AI."] spawn a3e_fnc_debugmsg;
    A3E_HC_ID = owner _player;
    if(A3E_HC_ID==0) exitwith {
         ["Getting HC1 ID failed!"] spawn a3e_fnc_debugmsg;
    };
}
/*
elif (name _player == "HC2") then 
{
    ["HC present. Offloading AI."] spawn a3e_fnc_debugmsg;
    A3E_HC_ID = owner _player;
    if(A3E_HC_ID==0) exitwith {
         ["Getting HC2 ID failed!"] spawn a3e_fnc_debugmsg;
    };
}
elif (name _player == "HC3") then 
{
    ["HC present. Offloading AI."] spawn a3e_fnc_debugmsg;
    A3E_HC_ID = owner _player;
    if(A3E_HC_ID==0) exitwith {
         ["Getting HC3 ID failed!"] spawn a3e_fnc_debugmsg;
    };
}
*/
else 
{
	
	//The following is outdates. We are now using "allplayers". But this might be referenced somewhere
	if(isNil("A3E_Players")) then {
		A3E_Players = [];
	};
    A3E_Players = A3E_Players + [_player];
    publicVariable "A3E_Players";

	_player setvariable["A3E_PlayerInitializedServer",true,true];
};
