// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//#include "./pnft.sol";

//    function mint() public payable onlyWhenNotPaused {
//        require(SaleStarted && !SaleEnded, "Tokens not available");
//        require(tokenIds < maxTokenIds, "Exceed maximum Crypto Devs supply");
//        require(msg.value >= _price, "Ether sent is not adequate");
//        tokenIds += 1;
//        _safeMint(msg.sender, tokenIds);
//    }

//    function _baseURI() internal view virtual override returns (string memory) {
//        return _baseTokenURI;
//    }
