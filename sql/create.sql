SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

grant all privileges on crec.* to crec@localhost identified by 'atamishi';


CREATE SCHEMA IF NOT EXISTS `crec`;
USE `crec` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tweet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crec`.`Route` (
      id int not null auto_increment,
      name text,
      distance decimal(5,3) not null,
      g LINESTRING NOT NULL,
      create_user text,
      create_at datetime,
      primary key (id),
      spatial key (g)
      )  ENGINE=MYISAM;
 
INSERT INTO Route
			(id, distance,name, g,create_user)
			VALUES (
			1,
			12.324,
			'test',
			GeomFromText('LINESTRING(35.69098179364277 139.75246667861938,35.691010000000006 139.75253,35.690670000000004 139.7528,35.69053 139.75291,35.69046 139.75277,35.6905 139.75277,35.69064 139.75266000000002))'),
			'tatsumi'
			);

