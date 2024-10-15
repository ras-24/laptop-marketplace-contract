// SPDX-License-Identifier: MIT
// Laptop Marketplace Contract

pragma solidity >=0.7.0 <0.9.0;

contract LaptopMarketplace {
    struct Item {
        uint id;
        string itemName;
        uint itemPrice;
        address payable itemOwner;
    }

    uint public itemCount = 0;
    mapping(uint => Item) public items;
    mapping(address => uint) public balances;

    event ItemAdded(uint id, string itemName, uint itemPrice, address itemOwner);
    event ItemPurchased(uint id, string itemName, uint itemPrice, address buyer);

    function addItem(string memory _itemName, uint _itemPrice) public {
        require(_itemPrice > 0, "Item price must be greater than 0");

        itemCount++;
        items[itemCount] = Item(itemCount, _itemName, _itemPrice, payable(msg.sender));

        emit ItemAdded(itemCount, _itemName, _itemPrice, msg.sender);
    }

    function buyItem(uint _id) public payable {
        Item memory item = items[_id];
        require(_id > 0 && _id <= itemCount, "Item not found");
        require(msg.value == item.itemPrice, "Ether value sent must match the item price");
        require(item.itemOwner != msg.sender, "Item owner cannot buy their own item");

        balances[item.itemOwner] += msg.value;
        item.itemOwner = payable(msg.sender);
        items[_id] = item;

        emit ItemPurchased(_id, item.itemName, item.itemPrice, msg.sender);
    }

    function withdrawBalance() public {
        uint balance = balances[msg.sender];
        require(balance > 0, "No balance to withdraw");

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(balance);
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}