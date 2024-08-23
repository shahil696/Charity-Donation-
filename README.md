# Charity Campaign Smart Contract
![image](https://github.com/user-attachments/assets/d4452d68-4418-40e0-935f-2b2546aa3976)

## Vision

The Charity Campaign Smart Contract is designed to create a transparent and efficient way for managing fundraising campaigns on the Ethereum blockchain. This smart contract enables users to create campaigns, accept donations, withdraw funds, and manage the lifecycle of each campaign in a decentralized manner. Our goal is to ensure that charitable causes receive support while maintaining transparency and accountability.

## Flowchart

```plaintext
+---------------------------+
|     Create Campaign       |
|---------------------------|
| - name                    |
| - goalAmount              |
|---------------------------|
| + campaignId              |
| + CampaignCreated event   |
+---------------------------+
              |
              v
+---------------------------+
|       Donate              |
|---------------------------|
| - campaignId              |
| - donation amount         |
|---------------------------|
| + totalDonated            |
| + DonationMade event      |
+---------------------------+
              |
              v
+---------------------------+
|       Use Funds           |
|---------------------------|
| - campaignId              |
| - amount                  |
|---------------------------|
| + fundsUsed               |
| + FundsWithdrawn event    |
+---------------------------+
              |
              v
+---------------------------+
|   Deactivate Campaign     |
|---------------------------|
| - campaignId              |
|---------------------------|
| + isActive                |
+---------------------------+
```

## Contract Address

0xdab45f55266d7046bfc0ee4c04ecd2d5a0368d81

![image](https://github.com/user-attachments/assets/805b22a7-ee6e-4adb-b57d-7a5c28230fb2)


## Future Scope

1. **Campaign Milestones:** Implement milestones to track the progress towards the goal amount.
2. **Campaign Categories:** Introduce categories or tags to help users find relevant campaigns more easily.
3. **Feedback System:** Allow donors to provide feedback or comments on campaigns.
4. **Fund Utilization Reporting:** Generate automated reports to track how funds are being used.
5. **Multi-Signature Withdrawals:** Add multi-signature functionality to enhance security for withdrawing funds.

## Contact Details

For support, inquiries, or feedback, please contact:

- **Name:** Shahil Ahmed
- **Email:** shahilahmed696@gmail.com
- **GitHub:** github.com/shahil696
- **Twitter:** @shahil_ahm61447

Thank you for using the Charity Campaign Smart Contract. Your contributions help support and advance charitable causes!

---

