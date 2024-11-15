# DailyTaskRewardSystem

A Solidity smart contract for managing daily tasks, rewarding users with points for completing tasks, and enabling point redemption.

## Features
- Add and track daily tasks.
- Earn points for completing tasks within 24 hours.
- View and redeem points for rewards.

## Constants
- `REWARD_POINTS`: Points per completed task (10).
- `REDEEM_THRESHOLD`: Minimum points to redeem rewards (50).
- `COMPLETION_WINDOW`: Task completion deadline (1 day).

## Functions
### Public/External
- **addTask(name, description)**: Adds a new task.
- **completeTask(index)**: Marks a task as completed within the time window.
- **viewPoints()**: Returns the user's points balance.
- **redeemReward(points)**: Deducts points for rewards.
- **getAllTasks()**: Fetches the user's tasks.

### Owner-Only
- Contract ownership is used for administrative purposes, although the current implementation has no explicit owner actions.

## Usage
1. Deploy the contract.
2. Users can:
   - Add tasks via `addTask`.
   - Complete tasks using `completeTask`.
   - Check points with `viewPoints`.
   - Redeem points using `redeemReward`.
