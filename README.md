# Fei Protocol ·

Smart contract code for Fei Protocol and the FEI stablecoin

## Documentation

See the [docs](https://docs.fei.money)

## License

Fei Protocol is under [the AGPL v3 license](https://github.com/fei-protocol/fei-protocol-core/tree/7160dda163d45e6d6c7092ef021c365e0031a71f/LICENSE.md)


# Fei Protocol Hardhat 

### Prerequisites

Set up your .env with the respective values:

```sh
cp -v .env.example .env
```

_Alchemy requires the API URL and ETH Private Key, Infura requires the API KEY and Mnemonic_

* [ALCHEMY_API_URL](https://dashboard.alchemyapi.io/)
* [ETH_PRIVATE_KEY](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key)
* [MNEMONIC](https://metamask.zendesk.com/hc/en-us/articles/360015290032-How-to-Reveal-Your-Seed-Phrase-Secret-Recovery-Phrase)
* [INFURA_API_KEY](https://infura.io/)
* [ETHERSCAN_API_KEY](https://etherscan.io/)
* REPORT_GAS=true

Before running any command, make sure to install dependencies:

```sh
yarn
```

### Prettier

```sh
yarn lint:prettier
```

### Linting 

If you want to re-initialize Solhint's configuration file with all the default rules enabled:

```sh
yarn && solhint --init
```

Or replace the existing file with:

```json
{
  "extends": "solhint:default"
}
```

Lint all the files inside the `contracts` directory:

```sh
solhint 'contracts/**/*.sol'
```

Or use the included:

```sh
yarn lint:sol
```

Or both Prettier and Solhint:

```sh
yarn lint
```

### Compile

Compile the smart contracts with Hardhat:

```sh
yarn compile
```

### TypeChain

Compile the smart contracts and generate TypeChain artifacts:

```sh
yarn build
```

### Test

Run the Mocha tests:

```sh
yarn test
```

### Deploy contract to network 
_(requires Mnemonic and Infura API key)_

```sh
npx hardhat run --network rinkeby ./scripts/deploy.ts
```

### Or Deploy contract to Alchemy network
_(requires Alchemy API URL and Ethereum private key)_ The API URL is for the Ropsten network.

```sh
npx hardhat run scripts/deploy.ts --network alchemy
```

### 

### Validate a contract with Etherscan 
_(requires Etherscan API key)_

```sh
npx hardhat verify --network <network> <DEPLOYED_CONTRACT_ADDRESS> "Constructor argument 1"
```