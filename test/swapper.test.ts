import { expect } from "chai";
import { ethers, network } from "hardhat";
import { BigNumber, Contract, Signer } from "ethers";

const u_holder_address = "0x537f83ea54e89c967cef5fc313c9160ed2a4ae5c";
const u_address = "0x83507cc8C8B67Ed48BADD1F59F684D5d02884C81";
const c_address = "0x62B9c7356A2Dc64a1969e19C23e4f579F9810Aa7";
const addresses = {
  uniswap : "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D",
  dai : "0x6B175474E89094C44Da98b954EedeAC495271d0F",
  usdc : "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48",
  usdt : "0xdAC17F958D2ee523a2206206994597C13D831ec7",
  daiWhale : "0xE78388b4CE79068e89Bf8aA7f218eF6b9AB0e9d0",
  usdcWhale : "0x47ac0Fb4F2D84898e4D9E7b4DaB3C24507a6D503",
  usdtWhale : "0x5754284f345afc66a98fbB0a0Afe71e0F007B949"
}

export async function impersonate(address: string): Promise<Signer> {
  await network.provider.request({
    method: 'hardhat_impersonateAccount',
    params: [address],
  });
  return await ethers.getSigner(address);
}

describe('swap test', () => {
  let swapper : Contract;

  before(async function () {
    swapper = await(await ethers.getContractFactory("Swapper")).deploy(addresses.uniswap);
    const daiWhale = await impersonate(addresses.daiWhale);
    const dai = await ethers.getContractAt("IERC20", addresses.dai);
    await dai.connect(daiWhale).transfer(swapper.address, "1000000000000000000000");
  });

  it("should be able to swap", async () => {
    await swapper.swap([addresses.dai, addresses.usdc]);
  });
});
