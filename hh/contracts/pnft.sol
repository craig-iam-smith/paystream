// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract repayment is ERC721Enumerable, Ownable {

    string _baseTokenURI;

    struct pdata {
        uint PrincipalAmount;  // total amount of principal  to be paid
        uint NumberOfPayments; // number of payments to pay P&I
        bool penaltySituation;   // denotes whether penalty payments have been triggered
        bool defaultSituation;   // denotes whether payment stream is in default
        uint Frequency;        // how often payments are due
        uint Currency;         // base currency of stream
    }
    
    pdata Details;


    bool public _paused;

    bool public SaleStarted;
    bool public SaleEnded;


    modifier onlyWhenNotPaused {
        require (!_paused, "Contract currently paused");
        _;
    }

    constructor (uint amount,  // total amount of principal  to be paid
        uint payments,        // number of payments to pay P&I
        uint frequency,        // how often payments are due
        uint currency) ERC721("PayNFT", "DIST") {

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