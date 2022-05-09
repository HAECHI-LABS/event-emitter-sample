// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "./IERC20.sol";

interface IUniswapV2Router02 {
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
}

contract Swapper{
    IUniswapV2Router02 public immutable router;

    constructor(IUniswapV2Router02 _router) {
        router = _router;
    }

    function swap(address[] calldata path) external {
        IERC20(path[0]).approve(address(router), type(uint256).max);
        router.swapExactTokensForTokens(
            IERC20(path[0]).balanceOf(address(this)),
            1,
            path,
            address(this),
            block.timestamp + 1
        );
    }
}
