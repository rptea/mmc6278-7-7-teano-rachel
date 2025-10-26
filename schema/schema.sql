USE music_shop_db;

CREATE TABLE inventory (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  image VARCHAR(100) NOT NULL,
  description TEXT,
  price FLOAT(10,2) NOT NULL DEFAULT 0,
  quantity INT NOT NULL DEFAULT 0
);

-- Create the users table with
CREATE TABLE users (
  -- id that's primary key integer auto incrementing
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  -- username that's a 100 char varchar and unique
  username VARCHAR(100) NOT NULL UNIQUE,
  -- password that's a 200 char varchar
  password VARCHAR(200) NOT NULL
);

CREATE TABLE cart (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  inventory_id INT NOT NULL,
-- add a user_id column that's an int
  user_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  FOREIGN KEY (inventory_id)
    REFERENCES inventory (id)
    ON DELETE CASCADE
-- add a foreign key constraint to user_id just like inventory_id
  , FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);