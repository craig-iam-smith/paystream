// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract repayment is Ownable {

    struct pdata {
        uint40 PrincipalAmount;  // total amount of principal  to be paid
        uint40 NumberOfPayments; // number of payments to pay P&I
        bool penaltySituation;   // denotes whether penalty payments have been triggered
        bool defaultSituation;   // denotes whether payment stream is in default
        uint40 Frequency;        // how often payments are due
        uint40 Currency;         // base currency of stream
    }
    
    pdata Details;


//    string _baseTokenURI;
//    uint256 public _price = 0.01 ether;
    bool public _paused;
//    uint40 public maxTokenIds = 1000;
//    uint40 public tokenIds;

    bool public SaleStarted;
    bool public SaleEnded;

    modifier onlyWhenNotPaused {
        require (!_paused, "Contract currently paused");
        _;
    }

    constructor (uint40 amount,  // total amount of principal  to be paid
        uint40 payments,        // number of payments to pay P&I
        uint40 frequency,        // how often payments are due
        uint40 currency) {

        Details.PrincipalAmount = amount;
        Details.NumberOfPayments = payments;
        Details.Frequency = frequency;
        Details.Currency = currency;
        Details.penaltySituation = false;
        Details.defaultSituation = false;
    }

    function startSale() public onlyOwner {
        SaleStarted =  true;
    }

    function endSale() public onlyOwner {
        SaleEnded = true;
    }

    function allConsumed() private {
        SaleEnded = true;
    }

    function setPaused(bool val) public onlyOwner {
        _paused = val;
    }
    function withdraw() public onlyOwner {
        address _owner = owner();
        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require (sent, "Failed to send Ether");
    }

    receive() external payable {}

    fallback() external payable {}
}