// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Use this import in Remix
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
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

  // The Minimum price in USD must be converted with 18 decimals as we will use 18 decimals for every price amount
  uint256 public constant minUSD = 5 * 1e18;

  address[] funders;
  mapping(address funders => uint256 amountFunded) public addressToAmountFunded;

  function fund() public payable {
    require(getConversionRate(msg.value) >= minUSD, "Your minimum amount must be at least 5 USD");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
  }

  /// @notice Explain to an end user what this does
  function getPrice() public view returns (uint256) {
    /**
     * We need : 
     *    - the address of the Price Feed Smart contract. See it on https://docs.chain.link/data-feeds/price-feeds/addresses 
     *        and search the Sepolia Network
     *    - the ABI ==> through the AggregatorV3Interface
     */

      AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
      (, int256 price, , , ) = priceFeed.latestRoundData();
      //AggregatorV3Interface returns price of ETH in USD with 8 decimals
      //ETH price has 18 decimals when we use 'msg.value'
      //So the difference is 10 decimals. We have to multiply the result by 10 decimals so.
      return uint256(price*1e10);
  } 

  /// @notice 
  /// @dev 
  /// @return ETH Amount In Usd with 18 decimals
  function getConversionRate(uint256 ethAmount) public view returns(uint256) {
    uint256 ethPrice = getPrice();
    //'ethAmount' and 'ethPrice' have each 18 decimals so we have to divided by 1e18
    uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
    return ethAmountInUsd;
  }

  function getVersion() public view returns(uint256) {
    return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
  }
}
