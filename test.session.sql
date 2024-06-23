-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);
-- @block
insert into users (email, bio, country)
values (
        'hello@world.com',
        'i love strangers',
        'US'
    );
-- @block
insert into users (email, bio, country)
values ('hey@world.com', 'I love food', 'US'),
    ('holla@world.com', 'I love chicken', 'US'),
    ('hithere@world.com', 'jollof rice lover', 'MX');
-- @block
SELECT bio,
    country,
    email
FROM users
WHERE country = 'US'
    AND email LIKE 'h%'
ORDER BY id DESC
LIMIT 2;
-- @block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id) -- Foreign key constraints tell the database not to delete anything that holds data about that relationship. This guarantees data integrity.
);
-- @block
INSERT INTO Rooms(owner_id, street)
VALUES (1, 'san diego sailboat'),
    (1, 'nantucket cottage'),
    (1, 'vail cabin'),
    (1, 'sf cardboard box');
-- @block
SELECT users.id AS user_id,
    rooms.id AS room_id,
    email,
    street
FROM users
    INNER JOIN rooms ON rooms.owner_id = users.id;
-- @block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);
-- @block Rooms a User has booked
SELECT guest_id,
    street,
    check_in
FROM bookings
    INNER JOIN rooms ON rooms.owner_id = guest_id
WHERE guest_id = 1;
-- @block Guests who stayed in a room
SELECT room_id,
    guest_id,
    email,
    bio
FROM Bookings
    INNER JOIN users ON users.id = guest_id
WHERE room_id = 2;