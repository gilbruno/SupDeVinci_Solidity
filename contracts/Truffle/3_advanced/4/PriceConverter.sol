// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    /// @notice Explain to an end user what this does
  function getPrice() internal view returns (uint256) {
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
  function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
    uint256 ethPrice = getPrice();
    //'ethAmount' and 'ethPrice' have each 18 decimals so we have to divided by 1e18
    uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
    return ethAmountInUsd;
  }

  function getVersion() internal view returns(uint256) {
    return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
  }
}