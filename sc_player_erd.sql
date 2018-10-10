
/* Drop Tables */

DROP TABLE sc_player CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE sc_player
(
	-- 기본키
	scNum number NOT NULL,
	-- 선수이름
	scName varchar2(100) NOT NULL,
	-- 소속 팀 이름
	scTimname varchar2(100),
	-- 등번호
	scBacknum number(2,0) NOT NULL,
	-- 포지션
	scPosition varchar2(20) NOT NULL,
	-- 소속국가
	scCountry varchar2(50) NOT NULL,
	-- 키
	scHeight number(3,0) NOT NULL,
	-- 몸무게
	scWeight number(3,0) NOT NULL,
	-- 생년월일
	scBirthdat char(10) NOT NULL,
	-- 혈액형
	scBloodtype varchar2(20) NOT NULL,
	scDesc varchar2(2000),
	PRIMARY KEY (scNum)
);



/* Comments */

COMMENT ON COLUMN sc_player.scNum IS '기본키';
COMMENT ON COLUMN sc_player.scName IS '선수이름';
COMMENT ON COLUMN sc_player.scTimname IS '소속 팀 이름';
COMMENT ON COLUMN sc_player.scBacknum IS '등번호';
COMMENT ON COLUMN sc_player.scPosition IS '포지션';
COMMENT ON COLUMN sc_player.scCountry IS '소속국가';
COMMENT ON COLUMN sc_player.scHeight IS '키';
COMMENT ON COLUMN sc_player.scWeight IS '몸무게';
COMMENT ON COLUMN sc_player.scBirthdat IS '생년월일';
COMMENT ON COLUMN sc_player.scBloodtype IS '혈액형';



