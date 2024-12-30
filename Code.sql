-- Market Table
CREATE TABLE Market (
    Market_ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Company Table
CREATE TABLE Company (
    Company_ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255)
);

-- Stock Table
CREATE TABLE Stock (
    Stock_ID VARCHAR(255) PRIMARY KEY,
    Market_ID VARCHAR(255) NOT NULL,
    Company_ID VARCHAR(255) NOT NULL,
    FOREIGN KEY (Market_ID) REFERENCES Market(Market_ID),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

-- Stock Details Table
CREATE TABLE Stock_Details (
    Stock_ID VARCHAR(255) PRIMARY KEY,
    Current_Price FLOAT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (Stock_ID) REFERENCES Stock(Stock_ID)
);

-- Deal Table
CREATE TABLE Deal (
    Deal_ID VARCHAR(255) PRIMARY KEY,
    Date DATETIME NOT NULL,
    Quantity INT NOT NULL,
    Stock_ID VARCHAR(255) NOT NULL,
    Seller_ID VARCHAR(255) NOT NULL,
    Buyer_ID VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Stock_ID) REFERENCES Stock(Stock_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Investor(Investor_ID),
    FOREIGN KEY (Buyer_ID) REFERENCES Investor(Investor_ID)
);

-- Investor Table
CREATE TABLE Investor (
    Investor_ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);


-----------------------------------------------------------------------------------


DELIMITER $$

CREATE TRIGGER Calculate_Deal_Price
BEFORE INSERT ON Deal
FOR EACH ROW
BEGIN
    DECLARE current_price DECIMAL(10, 2);

    -- Fetch the current price of the stock from the Stock_Details table
    SELECT Current_Price INTO current_price FROM Stock_Details WHERE Stock_ID = NEW.Stock_ID;

    -- Calculate the deal price and store it in the Price field
    SET NEW.Price = current_price * NEW.Quantity;
END$$

DELIMITER ;




-----------------------------------------------------------------------------------


-- Stored procedure that returns records based on parameters
DELIMITER //
CREATE PROCEDURE GetDealsByStockAndDate(IN StockID VARCHAR(255), IN StartDate DATE, IN EndDate DATE)
BEGIN
    SELECT * FROM Deal
    WHERE Stock_ID = StockID AND Date >= StartDate AND Date <= EndDate;
END //
DELIMITER ;




-- Stored procedure to update the current price of a stock
DELIMITER //
CREATE PROCEDURE UpdateStockPrice(IN StockID VARCHAR(255), IN NewPrice FLOAT)
BEGIN
    UPDATE Stock_Details
    SET Current_Price = NewPrice
    WHERE Stock_ID = StockID;
END //
DELIMITER ;