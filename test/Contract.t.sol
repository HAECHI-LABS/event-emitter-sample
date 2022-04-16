// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ds-test/test.sol";
import "./CheatCodes.sol";
import "src/Contract.sol";

contract ContractTest is DSTest {
    Contract public c;
    CheatCodes constant cheats = CheatCodes(HEVM_ADDRESS);

    function setUp() public {
        c = new Contract();
    }

    function testExample() public {
        assertTrue(true);
    }

    function testAdd(uint256 a, uint256 b) public {
        unchecked {
            // to check if a + b overflows
            cheats.assume(a+b >= a);
        }
        c.add(a,b);
        assertEq(a + b, c.result());
    }
}
