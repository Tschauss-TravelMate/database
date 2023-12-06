CREATE TABLE user(
    user_id VARCHAR(20) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    password VARCHAR(20) NOT NULL,
    PRIMARY KEY(user_id)
);
CREATE TABLE planner(
    planner_id INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    image_data TEXT,
    dst_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY(planner_id)
);
CREATE TABLE planner_permission(
    planner_permission_id INT AUTO_INCREMENT,
    user_id VARCHAR(20) NOT NULL,
    planner_id INT NOT NULL,
    PRIMARY KEY(planner_permission_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (planner_id) REFERENCES planner(planner_id)
);
CREATE TABLE node(
    node_id INT AUTO_INCREMENT PRIMARY KEY,
    planner_id INT NOT NULL,
    loc_name VARCHAR(20) NOT NULL,
    location_x FLOAT(10,6),
    location_y FLOAT(10,6),
    confirm INT,
    PRIMARY KEY(node_id),
    FOREIGN KEY (planner_id) REFERENCES planner(planner_id)
);
CREATE TABLE budget(
    budget_id INT AUTO_INCREMENT PRIMARY KEY,
    node_id INT NOT NULL,
    transport INT DEFAULT 0,
    meal INT DEFAULT 0,
    hotel INT DEFAULT 0,
    tour INT DEFAULT 0,
    PRIMARY KEY(budget_id),
    FOREIGN KEY (node_id) REFERENCES node(node_id)
);
CREATE TABLE post(
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    node_id INT NOT NULL,
    planner_id INT NOT NULL,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    good INT DEFAULT 0,
    bad INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    start_time DATE,
    end_time DATE,
    PRIMARY KEY(post_id),
    FOREIGN KEY (node_id) REFERENCES node(node_id),
    FOREIGN KEY (planner_id) REFERENCES planner(planner_id)
);
CREATE TABLE comment(
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT,
    good INT,
    bad INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (post_id) REFERENCES post(post_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);