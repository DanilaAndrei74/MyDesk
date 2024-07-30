CREATE TABLE `Reservations`(
    `User_Id` CHAR(36) NOT NULL,
    `Desk_Id` CHAR(36) NULL,
    `Date` TIMESTAMP NOT NULL,
    `Deleted` TINYINT(1) NOT NULL,
    `Created_At` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Reservations` ADD PRIMARY KEY(`User_Id`, `Desk_Id`, `Date`);
ALTER TABLE
    `Reservations` ADD INDEX `reservations_user_id_index`(`User_Id`);
ALTER TABLE
    `Reservations` ADD INDEX `reservations_desk_id_index`(`Desk_Id`);
CREATE TABLE `Credentials`(
    `Id` CHAR(36) NOT NULL,
    `Password` VARCHAR(255) NOT NULL,
    `Salt` VARCHAR(255) NOT NULL,
    `2FA` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Credentials` ADD PRIMARY KEY(`Id`);
CREATE TABLE `Teams`(
    `id` CHAR(36) NOT NULL,
    `Name` VARCHAR(30) NOT NULL,
    `Created_At` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Teams` ADD PRIMARY KEY(`id`);
CREATE TABLE `Floors`(
    `id` CHAR(36) NOT NULL,
    `Building_Id` CHAR(36) NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Deleted` TINYINT(1) NOT NULL,
    `Created_At` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Floors` ADD PRIMARY KEY(`id`);
CREATE TABLE `Zones`(
    `id` CHAR(36) NOT NULL,
    `Floor_Id` CHAR(36) NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Deleted` TINYINT(1) NOT NULL,
    `Created_At` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Zones` ADD PRIMARY KEY(`id`);
CREATE TABLE `Buildings`(
    `Id` CHAR(36) NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Address` VARCHAR(255) NOT NULL,
    `Deleted` TINYINT(1) NOT NULL,
    `Created_At` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Buildings` ADD PRIMARY KEY(`Id`);
CREATE TABLE `Desks`(
    `id` CHAR(36) NOT NULL,
    `Zone_Id` CHAR(36) NOT NULL,
    `X_Position` SMALLINT UNSIGNED NOT NULL,
    `Y_Position` SMALLINT UNSIGNED NOT NULL,
    `Status` SMALLINT UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 -> Good
1 -> Unavailable',
    `Deleted` TINYINT(1) NOT NULL,
    `CreatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Desks` ADD PRIMARY KEY(`id`);
CREATE TABLE `Photos`(
    `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Photo` BLOB NULL
);
CREATE TABLE `Users`(
    `Id` CHAR(36) NOT NULL,
    `Team_Id` CHAR(36) NULL,
    `Photo_Id` CHAR(36) NULL,
    `Credentials_Id` CHAR(36) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `First_Name` VARCHAR(255) NOT NULL,
    `Last_Name` VARCHAR(255) NOT NULL,
    `Is_Admin` TINYINT(1) NOT NULL DEFAULT '0',
    `Deleted` TINYINT(1) NOT NULL,
    `Created_At` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Users` ADD PRIMARY KEY(`Id`);
ALTER TABLE
    `Users` ADD INDEX `users_team_id_index`(`Team_Id`);
ALTER TABLE
    `Users` ADD INDEX `users_photo_id_index`(`Photo_Id`);
ALTER TABLE
    `Users` ADD INDEX `users_credentials_id_index`(`Credentials_Id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_team_id_foreign` FOREIGN KEY(`Team_Id`) REFERENCES `Teams`(`id`);
ALTER TABLE
    `Reservations` ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY(`User_Id`) REFERENCES `Users`(`Id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_credentials_id_foreign` FOREIGN KEY(`Credentials_Id`) REFERENCES `Credentials`(`Id`);
ALTER TABLE
    `Desks` ADD CONSTRAINT `desks_zone_id_foreign` FOREIGN KEY(`Zone_Id`) REFERENCES `Zones`(`id`);
ALTER TABLE
    `Zones` ADD CONSTRAINT `zones_floor_id_foreign` FOREIGN KEY(`Floor_Id`) REFERENCES `Floors`(`id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_photo_id_foreign` FOREIGN KEY(`Photo_Id`) REFERENCES `Photos`(`Id`);
ALTER TABLE
    `Reservations` ADD CONSTRAINT `reservations_desk_id_foreign` FOREIGN KEY(`Desk_Id`) REFERENCES `Desks`(`id`);
ALTER TABLE
    `Floors` ADD CONSTRAINT `floors_building_id_foreign` FOREIGN KEY(`Building_Id`) REFERENCES `Buildings`(`Id`);