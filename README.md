# laptop-marketplace-contract
Laptop Marketplace Smart Contract

## Features
1. **Add Item** -> Add item to storage.
2. **Buy Item** -> Buy one item.
3. **Withdraw Balance** -> Withdraw to Account Balance.
4. **Balances** -> Show balance based on Account Address.
5. **Check Balance** -> Show current Account Address balance.
6. **Item Count** -> Show total number of items.
7. **Items** -> Show item based on item ID.

### Prerequisites
1. This project runs on [Remix IDE](https://remix.ethereum.org).

### Installation
1. Open [Remix IDE](https://remix.ethereum.org).
2. On the Remix left side menu, click **Git** then click **CLONE**.
3. Paste URL below on **url** in **CLONE FROM URL** section.
   ```sh
   https://github.com/ras-24/mini-bank-contract.git
   ```
4. Type ```main``` on ***branch*** in **CLONE FROM URL** section.
5. Click **clone**.

### Deploy Example
1. **cashDeposit**

   Choose **Account** you want to Deposit on **ACCOUNT** section.

   Enter the amount you wish to deposit on the **VALUE** section in **Wei** units.

   click **cashDeposit**.
   
   Note : We use [Ethereum Unit Converter](https://eth-converter.com/) to Convert the amount.
2. **cashWithdraw**

   Enter the amount you wish to withdraw in **Wei** units.

   click **cashWithdraw**.

3. **balance**
   
   Select the Account Address you want to get balance on the **ACCOUNT** section.

   Copy the Account Address.

   Paste the Account Address on **balance** section in **address** field.

   click **balance**.
