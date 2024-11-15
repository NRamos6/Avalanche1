# Avalanche1

## Overview

The DailyTaskRewardSystem smart contract provides a decentralized framework for managing daily tasks, rewarding timely task completion, and enabling users to redeem earned points. The contract leverages Solidity's robust features to ensure reliability, including task tracking, point management, and secure error handling.

## Features

- **Task Creation**: Users can define and add new tasks with a name and description to their personal task list.
- **Timely Task Completion**: Rewards users with points when tasks are marked as completed within a predefined 24-hour time window.
- **Point Utilization**: Enables users to redeem accumulated points once they meet or exceed the redemption threshold.
- **Error Validation**: Ensures robust operation with:
  - **`require()`**: Validates inputs, such as task indices, point balance sufficiency, and time constraints.
  - **`assert()`**: Confirms that point deductions or updates are accurate and consistent.
  - **`revert()`**: Halts invalid operations, such as attempting to complete a task past its allowed time frame.

## Functional Description

### `addTask(string _name, string _description)`
- **Purpose**: Allows users to add tasks to their personalized task list.
- **Details**: Users provide a task name and description. Input validation ensures the fields are not empty.

### `completeTask(uint _index)`
- **Purpose**: Marks a specific task as completed, rewarding the user with points if done on time.
- **Details**: The task must be completed within 24 hours of its creation. A successful completion adds points to the user’s total balance.

### `viewPoints()`
- **Purpose**: Displays the current point balance for the calling user.
- **Details**: Retrieves and returns the accumulated points associated with the user's address.

### `redeemReward(uint _points)`
- **Purpose**: Allows users to redeem their points when they meet the required threshold.
- **Details**: Deducts the specified number of points from the user’s balance after verifying sufficiency.

### `getAllTasks()`
- **Purpose**: Fetches the list of tasks associated with the calling user.
- **Details**: Returns an array containing the details of all registered tasks, including their completion status.

## Error Handling

- **`require()`**: Prevents invalid inputs and state transitions, such as invalid task indices or insufficient points.
- **`assert()`**: Confirms that key contract invariants, like correct point updates, hold true.
- **`revert()`**: Safely terminates invalid operations, restoring the state to its original form if errors occur (e.g., attempting task completion after 24 hours).

## Additional Notes

- **Customization**: The contract constants, such as `REWARD_POINTS`, `REDEEM_THRESHOLD`, and `COMPLETION_WINDOW`, can be adjusted as needed for specific use cases.
- **Gas Efficiency**: Designed to minimize unnecessary computations, keeping user interactions cost-effective.
