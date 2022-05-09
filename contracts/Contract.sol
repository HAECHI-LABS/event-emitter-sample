// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

contract Contract {
    uint256 public result;

    function add(uint256 a, uint256 b) external {
        result = a+b;
    }
}
