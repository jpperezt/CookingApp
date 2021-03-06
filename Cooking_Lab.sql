/*****Cooking Application Database****/
/*****Tables Creation*******/
  DROP TABLE USER_APP;
  CREATE TABLE "USER_APP" 
   ("USER_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"USER_NAME" VARCHAR2(64 BYTE) NOT NULL ENABLE,
    "USER_PASSWORD" VARCHAR2(64 BYTE) NOT NULL ENABLE,
	"EMAIL" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"USER_TYPE" NUMBER(1,0) NOT NULL ENABLE,
	 PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "USER_TYPE_FK1" FOREIGN KEY ("USER_TYPE")
	  REFERENCES "USER_TYPE" ("USER_TYPE") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  

  CREATE TABLE "Cooking_Lab"."USER_TYPE" 
   ("USER_TYPE" NUMBER(1,0) NOT NULL ENABLE, 
	"USER_TYPE_DESC" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"CREATED_ON" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"UPDATED_ON" DATE, 
	"UPDATED_BY" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("USER_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;  
  
  DROP TABLE RECIPE;
  CREATE TABLE "RECIPE" 
   ("RECIPE_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"RECIPE_NAME" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"RECIPE_DESCRIPTION" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"CHEF_ID" NUMBER(10,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("RECIPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "CHEF_ID_FK1" FOREIGN KEY ("CHEF_ID")
	  REFERENCES "USER_APP" ("USER_ID") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS";  

DROP TABLE INGREDIENT;  
CREATE TABLE "INGREDIENT" 
   ("INGREDIENT_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"INGREDIENT_NAME" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"INGREDIENT_DESCRIPTION" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("INGREDIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS";

DROP TABLE INGREDIENT_X_RECIPE;   
CREATE TABLE "INGREDIENT_X_RECIPE" 
   ("RECIPE_ID" NUMBER(10,0) NOT NULL ENABLE,
    "INGREDIENT_ID" NUMBER(10,0) NOT NULL ENABLE,
	 PRIMARY KEY ("RECIPE_ID", "INGREDIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE,
   CONSTRAINT "RECIPE_ID_FK1" FOREIGN KEY ("RECIPE_ID")
	  REFERENCES "RECIPE" ("RECIPE_ID") ENABLE,
    CONSTRAINT "INGREDIENT_ID_FK1" FOREIGN KEY ("INGREDIENT_ID")
	  REFERENCES "INGREDIENT" ("INGREDIENT_ID") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS";   

DROP TABLE COMMENTS;
CREATE TABLE "COMMENTS" 
   ("COMMENT_ID" NUMBER(10,0) NOT NULL ENABLE,
    "USER_ID" NUMBER(10,0) NOT NULL ENABLE,
    "COMMENT_TEXT" VARCHAR2(2000) NOT NULL ENABLE,
    "DATE_POSTED" DATE NOT NULL ENABLE,
	 PRIMARY KEY ("COMMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE,
   CONSTRAINT "USERAPP_ID_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USER_APP" ("USER_ID") ENABLE  
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS";

DROP TABLE COMMENTS_X_RECIPE;
CREATE TABLE "COMMENTS_X_RECIPE" 
   ("RECIPE_ID" NUMBER(10,0) NOT NULL ENABLE,
    "COMMENT_ID" NUMBER(10,0) NOT NULL ENABLE,
	 PRIMARY KEY ("RECIPE_ID", "COMMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE,
   CONSTRAINT "COMMENTSRECIPE_ID_FK1" FOREIGN KEY ("RECIPE_ID")
	  REFERENCES "RECIPE" ("RECIPE_ID") ENABLE,
    CONSTRAINT "COMMENTSRECIPE_ID_FK2" FOREIGN KEY ("COMMENT_ID")
	  REFERENCES "COMMENTS" ("COMMENT_ID") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"; 
  
/***Sequences***/
create sequence cooking_users_seq;  
create sequence recipe_seq;  
select cooking_users_seq.nextval from dual;
select recipe_seq.nextval from dual;  
  