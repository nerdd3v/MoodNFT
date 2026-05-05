// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MoodNFT, State} from "../src/Counter.sol";

contract CounterScript is Script {
    MoodNFT public nft;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        nft = new MoodNFT("n3rdCoin", "N3");

        string memory d = vm.readFile("./images/penguin.svg");

        string memory ls = nft.getTokenURI(bytes(d));

        nft.mintToken(State.PENGUIN, ls);

        vm.stopBroadcast();
    }
}
