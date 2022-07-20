

----------- auditorium table------------
CREATE TABLE `auditorium` (
  `idauditorium` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `seats_no` int NOT NULL,
  PRIMARY KEY (`idauditorium`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



----------events table -------------
CREATE TABLE `events` (
  `idevent` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `director` varchar(100) NOT NULL,
  `duration` int DEFAULT NULL,
  `img` varchar(256) DEFAULT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`idevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


----------- reservation table------------
CREATE TABLE `reservaition` (
  `idreservaition` int NOT NULL AUTO_INCREMENT,
  `screening_id` int NOT NULL,
  `user_id` int NOT NULL,
  `paid` float NOT NULL,
  `nb_ticker` int NOT NULL,
  `seat_id` int NOT NULL,
  PRIMARY KEY (`idreservaition`),
  KEY `idreservaition` (`idreservaition`) /*!80000 INVISIBLE */,
  KEY `user_id_idx` (`user_id`),
  KEY `screeninh_id_idx` (`screening_id`),
  CONSTRAINT `screeninh_id` FOREIGN KEY (`screening_id`) REFERENCES `screening` (`idscreening`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



----------- reserved seats------------
CREATE TABLE `reserved_seats` (
  `idreserved_seats` int NOT NULL AUTO_INCREMENT,
  `seat_id` int NOT NULL,
  `screening_id` int NOT NULL,
  PRIMARY KEY (`idreserved_seats`),
  KEY `seat_id_FK_idx` (`seat_id`),
  KEY `screening_id` (`screening_id`),
  CONSTRAINT `screening_id` FOREIGN KEY (`screening_id`) REFERENCES `screening` (`idscreening`),
  CONSTRAINT `seat_id_FK` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`idseat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


----------- screening table------------
CREATE TABLE `screening` (
  `idscreening` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `audit_id` int NOT NULL,
  `screening_start` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `availibility` int NOT NULL,
  PRIMARY KEY (`idscreening`),
  KEY `event_fkid_idx` (`event_id`),
  KEY `audit_fkid_idx` (`audit_id`),
  CONSTRAINT `audit_fkid` FOREIGN KEY (`audit_id`) REFERENCES `auditorium` (`idauditorium`),
  CONSTRAINT `event_fkid` FOREIGN KEY (`event_id`) REFERENCES `events` (`idevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


----------- seat table------------
CREATE TABLE `seat` (
  `idseat` int NOT NULL AUTO_INCREMENT,
  `row` varchar(20) DEFAULT NULL,
  `number` int NOT NULL,
  `auditorium_d` int NOT NULL,
  PRIMARY KEY (`idseat`),
  KEY `auditorium_fkid_idx` (`auditorium_d`),
  CONSTRAINT `auditorium_fkid` FOREIGN KEY (`auditorium_d`) REFERENCES `auditorium` (`idauditorium`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


----------- users table------------
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci