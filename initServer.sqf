if (!isServer or hasInterface) exitWith {};

//Saber_DEBUG = true;

setViewDistance 9000;
setTerrainGrid 6.25;
setObjectViewDistance [4000,800];
setDetailMapBlendPars [50, 150];

// set up zeus for 4 players
missionCurators = [];
CuratorLogicGroup = creategroup sideLogic;

