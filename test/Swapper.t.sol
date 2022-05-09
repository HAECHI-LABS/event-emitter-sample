pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "contracts/Swapper.sol";

// helper methods for interacting with ERC20 tokens and sending ETH that do not consistently return true/false
library TransferHelper {
    function safeApprove(
        address token,
        address to,
        uint256 value
    ) internal {
        // bytes4(keccak256(bytes('approve(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x095ea7b3, to, value));
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            'TransferHelper::safeApprove: approve failed'
        );
    }

    function safeTransfer(
        address token,
        address to,
        uint256 value
    ) internal {
        // bytes4(keccak256(bytes('transfer(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            'TransferHelper::safeTransfer: transfer failed'
        );
    }

    function safeTransferFrom(
        address token,
        address from,
        address to,
        uint256 value
    ) internal {
        // bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x23b872dd, from, to, value));
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            'TransferHelper::transferFrom: transferFrom failed'
        );
    }

    function safeTransferETH(address to, uint256 value) internal {
        (bool success, ) = to.call{value: value}(new bytes(0));
        require(success, 'TransferHelper::safeTransferETH: ETH transfer failed');
    }
}

library Mainnet {
    address public constant uniswap = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public constant dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address public constant usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address public constant daiWhale = 0xE78388b4CE79068e89Bf8aA7f218eF6b9AB0e9d0;
    address public constant usdcWhale = 0x47ac0Fb4F2D84898e4D9E7b4DaB3C24507a6D503;
    address public constant usdtWhale = 0x5754284f345afc66a98fbB0a0Afe71e0F007B949;
}

contract ContractTest is Test {
    Swapper public s;
    Vm constant cheats = Vm(HEVM_ADDRESS);

    function setUp() public {
        s = new Swapper(IUniswapV2Router02(Mainnet.uniswap));
    }

    function faucet(
        address _token,
        address _recipient,
        uint256 _amount
    ) public {
        if (_token == Mainnet.dai) {
            cheats.prank(Mainnet.daiWhale);
            TransferHelper.safeTransfer(Mainnet.dai, _recipient, _amount);
        } else if (_token == Mainnet.usdc) {
            cheats.prank(Mainnet.usdcWhale);
            TransferHelper.safeTransfer(Mainnet.usdc, _recipient, _amount);
        } else if (_token == Mainnet.usdt) {
            cheats.prank(Mainnet.usdtWhale);
            TransferHelper.safeTransfer(Mainnet.usdt, _recipient, _amount);
        }
    }

   function testSwap(uint256 _amount) public {
       address _from = Mainnet.dai;
       address _to = Mainnet.usdc;
       cheats.assume(_amount < 1000000e18 && _amount > 10e18);
       faucet(_from, address(s), _amount);
       address[] memory path = new address[](2);
       path[0] = _from;
       path[1] = _to;
       s.swap(path);
   }

    function testSwap() public {
        uint256 _amount = 10000e18;
        address _from = Mainnet.dai;
        address _to = Mainnet.usdc;
        faucet(_from, address(s), _amount);
        address[] memory path = new address[](2);
        path[0] = _from;
        path[1] = _to;
        s.swap(path);
    }
}
