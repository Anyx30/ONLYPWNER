// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import { Script } from "lib/forge-std/src/Script.sol";
import { ITutorial } from "../src/interfaces/ITutorial.sol";

contract Solve is Script {

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        address tutorialAdd = vm.envAddress("TUTORIAL");
        ITutorial tutorial = ITutorial(tutorialAdd);
        tutorial.callMe();
    }

}
