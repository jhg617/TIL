
CREATE TABLE shop_T	(
  num		BIGINT			Not Null  AUTO_INCREMENT,
  category	 varchar(10)		Not Null,
  p_num		 varchar(10)		Not Null,
  p_name		 varchar(50)		Not Null,
  p_company varchar(50)		Not Null,
  p_price		 BIGINT			Not Null,
  p_saleprice 	BIGINT			Not Null,
  p_image_s	 varchar(50)		Null,
  p_image_l	 varchar(50)		Null,
  p_content	 varchar(4000)	Not Null,
  p_date		 date		Not Null,
  CONSTRAINT shop_t_pk PRIMARY KEY(num)
) ; 


insert into shop_t(category, p_num, p_name, p_company,
p_price, p_saleprice, p_image_s, 
p_image_l, p_content, p_date)
 values('sp003', 'RC-113',
'로체스 인라인','로체스',3200,1150,'pds1.jpg','pds1_z.jpg',
'바이오맥스 통풍 나일론-HGPU SHELL * 특수 충격 흡수 밑창 * 신발끈 메모리 버클 * 힐 락에 의한 신속한 신발끈 시스템 * 느린 메모리 포말에 의한 편안한 통풍성의 숨쉬는 라이너 * 쿨 통풍 시스템 * 통풍성의 인체공학적 신발밑창 * 손쉬운 엔트리 시스템(신기 편한 입구) * 몰디드 알루미늄 프레임 * 80mm 82a hyper dubbs 휠 * 강철 스페이서 * ABEC-5 베어링', NOW());

insert into shop_t(category, p_num, p_name, p_company,
p_price, p_saleprice, p_image_s, 
p_image_l, p_content, p_date)
 values('ele002', 'vC-13',
'사니PDP-TV','사니',9200,4750,'pds4.jpg','pds4_z.jpg',
'질러~ 질러! 
무조건 질러봐~ 후회 하지 않아~~',NOW());

insert into shop_t(category, p_num, p_name, p_company,
p_price, p_saleprice, p_image_s, 
p_image_l, p_content, p_date)
 values('ele002', 'vC-111',
'LG 디오스 오브제컬렉션','LG전자',2000000,1820000,'dios_s.PNG','dios_l.PNG',
'자주 먹는 음료, 우리아이 간식, 엄마와 아빠의 건강주스와 맥주 등을 보관하여 냉장고를 편리하게 사용할 수 있는 마법의 공간입니다.',NOW());
