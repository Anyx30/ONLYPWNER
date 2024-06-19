pragma solidity ^0.8.20;

import {Vault} from "../src/Vault.sol";
import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import {console} from "forge-std/console.sol";
import {Script} from "forge-std/Script.sol";

contract IsSolved is Script {
    function run() external {
        IERC20 token = IERC20(vm.envAddress("TOKEN"));
        Vault vault = Vault(vm.envAddress("VAULT"));
        address scripter = vm.envAddress("SCRIPTER");

        if (token.balanceOf(address(vault)) < 1 ether) {
            console.log("is-solved:false");
            return;
        }

        uint256 sharesBefore = vault.shares(scripter);
        console.log("Shares of Scripter before:",sharesBefore);
        vm.startPrank(scripter);
        token.approve(address(vault), 10 ** 17);
        vault.deposit(10 ** 17);

        uint256 sharesAfter = vault.shares(scripter);
        console.log("Shares of Scripter:", scripter, sharesAfter);
         if (sharesAfter == 0) {
             console.log("is-solved:true");
         } else {
             console.log("is-solved:false");
         }
    }
}
