// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    struct MenuItem {
        uint256 price;
        uint256 servings;
    }

    mapping(string => MenuItem) public menu;
    mapping(address => mapping(string => uint256)) public userOwnedFood;

    constructor() ERC20("Degen", "DGN") {
        addMenu("Spaghetti", 20, 10);
        addMenu("Pesto", 50, 10);
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(_msgSender(), amount);
    }

    function burn(uint256 amount) public  {
        _burn(_msgSender(), amount);
    }

 function transferTokens(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Invalid amount");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _transfer(msg.sender, to, amount);
    }
    
    function addMenu(string memory foodName, uint256 price, uint256 servings) public onlyOwner {
        menu[foodName] = MenuItem(price, servings);
    }

    function buyMenu(string memory foodName) public payable{
        require(menu[foodName].servings > 0, "Item not available");
        require(balanceOf(msg.sender) >= menu[foodName].price, "Insufficient funds");

        _burn(msg.sender, menu[foodName].price);
        menu[foodName].servings--;
        userOwnedFood[msg.sender][foodName]++;
    }

   
}
