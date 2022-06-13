# event-emitter-sample

## Prerequisite

- Node.js 14
- [Foundry](https://book.getfoundry.sh/getting-started/installation.html)

## Instruction

### Setup

이 github repository 를 clone 합니다
`git clone git@github.com:haechi-labs/event-emitter-sample`

필요한 node_module을 설치합니다
`cd evet-emitter-sample && npm install`

### Anvil Setup

이 샘플에서는, [anvil](https://book.getfoundry.sh/reference/anvil/index.html) 이라는 로컬 노드를 사용합니다

`npm run node`

위 명령어를 실행항 anvil을 실행합니다

http://localhost:8545 로 로컬 노드 rpc가 실행됩니다

### Deploy contract

`npx hardhat deploy --network localhost` 커맨드로 컨트랙트를 배포합니다

> 만약, deploy 단계에서 오류가 난다면, 새로운 anvil 노드를 띄운 이후일 가능성이 높습니다 deployments 폴더가 있는경우, 삭제하고 다시 실행해주세요

### Run Listener

`npx hardhat listen --network localhost` 커맨드로 배포한 컨트랙트의 이벤트를 구독합니다

해당 코드는 [여기](./task/eventListener.ts#L46) 에 있습니다

### Event emission

아래 커맨드들을 이용하여 (Paid, Refunded, Settled, Claimed)이벤트를 발생시킵니다

`--id <pid>` 부분을 생략하신다면 랜덤한 값으로 대체됩니다

```shell
npx hardhat emit-paid --network localhost --id <pid>
npx hardhat emit-refunded --network localhost --id <pid>
npx hardhat emit-settled --network localhost --id <pid>
npx hardhat emit-claimed --network localhost --id <pid>
```


[동영상예저](./event-emitter-1080p.mov)
