# Foundry template

foundry template to work with hardhat

## Prerequisite

### Foundry Installation

```shell
curl -L https://foundry.paradigm.xyz | bash
source ~/.zshrc
foundryup
```

### Node Installation

```shell
brew install nvm # follow https://formulae.brew.sh/formula/nvm
```

```shell
nvm install 14
nvm use 14
```

## Setting up Repository

install node modules

```shell
npm install --force
```

install foundry libraries
```shell
forge install
```

## instructions

### clear contract and test files

```shell
npm run clear
```

### using foundry

#### running compile

```shell
npm run compile
```

#### running test

```shell
npm run test
```

### using hardhat

#### running compile

```shell
npm run compile:hardhat
```

#### running test

```shell
npm run test:hardhat
```
