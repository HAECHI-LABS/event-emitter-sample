pragma solidity ^0.8.11;

import {ERC20} from  "@rari-capital/solmate/src/tokens/ERC20.sol";

contract SampleERC20 is ERC20 {

    constructor() ERC20("Sample", "SAMP", 18) {
    }

    function mint(address _to, uint256 _amount) external {
        _mint(_to, _amount);
    }
}
