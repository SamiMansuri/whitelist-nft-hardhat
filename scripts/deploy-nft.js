const hre = require("hardhat");

const contractAddress = "0xfad72ADA1d2e88369F63082Ce95d36AB138b27b2";

async function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function main() {
  const nftContract = hre.ethers.deployContract("CryptoDevs", [
    contractAddress,
  ]);

  (await nftContract).waitForDeployment();

  console.log("NFT Contract Address:", (await nftContract).target);

  await sleep(30 * 1000);

  await hre.run("verify:verify", {
    address: (await nftContract).target,
    constructorArguments: [contractAddress],
  });
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
