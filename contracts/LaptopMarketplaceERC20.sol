// SPDX-License-Identifier: MIT
// Laptop Marketplace Contract with ERC-20 Payment

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LaptopMarketplace is Ownable {
    struct Item {
        uint id;
        string itemName;
        uint itemPrice;
        address payable itemOwner;
        bool isSold;
    }

    uint public itemCount = 0;
    mapping(uint => Item) public items;
    mapping(address => uint) public balances;

    IERC20 public laptopToken;

    event ItemAdded(uint id, string itemName, uint itemPrice, address itemOwner);
    event ItemPurchased(uint id, string itemName, uint itemPrice, address buyer);
    event BalanceWithdrawn(address seller, uint amount);

    constructor() Ownable(msg.sender) {
        laptopToken = IERC20(0x6345ADA4e7d51e363D87090be6920069149de021);
    }

    function addItem(string memory _itemName, uint _itemPrice) public {
        require(_itemPrice > 0, "Item price must be greater than 0");

        itemCount++;
        items[itemCount] = Item(itemCount, _itemName, _itemPrice, payable(msg.sender), false);

        emit ItemAdded(itemCount, _itemName, _itemPrice, msg.sender);
    }

    function buyItem(uint _id) public {
        Item storage item = items[_id];
        require(_id > 0 && _id <= itemCount, "Item not found");
        require(!item.isSold, "Item already sold");
        require(item.itemOwner != msg.sender, "Item owner cannot buy their own item");

        // Transfer the token from buyer to the contract
        require(laptopToken.transferFrom(msg.sender, address(this), item.itemPrice), "Token transfer failed");

        // Mark item as sold and store the balance for the seller
        item.isSold = true;
        balances[item.itemOwner] += item.itemPrice;

        // Update the item owner to the buyer's address & save item to items mapping
        item.itemOwner = payable(msg.sender);
        items[_id] = item;

        emit ItemPurchased(_id, item.itemName, item.itemPrice, msg.sender);
    }

    function withdrawBalance() public {
        uint balance = balances[msg.sender];
        require(balance > 0, "No balance to withdraw");

        // Reset the balance before transfer to prevent re-entrancy attacks
        balances[msg.sender] = 0;

        // Transfer the token to the seller
        require(laptopToken.transfer(msg.sender, balance), "Withdraw transfer failed");

        emit BalanceWithdrawn(msg.sender, balance);
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
