// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import {AggregatorV3Interface} from "./AggregatorV3Interface.sol";

/**
 * If we want a minimum amount of USD, we must use ORACLE
 * @title 
 * @author 
 * @notice 
 */
contract FundMe {

  uint256 public constant minUSD = 5;

  function send() public payable {
    require(msg.value >= minUSD, "Your minimum amount must be at least 5 USD");
  }

  function getPrice() public view returns (uint256) {
    /**
     * We need : 
     *    - the address of the Price Feed Smart contract. See it on https://docs.chain.link/data-feeds/price-feeds/addresses 
     *        and search the Sepolia Network
     *    - the ABI ==> through the AggregatorV3Interface
     */

      AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
      (, int256 price, , , ) = priceFeed.latestRoundData();
      return uint256(price);
  } 

  function getConversionRate() public {

  }

}
