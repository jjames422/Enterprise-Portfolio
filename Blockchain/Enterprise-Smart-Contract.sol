// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @title SupplyChainContract
 * @dev A smart contract for managing supply chain records with role-based access control.
 */
import "@openzeppelin/contracts/access/AccessControl.sol";

contract SupplyChainContract is AccessControl {
    bytes32 public constant MANUFACTURER_ROLE = keccak256("MANUFACTURER_ROLE");
    bytes32 public constant RETAILER_ROLE = keccak256("RETAILER_ROLE");

    struct Batch {
        uint256 id;
        string details;
        address owner;
        uint256 timestamp;
    }

    mapping(uint256 => Batch) public batches;
    uint256 public batchCounter;

    event BatchCreated(uint256 indexed id, address indexed owner, string details);
    event BatchUpdated(uint256 indexed id, address indexed owner, string details);

    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function createBatch(string memory details) public onlyRole(MANUFACTURER_ROLE) {
        batchCounter++;
        batches[batchCounter] = Batch(batchCounter, details, msg.sender, block.timestamp);
        emit BatchCreated(batchCounter, msg.sender, details);
    }

    function updateBatch(uint256 id, string memory details) public onlyRole(MANUFACTURER_ROLE) {
        require(batches[id].id != 0, "Batch does not exist");
        batches[id].details = details;
        emit BatchUpdated(id, msg.sender, details);
    }

    function queryBatch(uint256 id) public view onlyRole(RETAILER_ROLE) returns (Batch memory) {
        require(batches[id].id != 0, "Batch does not exist");
        return batches[id];
    }
}
