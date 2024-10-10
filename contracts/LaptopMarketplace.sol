// SPDX-License-Identifier: MIT
// Laptop Marketplace Contract

pragma solidity >=0.7.0 <0.9.0;

contract LaptopMarketplace {
    struct Laptop {
        uint id;
        string laptopName;
        uint laptopPrice;
        address laptopOwner;
    }

    Laptop[] public allLaptops;
    uint public laptopId;

    function addLaptop(string memory _laptopName, uint _laptopPrice) public {
        allLaptops.push(Laptop(laptopId, _laptopName, _laptopPrice, msg.sender));
        laptopId++;
    }

    function buyLaptop(uint _id) public payable {
        Laptop storage laptop = allLaptops[_id];
        require(laptop.laptopPrice <= msg.value, "Please pay accordingly");
        laptop.laptopOwner = msg.sender;
    }
}