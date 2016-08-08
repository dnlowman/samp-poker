![](http://i.imgur.com/00Ct4t8.png)

![](https://img.shields.io/badge/License-Apache%202.0-brightgreen.svg)

# SA-MP Poker
SA-MP Poker is a complete Texas Hold 'em Poker system for the San Andreas Multiplayer modification Grand Theft Auto: San Andreas. The system is build specifically for Los Santos Roleplay (https://ls-rp.com).

## Languages Used
- PAWN - Game Scripting
- C++ - Hand Evaluator

## Folder Structure
The system is completely modular and build to be plug-and-play, all SA-MP callbacks are hooked using the ALS 7 hook making the system easy to setup and to also remove.

* 3DTextLabels
  + Everything related to the creation and managing of state of 3DTextLabels.
- Background
  + Everything related to the creation and deletion of background textdraws. (These are shared between all games)
- Blinds
  + Everything related to the management of textdraws and state of blinds.
- Bots
  + Everything related to the management of using bots, they're really awesome to debug with!
- Cards
  + Management of the global cards and initialisation of the main card array used for the table and players.
- Game
  + Everything to do with the state of the game, the majority of the game logic sits here.
- Menu
  + Everything to do with the menu the player interacts with.
- Player
  + Everything to do with the state of the player.
- PlayerCard
  + Everything to do with the public facing cards the player holds. (Global textdraws)
- PlayerChips
- PlayerPrivateCard
- PlayerReady
- PlayerStatus
- Pot
- TableCards
- TableManager
- TextDraws
