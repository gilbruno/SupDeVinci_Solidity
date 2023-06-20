// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { PriceConverter } from "./PriceConverter.sol";

// Use this import in Remix
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
// Use this import in Truffle
//import {AggregatorV3Interface} from "./AggregatorV3Interface.sol";

/**
 * If we want a minimum amount of USD, we must use ORACLE.
 * The most popular Oracle is Chainlink
 * You can try on Remix by sending 100 WEI and the result will fail due to not minimum amount of 5 USD required
 * @title 
 * @author 
 * @notice 
 */
contract FundMe {
  using PriceConverter for uint256;

  address public owner;

  // The Minimum price in USD must be converted with 18 decimals as we will use 18 decimals for every price amount
  uint256 public constant minUSD = 5 * 1e18;

  address[] funders;
  mapping(address funders => uint256 amountFunded) public addressToAmountFunded;

  constructor() {
    owner = msg.sender;
  }

  function fund() public payable {
    require(msg.value.getConversionRate() >= minUSD, "Your minimum amount must be at least 5 USD");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
  }


  function withdraw() public onlyOwner {
    
    for (uint256 i = 0; i < funders.length; i++) {
      address funder = funders[i];
      addressToAmountFunded[funder] = 0;
    }

    //Reset the array of funders
    funders = new address[](0);

    //3 ways to withdrawbalance and send to the owner of the contract :
    // 1 - transfer : Automatic Revert if the transfer failed. This method is capped by 2300 gas so it fails above 
    //payable(msg.sender).transfer(address(this).balance);


    // 2 - send : Returns a bool so we have to handle revert with require. This method is capped by 2300 gas so it fails above 
    // bool sendSuccess = payable(msg.sender).send(address(this).balance);
    // require(sendSuccess, "Send Failed");

    // 3 - call : It's the recommended method to use. Not capped.AggregatorV3Interface
    (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call Failed");
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can wihdraw");
    _;
  }
  
}
