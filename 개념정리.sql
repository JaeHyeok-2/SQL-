# Alter  사용법
 
# 테이블 이름 바꾸기
ALTER TABLE (테이블 이름 ) RENAME (바꾸기전 테이블명 ) TO (바꾸고자하는 테이블이름)

# 테이블에 존재하는 Column의 데이터 타입변경
ALTER TABLE (테이블명) MODIFY (바꾸고자하는 COLUMN) (바꾸고자하는 자료형);

# 각 테이블의 Tuple들의 특정 열값 변경 
UPDATE (테이블 이름) SET (튜플의 열의 값 ex) major =10 ) WHERE (이전 튜플의 열값 ex)major = "컴공")
컴공-> 10으로 바뀜

# 테이블에 컬럼 추가
ALTER TABLE (테이블 명)  ADD (컬럼이름)  ( 자료형) ( NOT NULL 등등)

#테이블의 컬럼삭제
ALTER TABLE 테이블 명 DROP COLUMN 컬럼이름



#NOW() 함수 사용
1. 각 ROW 마다 시간값에 관한 처리를 다르게 해줄경우 = NOW() 함수 사용 
2. 그럴필요가없고, 굳이 시간값을 별도로 신경쓰기 싫다 
		: DEFAULT CURRENT_TIMESTAMP 속성과, ON UPDATE CURRENT_TIMESTAMP 
		

#UNIQUE 속성 주기

ALTER TABLE (테이블명) ADD 


#테이블에 CONSTRAINT 걸기 
ALTER TABLE (테이블 명 )
	ADD CONSTRAINT (제약이름 ex) st_rule) CHECK (제약이름 < 조건 이런식);
#문자열에 반드시 @가 포함 and 성별은 m ,f중 하나 반드시선택 하는 st_rule 생성	
ALTER TABLE student ADD CONSTRAINT st_rule CHECK(email LIKE '%@%') AND gender IN('m','f');
 
 
 #컬럼을 가장 앞으로 당기기(주로 PK에)
 ALTER TABLE (테이블 명) MODIFY (컬럼명) (자료 특징) FIRST; 사용
 ex) ALTER TABLE player_info MODIFY id INT NOT NULL AUTO_INCREMENT FIRST;
 
 #특정컬럼을 특정 컬럼 뒤로
 ALTER TABLE 테이블명 MODIFY (뒤로갈 컬럼) AFTER ( 기준컬럼)
 
 ALTER TABLE player_info MODIFY role CHAR(5) NULL AFTER NAME;
 
 
 
 # CHANGE를 사용하여 RENAME,MODIFY 한꺼번에
 a. 이름을role 에서  POSITION으로 바꾸고 ,
 b. 동시에 데이터타입을 CHAR->Varchar로
ALTER TABLE player_info CHANGE role `position` VARCHAR(2) NOT NULL;


# 테이블 컬럼 구조만 복사하기
CREATE TABLE copy_of_undergraduate LIKE undergraduate; 를실행시,
copy_of_undergraduate 에는 undergraduate의 컬럼들을 그대로 가져오지만 , ROW 가져오지않는다.

# row 값도 가져오기
CREATE TABLE copy_of_undergraduate LIKE undergraduate;
INSERT INTO copy_of_undergraduate SELEct * from undergraduate
WHERE major = 101; 이런식으로


