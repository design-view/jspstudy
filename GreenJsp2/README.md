greenblog 

기능 : 회원가입, 로그인, 게시글보기, 게시글수정, 게시글삭제

컨트롤러 
UserController
회원가입페이지    
/user?cmd=join      ---> join.jsp로 연결
로그인              
/user?cmd=login     ---> login.jsp로 연결
로그아웃           
/user?cmd=logout    ---> 처리
회원정보수정      
/user?cmd=edit      ---> edit.jsp로 연결 
메소드 process
BoardController
게시글목록      
/board?cmd=list
상세보기         
/board?cmd=view
수정하기         
/board?cmd=edit
글등록            
/board?cmd=write
글삭제            
/board?cmd=delete

member 테이블
CREATE TABLE "MEMBER" (	
	"ID" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"PASS" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"REGIDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 PRIMARY KEY ("ID")
)
board 테이블
CREATE TABLE "GREENJSP"."BOARD" (	
	"NUM" NUMBER, 
	"TITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(2000 BYTE) NOT NULL ENABLE, 
	"ID" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"POSTDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VISITCOUNT" NUMBER(6,0), 
	 PRIMARY KEY ("NUM")
)
