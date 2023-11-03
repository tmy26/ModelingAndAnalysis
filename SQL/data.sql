CREATE TABLE Account (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (test_id) REFERENCES Test(test_id),
    FOREIGN KEY (chart_id) REFERENCES NatalChart(chart_id),
    FOREIGN KEY (genres_id) REFERENCES PrefferedGenres(genres_id),
    FOREIGN KEY (diary_id) REFERENCES Diary(diary_id),
    total_entries_diary SMALLINT(),
    username VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    password VARCHAR(20) NOT NULL,
    height DECIMAL(3,2) NOT NULL,
    location VARCHAR(20) NOT NULL,
    gender ENUM('Male', 'Female', 'Prefer not to say'),
    Avatar img, # hot to store it
)

CREATE TABLE Test (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id),
    FOREIGN KEY (result_id) REFERENCES Result(result_id)
)

CREATE TABLE Questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question_values ENUM('Who is mitio the gun', 'do you prefer kondio or shaban shaulic', 'Prefer not to say'),
    FOREIGN KEY (test_id) REFERENCES Test(test_id),
    FOREIGN KEY (answear_id) REFERENCES Answears(answear_id)
)

CREATE TABLE Answears(
    answear_id INT AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(20) NOT NULL,
    weight SMALLINT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id)
)

CREATE TABLE Result (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    result VARCHAR(20) NOT NULL,
    FOREIGN KEY (test_id) REFERENCES Test(test_id)
)

CREATE TABLE NatalChart(
    chart_id INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (input_data_id) REFERENCES InputData(input_data_id),
    FOREIGN KEY (planets_id) REFERENCES Planets(planets_id),
    FOREIGN KEY (houses_id) REFERENCES Houses(houses_id)
)

CREATE TABLE InputData(
    input_data_id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    date_of_birth TINYINT() NOT NULL,
    hour_of_birth TINYINT() NOT NULL,
    minutes_of_birth TINYINT() NOT NULL,
    name VARCHAR(20) NOT NULL
)

CREATE TABLE Planets(
    planets_id INT AUTO_INCREMENT PRIMARY KEY,
    sun VARCHAR(12),
    moon VARCHAR(12),
    mercury VARCHAR(12),
    venus VARCHAR(12),
    mars VARCHAR(12),
    jupiter VARCHAR(12),
    saturn VARCHAR(12),
    uranus VARCHAR(12),
    neptune VARCHAR(12),
    pluto VARCHAR(12),
    true_node VARCHAR(12),
    chiron VARCHAR(12)
)

CREATE TABLE Houses(
    houses_id INT AUTO_INCREMENT PRIMARY KEY,
    ac VARCHAR(12),
    second_house VARCHAR(12),
    third_house VARCHAR(12),
    fourth_house VARCHAR(12),
    fifth_house VARCHAR(12),
    sixth_house VARCHAR(12),
    seventh_house VARCHAR(12),
    eight_house VARCHAR(12),
    nineth_house VARCHAR(12),
    tenth_hous VARCHAR(12),
    eleventh_house VARCHAR(12),
    twelveth_house VARCHAR(12)
)

CREATE TABLE PrefferedGenres(
    genres_id INT AUTO_INCREMENT PRIMARY KEY,
    genres TEXT() NOT NULL
)

CREATE TABLE Diary(
    diary_id INT AUTO_INCREMENT PRIMARY KEY,
    song TEXT NOT NULL,
    date_entry DATETIME NOT NULL,
    is_private BOOLEAN,
    keyword TEXT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
)

CREATE TABLE Category(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    custom_category_name VARCHAR(20) NOT NULL,
    title VARCHAR(20) NOT NULL
)


--The stored procedure

DELIMITER $$

CREATE PROCEDURE GetAccountInfo()

BEGIN
    SELECT
        username,
        email,
        location,
        height,
        gender
    FROM
        Account
    ORDER BY username,
END$$
DELIMITER ;

CALL GetAccountInfo();

-- Aggregate Function

SELECT
    AVG(height) average_high_for_zodiac_sign where NatalChart.sun == 'Virgo'
FROM
    Account;

--gotta add one more operation...