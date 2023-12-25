// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract List {
    struct Task {
        uint id;
        string name;
        string ipfsHash;
        address owner;
    }

    Task[] private list;

    function createTask(string calldata name, string calldata ipfsHash) public {
        uint taskId = list.length;
        list.push(Task(
            taskId,
            name,
            ipfsHash,
            msg.sender
        ));
    }

    function getTask() public view returns (Task[] memory) {
        Task[] memory temporary = new Task[](list.length);
        uint counter = 0;
        for (uint i = 0; i < list.length; i++) {
            if (list[i].owner == msg.sender) {
                temporary[counter] = list[i];
                counter++;
            }
        }
        Task[] memory result = new Task[](counter);
        for (uint i = 0; i < counter; i++) {
            result[i] = temporary[i];
        }
        return result;
    }
}