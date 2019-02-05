params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
_player = _newUnit;

// stamina stuff
//_player setFatigue 0.0;
_player enableStamina false;
0 = [_player] spawn
{
	_player = _this select 0;
    while {alive _player} do
    {
        //_player setFatigue 0.0;
        _player enableStamina false;
        sleep 5.0;
    };
};

// reduce damage
_player removeAllEventHandlers "HandleDamage";
_player removeAllEventHandlers "Killed";
_player addEventHandler ["HandleDamage", DJORevive_fnc_HandleDamageCustom];

// Start saving player loadout periodically
[_player] spawn {
	_player = _this select 0;
	while {true} do {
		sleep 5;
		if (alive _player) then {
			_player setVariable ["respawnLoadout", getUnitLoadout _player]; 
		};
	};
};

