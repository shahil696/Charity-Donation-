// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityCampaign {
    struct Campaign {
        string name;
        address payable owner;
        uint256 goalAmount;
        uint256 totalDonated;
        uint256 fundsUsed;
        bool isActive;
    }

    // Mapping from campaign ID to Campaign details
    mapping(uint256 => Campaign) public campaigns;
    // Counter for campaign IDs
    uint256 public campaignCount;

    // Event emitted when a new campaign is created
    event CampaignCreated(uint256 campaignId, string name, uint256 goalAmount, address owner);
    // Event emitted when a donation is made
    event DonationMade(uint256 campaignId, address donor, uint256 amount);
    // Event emitted when funds are withdrawn
    event FundsWithdrawn(uint256 campaignId, uint256 amount);

    // Create a new campaign
    function createCampaign(string memory name, uint256 goalAmount) public {
        campaignCount++;
        campaigns[campaignCount] = Campaign({
            name: name,
            owner: payable(msg.sender),
            goalAmount: goalAmount,
            totalDonated: 0,
            fundsUsed: 0,
            isActive: true
        });
        emit CampaignCreated(campaignCount, name, goalAmount, msg.sender);
    }

    // Donate to a campaign
    function donate(uint256 campaignId) public payable {
        Campaign storage campaign = campaigns[campaignId];
        require(campaign.isActive, "Campaign is not active.");
        require(msg.value > 0, "Donation amount must be greater than zero.");
        
        campaign.totalDonated += msg.value;
        emit DonationMade(campaignId, msg.sender, msg.value);
    }

    // Use funds from a campaign (only by campaign owner)
    function useFunds(uint256 campaignId, uint256 amount) public {
        Campaign storage campaign = campaigns[campaignId];
        require(msg.sender == campaign.owner, "Only the campaign owner can use the funds.");
        require(campaign.isActive, "Campaign is not active.");
        require(amount <= campaign.totalDonated - campaign.fundsUsed, "Insufficient funds available.");
        
        campaign.fundsUsed += amount;
        campaign.owner.transfer(amount);
        emit FundsWithdrawn(campaignId, amount);
    }

    // Get campaign details
    function getCampaign(uint256 campaignId) public view returns (
        string memory name,
        address owner,
        uint256 goalAmount,
        uint256 totalDonated,
        uint256 fundsUsed,
        bool isActive
    ) {
        Campaign storage campaign = campaigns[campaignId];
        return (
            campaign.name,
            campaign.owner,
            campaign.goalAmount,
            campaign.totalDonated,
            campaign.fundsUsed,
            campaign.isActive
        );
    }

    // Deactivate a campaign (only by the owner)
    function deactivateCampaign(uint256 campaignId) public {
        Campaign storage campaign = campaigns[campaignId];
        require(msg.sender == campaign.owner, "Only the campaign owner can deactivate the campaign.");
        require(campaign.isActive, "Campaign is already inactive.");

        campaign.isActive = false;
    }
}

