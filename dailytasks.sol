// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DailyTaskRewardSystem {
    address public owner;

    uint public constant REWARD_POINTS = 10;
    uint public constant REDEEM_THRESHOLD = 50;
    uint public constant COMPLETION_WINDOW = 1 days;

    struct Task {
        string name;
        string description;
        uint timestamp;
        bool completed;
    }

    mapping(address => Task[]) private userTasks;
    mapping(address => uint) private userPoints;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Adds a new task for the user
    function addTask(string memory _name, string memory _description) external {
        require(bytes(_name).length > 0, "Task name cannot be empty");
        require(bytes(_description).length > 0, "Task description cannot be empty");

        userTasks[msg.sender].push(Task({
            name: _name,
            description: _description,
            timestamp: block.timestamp,
            completed: false
        }));
    }

    // Completes a task and awards points
    function completeTask(uint _index) external {
        // Ensure the index is greater than 0 and within range
        require(_index > 0, "Task index must be greater than 0");
        require(_index < userTasks[msg.sender].length, "Task index out of range");

        Task storage task = userTasks[msg.sender][_index];
        require(!task.completed, "Task is already completed");

        // Check completion within the time window
        if (block.timestamp <= task.timestamp + COMPLETION_WINDOW) {
            task.completed = true;
            userPoints[msg.sender] += REWARD_POINTS; // Update points
        } else {
            revert("Task completion time exceeded");
        }
    }

    // Retrieves the user's points balance
    function viewPoints() external view returns (uint) {
        return userPoints[msg.sender];
    }

    // Redeems points if the user has enough
    function redeemReward(uint _points) external {
        require(_points > 0, "Redeem points must be greater than zero");
        require(userPoints[msg.sender] >= _points, "Not enough points to redeem");

        userPoints[msg.sender] -= _points; // Deduct points
    }

    // Fetches all tasks for the user
    function getAllTasks() external view returns (Task[] memory) {
        return userTasks[msg.sender];
    }
}
