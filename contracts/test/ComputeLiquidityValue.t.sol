/// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity =0.6.12;

import "../libraries/UniswapV2LiquidityMathLibrary.sol";

/// @title Test ComputeLiquidityValuee
contract ComputeLiquidityValue {
    using SafeMath for uint256;

    address public immutable factory;

    constructor(address factory_) public {
        factory = factory_;
    }

    // see UniswapV2LiquidityMathLibrary#getReservesAfterArbitrage
    function getReservesAfterArbitrage(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB
    ) external view returns (uint256 reserveA, uint256 reserveB) {
        return UniswapV2LiquidityMathLibrary.getReservesAfterArbitrage(
            factory,
            tokenA,
            tokenB,
            truePriceTokenA,
            truePriceTokenB
        );
    }

    // see UniswapV2LiquidityMathLibrary#getLiquidityValue
    function getLiquidityValue(
        address tokenA,
        address tokenB,
        uint256 liquidityAmount
    ) external view returns (
        uint256 tokenAAmount,
        uint256 tokenBAmount
    ) {
        return UniswapV2LiquidityMathLibrary.getLiquidityValue(
            factory,
            tokenA,
            tokenB,
            liquidityAmount
        );
    }

    // see UniswapV2LiquidityMathLibrary#getLiquidityValueAfterArbitrageToPrice
    function getLiquidityValueAfterArbitrageToPrice(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB,
        uint256 liquidityAmount
    ) external view returns (
        uint256 tokenAAmount,
        uint256 tokenBAmount
    ) {
        return UniswapV2LiquidityMathLibrary.getLiquidityValueAfterArbitrageToPrice(
            factory,
            tokenA,
            tokenB,
            truePriceTokenA,
            truePriceTokenB,
            liquidityAmount
        );
    }

    // test function to measure the gas cost of the above function
    function getGasCostOfGetLiquidityValueAfterArbitrageToPrice(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB,
        uint256 liquidityAmount
    ) external view returns (
        uint256
    ) {
        uint gasBefore = gasleft();
        UniswapV2LiquidityMathLibrary.getLiquidityValueAfterArbitrageToPrice(
            factory,
            tokenA,
            tokenB,
            truePriceTokenA,
            truePriceTokenB,
            liquidityAmount
        );
        uint gasAfter = gasleft();
        return gasBefore - gasAfter;
    }
}