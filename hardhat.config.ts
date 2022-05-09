import '@nomiclabs/hardhat-ethers';
import '@nomiclabs/hardhat-waffle';
import 'solidity-coverage';
import 'hardhat-spdx-license-identifier';

// typechain support
import '@typechain/ethers-v5';
import '@typechain/hardhat';

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

export default {
  solidity: {
    compilers: [
      {
        version: "0.8.13",
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      }
    ],
  },
  networks: {
    hardhat: {
      gas: 10000000,
      accounts: {
        accountsBalance: '1000000000000000000000000',
      },
      allowUnlimitedContractSize: true,
      timeout: 1000000,
      forking: {
        url: process.env.MAINNET_RPC_URL,
        blockNumber: Number(process.env.MAINNET_FORK_BLOCK),
      },
    },
    coverage: {
      url: 'http://localhost:8555',
    },
  },
};
