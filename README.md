# Implementing a payment stream with NFT

smart contracts set up for hardhat are in hh
UI in my-app

## Overview

Opportunity: distribute tokens amongst many participants, based on their participation level

The tokens will represent a payment stream
	
Each instance of the contract will mint NFTs wheree attributes will contain a participation level.

When a payment is received by the contract it will be distributed to all the holders' address according to participation level.  The payments will be allocated in a data structure and the holder must 'pull' their payment from contract.  There will also exist a function to push all payments to participants.

The smart contracts will be created by a contract factory using cloning so each contract will have its own data while sharing the common code.

What if a NFT buyer is hacked and 'bad actor' gets control of ETH address and NFT?
Cancel and remint NFT.

If someone sells the NFT do we partial payment at time of transfer? Or just make the payments on the specified day, leaving customers to sort out the value of NFT?
