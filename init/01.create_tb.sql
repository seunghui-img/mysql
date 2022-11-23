-- DB 추가 (스키마)
CREATE DATABASE IF NOT EXISTS `sample`;

-- DB 권한, 사용자 설정
GRANT ALL ON `sample`.* TO 'admin'@'%';

-- SAMPLE 스키마에 테이블 생성
USE SAMPLE;

-- 코드 그룹 관리
CREATE TABLE IF NOT EXISTS `TB_CD_GRP` (
	`CD_GRP_SEQ`		INT				NOT NULL	AUTO_INCREMENT	COMMENT '코드그룹 일련번호',
	`CD_GRP_NM`			VARCHAR(30)		NOT NULL					COMMENT '코드그룹명(LABEL)',
	`DB_COL_NM`			VARCHAR(30)									COMMENT 'DB 컬럼명',
	`LOW_CD_GRP_SEQ`	INT											COMMENT '하위코드그룹 일련번호',
	`LEVEL`				INT											COMMENT '레벨',
	`HIDDEN_YN`			CHAR(1)			DEFAULT 'N'					COMMENT '숨김여부',
	`DEL_YN`			CHAR(1)			DEFAULT 'N'					COMMENT '삭제여부',
	`SORT_NO`			INT				DEFAULT 0					COMMENT '순서',
	`DESC`				VARCHAR(300)								COMMENT '설명',
	`CRTD_DT`			DATETIME		DEFAULT current_timestamp	COMMENT '등록일시',
	`CRTD_LOGIN_ID`		VARCHAR(50)									COMMENT '등록 로그인아이디',
	`UPD_DT`			DATETIME									COMMENT '수정일시',
	`UPD_LOGIN_ID`		VARCHAR(50)									COMMENT '수정 로그인아이디',
	
	PRIMARY KEY(`CD_GRP_SEQ`)
);

-- 코드 상세 관리
CREATE TABLE IF NOT EXISTS `TB_CD_DTL` (
	`CD_SEQ`		INT				NOT NULL	AUTO_INCREMENT	COMMENT '코드 일련번호',
	`CD_GRP_SEQ`	INT				NOT NULL					COMMENT '코드그룹 일련번호',
	`CD_NM`			VARCHAR(30)		NOT NULL					COMMENT '코드명',
	`CODE`			VARCHAR(30)		NOT NULL					COMMENT '코드',
	`VALUE`			VARCHAR(20)		NOT NULL					COMMENT '코드값',
	`HIDDEN_YN`		CHAR(1)			DEFAULT 'N'					COMMENT '숨김여부',
	`DEL_YN`		CHAR(1)			DEFAULT 'N'					COMMENT '삭제여부',
	`SORT_NO`		INT				DEFAULT 0					COMMENT '순서',
	`DESC`			VARCHAR(300)								COMMENT '설명',
	`CRTD_DT`		DATETIME		DEFAULT current_timestamp	COMMENT '등록일시',
	`CRTD_LOGIN_ID`	VARCHAR(50)									COMMENT '등록 로그인아이디',
	`UPD_DT`		DATETIME									COMMENT '수정일시',
	`UPD_LOGIN_ID`	VARCHAR(50)									COMMENT '수정 로그인아이디',
	
	PRIMARY KEY(`CD_SEQ`),
	FOREIGN KEY(`CD_GRP_SEQ`) REFERENCES TB_CD_GRP(`CD_GRP_SEQ`) on update cascade
);