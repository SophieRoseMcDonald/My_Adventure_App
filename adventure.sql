
CREATE DATABASE myadventure;

-- adventure (id, name, image_url, location, details, user)
CREATE TABLE adventures (
  id SERIAL PRIMARY KEY,
  name VARCHAR(300) NOT NULL,
  image_url VARCHAR(400),
  address VARCHAR(300),
  details VARCHAR(400),
  special_mention VARCHAR(400)
);
--joining adventure & tag tables
CREATE TABLE adventures_tags (
  id SERIAL PRIMARY KEY,
  tag_id INTEGER NOT NULL,
  adventure_id INTEGER NOT NULL,
  FOREIGN KEY (adventure_id) REFERENCES adventures (id) ON DELETE RESTRICT,
  FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE RESTRICT
);
-- tags (id, tag_name [eg. 'bbq', 'playground', 'walking track', 'picnic area', 'garden'])
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR(50) NOT NULL
);

--comments (id, body, adventure_id)
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body VARCHAR(500) NOT NULL,
  adventure_id INTEGER NOT NULL,
  FOREIGN KEY (adventure_id) REFERENCES adventures (id) ON DELETE RESTRICT
);

--users (id, email, password)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(300) NOT NULL,
  password_digest VARCHAR(400)
);
