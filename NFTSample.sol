// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Nft_Collection is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public baseExtension = ".jason";
    uint256 public cost = 0.015 ether;
    uint256 public maxSupply = 3000;
    uint256 public maxMintAmount = 10;
    bool public paused = false;

    mapping(address => uint256) public addressMintedBalance;


    constructor(string memory _name, string memory _symbol, string memory _initBaseUri) 
    ERC721(_name, _symbol) {setBaseURI(_initBaseUri); mint(msg.sender, 10);}

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    //public
    function mint(address, uint256 _mintAmount)  public payable {
        require(!paused, "the contract is paused");
        uint256 supply = totalSupply();
        require(_mintAmount > 0);
        require(_mintAmount <= maxMintAmount);
        require(supply + _mintAmount <= maxSupply);
        if (msg.sender != owner()) {
            require(msg.value >= cost * _mintAmount);
        }
        for (uint256 i = 1; i <= _mintAmount; i++) {
            addressMintedBalance[msg.sender]++;
            _safeMint(msg.sender, supply + i);
        }
    }

    function walletOfOwner (address _owner) public view returns (uint256[] memory) {
        uint256 ownerTokenCount = balanceOf (_owner);
        uint256[] memory tokenIds = new uint256[] (ownerTokenCount);
        for (uint256 i; i < ownerTokenCount; i++) {
            tokenIds[i] = tokenOfOwnerByIndex (_owner, i);
        }
        return tokenIds;
    }

    function tokenURI (uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId));
        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension)): "";
    }

    //only owner
    function setCost (uint256 _newCost) public onlyOwner() {
        cost = _newCost;
    }

    function setMinAmount (uint256 _newMaxMintAmount) public onlyOwner {
        maxMintAmount = _newMaxMintAmount;
    }

    function setBaseURI (string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function setBaseExtension (string memory _newBaseExtesion) public onlyOwner {
        baseExtension = _newBaseExtesion;
    }

    function pause (bool _state) public onlyOwner {
        paused = _state;
    }

    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }

}