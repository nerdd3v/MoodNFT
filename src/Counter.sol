// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

enum State{
    HAPPY,
    SAD
}


contract MoodNFT is ERC721 {

    uint256 public tokenId;
    mapping(uint256 tokenID_ => string tokenURI_) idToURI;

    constructor(string memory _name_, string memory _symbol_) ERC721(_name_, _symbol_){
        tokenId = 0;
    }

    function mintToken(State s)public {
        if(s == State.HAPPY){
            idToURI[tokenId] = "s";
        }
    }

    function _baseImageURI()internal pure returns(string memory){
        return "data:image/svg+xml;base64,";
    }

    function getTokenURI(string memory svg)internal view returns(string memory){
        abi.encodePacked('{"name": "', name(), '", "image"');
    }

    function createImageURI(bytes memory svg)public pure returns (string memory){
        return Base64.encode((bytes(svg)));
    }

    function getImageURI(bytes memory svg)public pure returns(string memory){
        return string(abi.encodePacked(_baseImageURI(), createImageURI(svg)));
    }
}
