// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Script } from "../../../lib/forge-std/src/Script.sol";
import { IVault } from "../src/interfaces/IVault.sol";
import {console} from "forge-std/console.sol";
import { IERC20 } from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract DataCollection is Script {
    function run() public {
        uint256 deployPvtKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployPvtKey);
        address vaultAdd = vm.envAddress("VAULT");
        IVault vault = IVault(vaultAdd);
        address owner = vault.owner();
        uint totalShares = vault.totalShares();

        address tokenAdd = vm.envAddress("TOKEN");
        IERC20 token = IERC20(tokenAdd);

        console.log("Total Shares of the vault:", totalShares);
        console.log("User BAL:", token.balanceOf(0x34788137367a14f2C4D253F9a6653A93adf2D234));
        console.log("Vault BAL:", token.balanceOf(vaultAdd));
        console.log("Owner:", owner);
        vm.stopBroadcast();
    }
}
