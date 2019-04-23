ALTER TABLE PARTICIPER DROP FOREIGN KEY FK_PARTICIPER_COURSE;

ALTER TABLE `COURSE` CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT; 
  
ALTER TABLE PARTICIPER
  ADD CONSTRAINT FK_PARTICIPER_COURSE FOREIGN KEY (ID_COURSE) REFERENCES COURSE (ID);

INSERT INTO `VERSION` (`NUM`) VALUES ('6');
