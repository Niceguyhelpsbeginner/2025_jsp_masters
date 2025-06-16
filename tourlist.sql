-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.7.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- tourlist 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `tourlist` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `tourlist`;

-- 테이블 tourlist.comments 구조 내보내기
CREATE TABLE IF NOT EXISTS `comments` (
  `commentnum` int(11) NOT NULL AUTO_INCREMENT,
  `commented_post` int(11) NOT NULL,
  `commenter` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`commentnum`),
  KEY `commented_post` (`commented_post`),
  KEY `commenter` (`commenter`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`commented_post`) REFERENCES `posts` (`postnum`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`commenter`) REFERENCES `users` (`usernum`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- 테이블 데이터 tourlist.comments:~3 rows (대략적) 내보내기
DELETE FROM `comments`;
INSERT INTO `comments` (`commentnum`, `commented_post`, `commenter`, `content`, `created_at`) VALUES
	(1, 1, 1, '정말 유익한 글이네요. 감사합니다!', '2025-06-05 14:51:02'),
	(2, 1, 2, '이 장소에 대해 더 알고 싶어요!', '2025-06-05 14:51:02'),
	(3, 1, 3, '좋은 정보 공유해주셔서 고맙습니다.', '2025-06-05 14:51:02');

-- 테이블 tourlist.posts 구조 내보내기
CREATE TABLE IF NOT EXISTS `posts` (
  `postnum` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `views` int(11) DEFAULT 0,
  `like_count` int(11) DEFAULT NULL,
  `author_id` varchar(50) DEFAULT NULL,
  `image_path` varchar(512) DEFAULT NULL,
  `country` enum('Korea','Japan','France','USA','Thailand','Vietnam','Italy','Australia') DEFAULT NULL,
  PRIMARY KEY (`postnum`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- 테이블 데이터 tourlist.posts:~7 rows (대략적) 내보내기
DELETE FROM `posts`;
INSERT INTO `posts` (`postnum`, `title`, `content`, `created_at`, `views`, `like_count`, `author_id`, `image_path`, `country`) VALUES
	(1, '서울의 가을 명소', '가을에 가기 좋은 서울의 공원들을 소개합니다.', '2025-06-05 14:43:06', 0, 0, '1', '/images/seoul_autumn.jpg', NULL),
	(2, '도쿄 여행 후기', '도쿄에서 먹은 맛있는 음식들과 여행 코스를 공유합니다.', '2025-06-05 14:43:06', 0, 0, '2', '/images/tokyo_trip.jpg', NULL),
	(3, '프랑스 파리 여행기', '에펠탑 야경이 정말 아름다웠어요. 사진도 많아요!', '2025-06-05 14:43:06', 0, 0, '4', '/images/paris_night.jpg', NULL),
	(4, '제목', '내용', '2025-06-11 13:56:29', 0, 0, '2', NULL, 'Japan'),
	(5, '시험', 'fuck', '2025-06-11 14:03:48', 0, 0, '2', NULL, 'Korea'),
	(10, '김현준', '나는바보', '2025-06-12 16:29:21', 0, NULL, '1', NULL, 'Korea'),
	(17, 'adsadsadsds', 'ads', '2025-06-12 16:39:53', 0, NULL, '1', NULL, 'Korea');

-- 테이블 tourlist.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `usernum` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usernum`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- 테이블 데이터 tourlist.users:~9 rows (대략적) 내보내기
DELETE FROM `users`;
INSERT INTO `users` (`usernum`, `username`, `address`, `password`, `nickname`) VALUES
	(1, 'user01', '서울', 'password123', 'TravelerA'),
	(2, 'user02', '부산', 'mypassword', 'WandererB'),
	(3, 'user03', '인천', 'secretpass', 'ExplorerC'),
	(4, 'test', '서울', 'test', '여행자현준'),
	(5, '1', NULL, '1', '\'디폴트\''),
	(9, '3', NULL, '3', NULL),
	(10, 'seongjin', NULL, 'seongjin', NULL),
	(11, '4', NULL, '4', NULL),
	(12, '6', NULL, '6', NULL),
	(13, '7', NULL, '7', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
