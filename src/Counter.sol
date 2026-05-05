// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

enum State {
    PENGUIN,
    CAT
}

contract MoodNFT is ERC721 {
    uint256 public tokenId;
    mapping(uint256 tokenID_ => string tokenURI_) idToURI;

    constructor(string memory _name_, string memory _symbol_) ERC721(_name_, _symbol_) {
        tokenId = 0;
    }

    function mintToken(State s, string memory URI) public {
        if (s == State.PENGUIN) {
            idToURI[tokenId] = URI;
        } else if (s == State.CAT) {
            idToURI[tokenId] = URI;
        } else {
            revert("Not a valid state");
        }
        _mint(msg.sender, tokenId);
        tokenId++;
    }

    function _baseImageURI() internal pure returns (string memory) {
        return "data:image/svg+xml;base64,";
    }

    function getTokenURI(bytes memory svg) public view returns (string memory) {
        string memory json =
            Base64.encode(bytes(abi.encodePacked('{"name": "', name(), '", "image": "', getImageURI(svg), '"')));

        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function createImageURI(bytes memory svg) internal pure returns (string memory) {
        return Base64.encode((bytes(svg)));
    }

    function getImageURI(bytes memory svg) internal pure returns (string memory) {
        return string(abi.encodePacked(_baseImageURI(), createImageURI(svg)));
    }
}
