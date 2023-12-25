import { ethers } from "hardhat";

async function main() {
  const List = await ethers.deployContract("List");
  console.log("Deploying contract.....");
  await List.waitForDeployment();
  console.log(`List deployed to ${List.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});