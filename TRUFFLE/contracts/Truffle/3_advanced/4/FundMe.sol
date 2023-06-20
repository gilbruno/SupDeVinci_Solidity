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

  // The Minimum price in USD must be converted with 18 decimals as we will use 18 decimals for every price amount
  uint256 public constant minUSD = 5 * 1e18;

  address[] funders;
  mapping(address funders => uint256 amountFunded) public addressToAmountFunded;

  function fund() public payable {
    require(msg.value.getConversionRate() >= minUSD, "Your minimum amount must be at least 5 USD");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
  }

  
}
