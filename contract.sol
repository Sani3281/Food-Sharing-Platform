// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSharingPlatform {
    string public name = "Food Sharing Token";
    string public symbol = "FST";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (10 ** uint256(decimals));
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(uint256 => FoodItem) public foodItems;
    uint256 public foodItemCount = 0;

    struct FoodItem {
        uint256 id;
        string name;
        string description;
        uint256 price;
        address payable seller;
        bool isAvailable;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event FoodItemListed(uint256 indexed id, string name, uint256 price, address seller);
    event FoodItemPurchased(uint256 indexed id, address buyer, address seller);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool success) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Insufficient allowance");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function listFoodItem(string memory _name, string memory _description, uint256 _price) public returns (uint256) {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(_price > 0, "Price must be greater than 0");
        
        foodItemCount++;
        foodItems[foodItemCount] = FoodItem(
            foodItemCount,
            _name,
            _description,
            _price,
            payable(msg.sender),
            true
        );
        
        emit FoodItemListed(foodItemCount, _name, _price, msg.sender);
        return foodItemCount;
    }

    function purchaseFoodItem(uint256 _id) public {
        FoodItem storage item = foodItems[_id];
        require(item.isAvailable, "Food item is not available");
        require(balanceOf[msg.sender] >= item.price, "Insufficient balance");
        
        balanceOf[msg.sender] -= item.price;
        balanceOf[item.seller] += item.price;
        item.isAvailable = false;
        
        emit FoodItemPurchased(_id, msg.sender, item.seller);
        emit Transfer(msg.sender, item.seller, item.price);
    }
}