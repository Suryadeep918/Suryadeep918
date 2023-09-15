// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Crowdfunding {

    // create an object here:
    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations; 
    }

    // define mapping to access campaign object array:
    mapping(uint256 => Campaign) public campaigns; 

    // keep track of number of campaigns:
    uint256 public numberOfCampaigns = 0;

   // create functions here:
   function createCampaign(address owner, string memory title, string memory description, uint256 _deadline, string memory _image) public returns (uint256) {
    // this function should store new campaign inside campaign array:
    Campaign storage campaign = campaigns[numberOfCampaigns];

    // campaign
    require(campaign.deadline < block.timestamp, "The deadline should be a date in the future");

    // this function should be setting up the variables inside in the struct/object:
    campaign.owner = owner;
    campaign.title = title;
    campaign.description = description;
    campaign.deadline = _deadline;
    campaign.image = _image;

    // increment the counter for campaigns:
    numberOfCampaigns++; 

    return numberOfCampaigns - 1;
   
   }


   function donateToCampaign(uint256 _id) public payable {

    // todo: implement this code here my brother
    // uint256 amount = msg.value;
    
    // Campaign storage campaign = campaigns[_id];

    // campaign.donators.push(msg.sender);
    
    // campaign.donations.push(amount);

    // (bool sent) = payable(campaign.owner)



   }

   function getDonators(uint256 _id) view public returns (address[] memory, uint256[] memory)  {
    return (campaigns[_id].donators, campaigns[_id].donations);
   }

   function getCampaigns() public view returns (Campaign[] memory) {
    Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

    for(uint i = 0; i < numberOfCampaigns; i++){
        Campaign storage item = campaigns[i];

        allCampaigns[i] = item;

    }

    return allCampaigns;
   }



      
}