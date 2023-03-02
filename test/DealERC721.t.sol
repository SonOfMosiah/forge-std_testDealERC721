// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {IERC721} from "forge-std/interfaces/IERC721.sol";

contract DealERC721Test is Test {
    uint256 mainnetFork;
    string MAINNET_RPC_URL = vm.envString("MAINNET_RPC_URL");

    IERC721 nonfungiblePositionManager = IERC721(0xC36442b4a4522E871399CD717aBDD847Ab11FE88); // Uniswap V3 NonfungiblePositionManager

    function setUp() public {
        mainnetFork = vm.createFork(MAINNET_RPC_URL);
        vm.selectFork(mainnetFork);
    }

    function testDealERC721() public {
        dealERC721(address(nonfungiblePositionManager), address(this), 1);
        assertEq(nonfungiblePositionManager.balanceOf(address(this)), 1);
    }
}
