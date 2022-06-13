import { task } from "hardhat/config";
import { Contract } from "ethers";

task("emit-paid", "emit Paid event")
  .addOptionalParam("id", "payment id")
  .setAction(async function({id}, hre) {
    if(id === undefined) {
      id = (Math.random() * 1000).toFixed(0);
    }
    const contract = await hre.ethers.getContract("SampleEventEmitter");
    await contract.emitPaid(id);
  });

task("emit-refunded", "emit Refunded event")
  .addOptionalParam("id", "payment id")
  .setAction(async function({id}, hre) {
    if(id === undefined) {
      id = (Math.random() * 1000).toFixed(0);
    }
    const contract = await hre.ethers.getContract("SampleEventEmitter");
    await contract.emitRefunded(id);
  });

task("emit-settled", "emit Settled event")
  .addOptionalParam("id", "payment id")
  .setAction(async function({id}, hre) {
    if(id === undefined) {
      id = (Math.random() * 1000).toFixed(0);
    }
    const contract = await hre.ethers.getContract("SampleEventEmitter");
    await contract.emitSettled(id);
  });

task("emit-claimed", "emit Claimed event")
  .addOptionalParam("id", "payment id")
  .setAction(async function({id}, hre) {
    if(id === undefined) {
      id = (Math.random() * 1000).toFixed(0);
    }
    const contract = await hre.ethers.getContract("SampleEventEmitter");
    await contract.emitClaimed(id);
  });

task("listen", "listen to events")
  .setAction(async function({}, hre) {
    const contract : Contract = await hre.ethers.getContract("SampleEventEmitter")
    contract.on("Paid", (paymentId) => {
      console.log("Paid #" + paymentId);
    });
    contract.on("Refunded", (paymentId) => {
      console.log("Refunded #" + paymentId);
    });
    contract.on("Settled", (paymentId) => {
      console.log("Settled #" + paymentId);
    });
    contract.on("Claimed", (paymentId) => {
      console.log("Claimed #" + paymentId);
    });
    await new Promise(() => {});
  });

