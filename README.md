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
   https://github.com/ras-24/laptop-marketplace-contract.git
   ```
4. Type ```main``` on ***branch*** in **CLONE FROM URL** section.
5. Click **clone**.

### Deploy Example
1. **addItem**

   Choose **Account** for the seller on **ACCOUNT** section.

   _itemName: MacBook Pro

   _itemPrice: 1000000000000000000

   click **transact**.

   Note : Laptop Price in **Wei** or 1 **Ether** ($2621.17) (2621.17 $ Per Ether)

   We use [Ethereum Unit Converter](https://eth-converter.com/) to Convert the Price.
2. **itemCount**

   click **itemCount**.

   To show the amount of earlier added item.

   ```
   0: uint256: 1
   ```

4. **items**
   
   Type **1** for show the first item ID.

   click **items**.

   ```
   0: uint256: id 1
   1: string: itemName MacBook Pro
   2: uint256: itemPrice 1000000000000000000
   3: address: itemOwner 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
   ```
   
4. **buyItem**
   
   Choose different **account address** to buy the laptop.

   Enter the laptop price on the **VALUE** field : 1000000000000000000 (**Wei**)

   Enter the item ID on **buyItem** : **1**

   click **buyItem**.

   After buy we can check the item ownership by type item ID is **1** and click **items**
   ```
   0: uint256: id 1
   1: string: itemName Apple
   2: uint256: itemPrice 5000000000000000000
   3: address: itemOwner 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
   ```

   We can see the book ownership has changed from

   **0x5B38Da6a701c568545dCfcB03FcB875f56beddC4** to **0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db**

4. **balances**
   
   Copy the seller **Account Address**.

   Paste on **address** field in the **balance** section.

   click **balances**.

   ```
   0: uint256: 5000000000000000000
   ```

4. **checkBalance**

   click **checkBalance**.

   ```
   0: uint256: 5000000000000000000
   ```   

4. **withdrawBalance**

   Choose seller **Account** on **ACCOUNT** section.

   click **withdrawBalance**.

   The balance in the Marketplace will be transferred to your **seller account balance**.
