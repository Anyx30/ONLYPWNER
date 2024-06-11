// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Script } from "lib/forge-std/src/Script.sol";
import { IVault } from "../src/interfaces/IVault.sol";

contract Solved is Script {

    function run() public {
        uint256 deployPvtKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployPvtKey);
        address vaultAdd = vm.envAddress("VAULT");
        IVault vault = IVault(vaultAdd);
        vault.withdraw(10 ether);
    }
}
