CREATE TABLE IF NOT EXISTS players (
    id INT NOT NULL AUTO_INCREMENT,
    license VARCHAR(80) NOT NULL,
    steam VARCHAR(80) DEFAULT NULL,
    discord VARCHAR(80) DEFAULT NULL,
    firstname VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    dateofbirth DATE NOT NULL,
    sex VARCHAR(10) NOT NULL,
    money INT NOT NULL DEFAULT 0,
    bank INT NOT NULL DEFAULT 0,
    dirty INT NOT NULL DEFAULT 0,
    job VARCHAR(64) NOT NULL DEFAULT 'unemployed',
    job_grade INT NOT NULL DEFAULT 0,
    inventory LONGTEXT DEFAULT NULL,
    hunger INT NOT NULL DEFAULT 100,
    thirst INT NOT NULL DEFAULT 100,
    permission VARCHAR(20) NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY unique_license (license)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS jobs (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    label VARCHAR(64) NOT NULL,
    whitelisted TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY unique_job_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS job_grades (
    id INT NOT NULL AUTO_INCREMENT,
    job_name VARCHAR(64) NOT NULL,
    grade INT NOT NULL,
    label VARCHAR(64) NOT NULL,
    salary INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY unique_job_grade (job_name, grade),
    CONSTRAINT fk_job_grades_job_name FOREIGN KEY (job_name) REFERENCES jobs(name) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS items (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    label VARCHAR(64) NOT NULL,
    weight DECIMAL(10,2) NOT NULL DEFAULT 0,
    stackable TINYINT(1) NOT NULL DEFAULT 1,
    usable TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY unique_item_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS inventory (
    id INT NOT NULL AUTO_INCREMENT,
    player_license VARCHAR(80) NOT NULL,
    item_name VARCHAR(64) NOT NULL,
    amount INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY unique_player_item (player_license, item_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS bans (
    id INT NOT NULL AUTO_INCREMENT,
    license VARCHAR(80) NOT NULL,
    reason VARCHAR(255) NOT NULL,
    banned_by VARCHAR(64) NOT NULL,
    expire_at DATETIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_license (license)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
