# Stock Trading Database Project

## Overview
This project represents a relational database system for managing stock trading activities. The database tracks stocks, deals, investors, markets, and companies.

## Database Schema
The database includes the following tables:

1. **Market**
   - `Market_ID` (PK)
   - `Name`

2. **Company**
   - `Company_ID` (PK)
   - `Name`
   - `Address`

3. **Stock**
   - `Stock_ID` (PK)
   - `Market_ID` (FK)
   - `Company_ID` (FK)
   - `Current_Price`
   - `Quantity`

4. **Investor**
   - `Investor_ID` (PK)
   - `Name`

5. **Deal**
   - `Deal_ID` (PK)
   - `Date`
   - `Quantity`
   - `Stock_ID` (FK)
   - `Seller_ID` (FK)
   - `Buyer_ID` (FK)
   - `Price`

6. **Stock_Details**
   - `Stock_ID` (PK)
   - `Current_Price`
   - `Quantity`

## ER Diagram
The ER diagram shows the relationships between these tables, including primary and foreign key constraints.

![ER Diagram](./image.png)

## Normalization
The database follows Third Normal Form (3NF):
1. All non-key attributes are fully dependent on the primary key.
2. There is no transitive dependency.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/stock-trading-db.git
   ```
2. Import the SQL schema:
   ```sql
   source Code.sql;
   ```

## Usage
- Run queries on the database to track stock deals, investor portfolios, and market analytics.

## Contribution
Feel free to fork the repository and submit pull requests.

## License
This project is licensed under the MIT License.

---
Developed by [Your Name].

