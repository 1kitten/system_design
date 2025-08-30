CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `partronymic` varchar(255),
  `bio` text,
  `media_id` integer,
  `city` varchar(255)
);

CREATE TABLE `interests` (
  `id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `user_interests` (
  `user_id` integer,
  `interest_id` integer
);

CREATE TABLE `posts` (
  `id` integer PRIMARY KEY,
  `user_id` integer,
  `body` text,
  `likes` integer,
  `views` integer
);

CREATE TABLE `tags` (
  `id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `post_tags` (
  `post_id` integer,
  `tag_id` integer
);

CREATE TABLE `post_media` (
  `post_id` integer,
  `media_id` integer
);

CREATE TABLE `comments` (
  `id` integer PRIMARY KEY,
  `user_id` integer,
  `post_id` integer,
  `body` text
);

CREATE TABLE `media` (
  `id` integer PRIMARY KEY,
  `url` varchar(255),
  `type` enum
);

CREATE TABLE `chats` (
  `id` integer PRIMARY KEY,
  `title` varchar(255),
  `dt_create` datetime
);

CREATE TABLE `chat_participants` (
  `chat_id` integer,
  `user_id` integer
);

CREATE TABLE `messages` (
  `id` integer PRIMARY KEY,
  `user_id` integer,
  `chat_id` integer,
  `body` text,
  `dt_create` datetime,
  `dt_update` datetime,
  `viewed` boolean,
  `removed` boolean
);

CREATE TABLE `message_media` (
  `message_id` integer,
  `media_id` integer
);

CREATE TABLE `followers` (
  `follow_id` integer,
  `followed_id` integer,
  `type` ENUM
);

ALTER TABLE `user_interests` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_interests` ADD FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `post_tags` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `post_tags` ADD FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

ALTER TABLE `post_media` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

ALTER TABLE `post_media` ADD FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

ALTER TABLE `chat_participants` ADD FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`);

ALTER TABLE `chat_participants` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `message_media` ADD FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`);

ALTER TABLE `message_media` ADD FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`);

ALTER TABLE `followers` ADD FOREIGN KEY (`follow_id`) REFERENCES `users` (`id`);

ALTER TABLE `followers` ADD FOREIGN KEY (`followed_id`) REFERENCES `users` (`id`);
