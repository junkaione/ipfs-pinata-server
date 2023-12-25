import { expect } from "chai";
import { ethers } from "hardhat";

describe("List", function () {
    let list: any;
    let owner: any;

    before(async function () {
        [owner] = await ethers.getSigners();
        list = await ethers.deployContract("List");
    });

    it("should create a new task", async function () {
        const taskName = "Sample Task";
        const ipfsHash = "test hash";
        await list.createTask(taskName, ipfsHash);

        const tasks = await list.getTask();
        expect(tasks.length).to.equal(1);
    });
});