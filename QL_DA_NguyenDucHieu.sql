set dateformat dmy
create database QuanLyDeAn
use QuanLyDeAn
Create	table NHANVIEN
(
	HOVN	nvarchar(15),
	TENLOT	nvarchar(15),
	TENNV	nvarchar(15) not null,
	MANV	char	(9) not null,
	NGSINH	Datetime,
	DCHI	nvarchar(30),
	PHAI	nvarchar(3),
	LUONG	float,
	MA_NQL	char(9),
	PHG	int,
	constraint PK_NHANVIEN primary key(MANV)
)

Create	table PHONGBAN
(
	TENPHG	nvarchar(15),
	MAPHG	int not null,
	TRPHG	char(9),
	NG_NHANCHUC Datetime
	constraint PK_PHONGBAN primary key(MAPHG)
)

Create table DIADIEM_PHG
(
	MAPHG	int,
	DIADIEM nvarchar(50)
	constraint PK_DIADIEM_PHG primary key (MAPHG, DIADIEM)
)

Create table DEAN
(
	TENDA	nvarchar(15),
	MADA	int,
	DDIEM_DA nvarchar(50),
	PHONG	int,
	constraint PK_DEAN primary key(MADA)
)

Create table PHANCONG
(
	MA_NVIEN char(9),
	MADA	 int,
	THOIGIAN float,
	constraint PK_PHANCONG primary key (MA_NVIEN, MADA)
)

Create	table THANNHAN
(
	MA_NVIEN char(9),
	TENTN	 nvarchar(15),
	PHAI	 nvarchar(3),
	NGSINH	Datetime,
	QUANHE 	nvarchar(15),
	constraint PK_THANNHAN primary key (MA_NVIEN, TENTN) 
)
----------------------------------*tao khoa ngoai*---------------------------
--tao khoa ngoai cho bang NHANVIEN
alter table NHANVIEN
add 
constraint FK_NHANVIEN_NHANVIEN foreign key(MA_NQL) references NHANVIEN(MANV),
constraint FK_NHANVIEN_PHONGBAN foreign key(PHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang PHONGBAN
alter table PHONGBAN
add
constraint FK_PHONGBAN_NHANVIEN foreign key(TRPHG) references NHANVIEN(MANV)
--tao khoa ngoai cho bang DIADIEM_PHG
alter table DIADIEM_PHG
add
constraint FK_DIADIEMPHG_PHONGBAN foreign key(MAPHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang DEAN
alter table DEAN
add
constraint FK_DEAN_PHONGBAN foreign key(PHONG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho PHANCONG
alter table PHANCONG
add
constraint FK_PHANCONG_DEAN foreign key(MADA) references DEAN(MADA),
constraint FK_PHANCONG_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
--tao khoa ngoai cho THANNHAN
alter table THANNHAN
add constraint FK_THANNHAN_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
--------------------------Chen du lieu -------------------------------------------
insert into NHANVIEN values(N'Vương Ngọc', N'Ngọc', N' Quyên', 
'888665555', '01/01/1965', N'45 Trưng Vương Hà Nội', N'Nữ', 55000, null, null)

insert into NHANVIEN values(N'Nguyễn', N'Thanh', N'Tùng', 
'333445555', '20/08/1962', N'222 Nguyễn Văn Cừ TPHCM', N'Nam', 40000, NULL, null) 

insert into NHANVIEN values(N'Lê', N'Thị', N'Nhàn', 
'987654321', '01/02/1967', N'291 Hồ Văn Huê TPHCM', N'Nữ', 43000, NULL, null)

insert into NHANVIEN values(N'Nguyễn', N'Mạnh', N'Hùng', 
'666884444', '04/03/1967', N'95 Bà Rịa Vũng Tàu', N'Nam', 38000, NULL, null)

insert into NHANVIEN values(N'Trần', N'Thanh', N'Tâm', 
'453453453', '04/05/1957', N'34 Mai Thị Lưu TPHCM', N'Nam', 25000, NULL, null) 

insert into NHANVIEN values(N'Bùi', N'Thúy', N'Vũ', 
'999887777', '11/03/1954', N'332 Nguyễn Thái Học TPHCM', N'Nam', 25000, NULL, null)

insert into NHANVIEN values(N'Trần', N'Hồng', N'Quang', 
'987987987', '01/09/1967', N'80 Lê Hồng Phong TPHCM', N'Nam', 25000, NULL, null) 

insert into NHANVIEN values(N'Đinh', N'Bá', N'Tiến', 
'123456789', '12/01/1960', N'119 Cống Quỳnh TPHCM', N'Nam', 30000, NULL, null) 

select * from NHANVIEN

-- nhap du lieu cho PHONGBAN

insert into PHONGBAN values(N'Nghiên Cứu', 5, '333445555', '22/05/1987')
insert into PHONGBAN values(N'Điều Hành', 4, '987987987', '01/01/1985')
insert into PHONGBAN values(N'Quản Lý', 1, '888665555', '19/06/1971')
SELECT * FROM PHONGBAN
--cap nhat lai du lieu PHONG cho nhan vien

update NHANVIEN set PHG = 5, MA_NQL='333445555' where  MANV = '123456789'
update NHANVIEN set PHG = 5, MA_NQL='888665555' where  MANV = '333445555'
update NHANVIEN set PHG = 4, MA_NQL='987654321' where  MANV = '999887777'
update NHANVIEN set PHG = 4, MA_NQL='888665555' where  MANV = '987654321'
update NHANVIEN set PHG = 5, MA_NQL='333445555' where  MANV = '453453453'
update NHANVIEN set PHG = 5, MA_NQL='333445555' where  MANV = '666884444'
update NHANVIEN set PHG = 4, MA_NQL='987654321' where  MANV = '987987987'
update NHANVIEN set PHG = 1 where  MANV = '888665555'

select * from NHANVIEN

--cap nhat du lieu cho bang DIADIEM_PHG

insert into DIADIEM_PHG values(1, 'TP HCM')
insert into DIADIEM_PHG values(4, 'HA NOI')
insert into DIADIEM_PHG values(5, 'VUNG TAU')

select * from DIADIEM_PHG

--cap nhat du lieu cho bang DEAN
insert into DEAN values(N'Sản phẩm X', 1, 'VUNG TAU', 5)
insert into DEAN values(N'Sản phẩm Y', 2, 'NHA TRANG', 5)
insert into DEAN values(N'Sản phẩm Z', 3, 'TP HCM', 5)
insert into DEAN values(N'Tin học hóa', 10, 'HA NOI', 4)
insert into DEAN values(N'Cáp Quang', 20, 'TP HCM', 1)
insert into DEAN values(N'Đào tạo', 30, 'HA NOI', 4)

select * from DEAN

--cap nhat du lieu cho bang THANNHAN
insert into THANNHAN values('333445555', N'Quang', N'Nữ', '05/04/1976', N'Con gái')
insert into THANNHAN values('333445555', N'Khang', N'Nam', '25/10/1973', N'Con trai')
insert into THANNHAN values('333445555', N'Dương', N'Nữ', '03/05/1948', N'Vợ chồng')
insert into THANNHAN values('987654321', N'Đăng', N'Nam', '19/02/1932', N'Vợ chồng')
insert into THANNHAN values('123456789', N'Duy', N'Nam', '01/01/1978', N'Con trai')
insert into THANNHAN values('123456789', N'Châu', N'Nữ', '30/12/1978', N'Con gái')
insert into THANNHAN values('123456789', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')

select * from THANNHAN

--chen du lieu cho bang PHANCONG
insert into PHANCONG values('123456789', 1, 32)
insert into PHANCONG values('123456789', 2, 8)
insert into PHANCONG values('666884444', 3, 40)
insert into PHANCONG values('453453453', 1, 20)
insert into PHANCONG values('453453453', 2, 20)
insert into PHANCONG values('333445555', 3,10)
insert into PHANCONG values('333445555', 10, 10)
insert into PHANCONG values('333445555', 20,10)
insert into PHANCONG values('999887777', 30,30)
insert into PHANCONG values('999887777', 10,10)
insert into PHANCONG values('987987987', 10, 35)
insert into PHANCONG values('987987987', 30,5)
insert into PHANCONG values('987654321', 30,10)
insert into PHANCONG values('987654321', 20,15)
insert into PHANCONG values('888665555', 20,null)

select * from	PHANCONG



-------------------------------------------Truy Vấn Cơ SỞ Dữ Liệu SQL--------------------------------------------------------------------------------------
--1. Cho ds nhân viên gồm họ tên, phái. 


--2. Cho ds nhân viên thuộc phòng số 5. 


--3. Cho ds nhân viên gồm mã nv, họ tên, phái của các nv thuộc phòng số 5. 



--4. Danh sach họ tên phái của các nv thuộc phòng ‘nghiên cứu’. 

--5. Cho ds các mã nhân viên có tham gia đề án số 10 hoặc 20. 

--6. Cho ds các mã nhân viên vừa có tham gia đề án số 10 vừa có tham gia đề án số 20. 
--7. Cho ds các mã nhân viên có tham gia đề án số 10 mà không có tham gia đề án số 20. 
--8. Cho biết danh sách thể hiện mọi nhân viên đều tham gia tất cả các đề án. 
--9. Cho ds các nhân viên và thông tin phòng ban mà nhân viên đó trực thuộc (mã nv, họ tên, mã phòng, tên phòng). 
--10. Cho ds các phòng ban và địa điểm phòng ban (mã pb, tên pb, địa điểm) 
--11. Cho danh sách các nhân viên thuộc phòng ‘Nghiên cứu’. 
--12. Đối với từng nv, cho biết họ tên ngày sinh và tên của nv phụ trách trực tiếp nhân viên đó. 
--13. Ds nv thuộc phòng 5 có tham gia đề án tên là ‘Sản phẩm X’. 
--14. Tương tự 5, thuộc phòng ‘nghiên cứu’ có tham gia đề án tên là ‘Sản phẩm X’. 
--15. GÁN: Cho biết có tất cả bao nhiêu nhân viên. 
--16. Cho biết mỗi phòng ban có bao nhiêu nhân viên (MAPB, TENPB, SLNV). 
--17. Cho biết tổng lương, số lượng nv, lương trung bình, lương bé nhất trong toàn công ty. 
--18. Ds nhân viên có tham gia đề án. 
--19. Ds nhân viên không có tham gia đề án nào. 
--20. Mỗi nv tham gia bao nhiêu đề án với tổng thời gian là bao nhiêu. 
--21. Ds nv có tham gia đề án tên là ‘Sản phẩm X ’ hoặc ‘Sản phẩm Y’. 
--22. Ds nv vừa có tham gia đề án tên ‘Sản phẩm X’ vừa có tham gia đề án ‘Sản phẩm Y’. 
--23. Ds nv có tham gia đề án tên ‘Sản phẩm X’ mà không có tham gia đề án tên là ‘Sản phẩm Y’. 
--24. Ds nv chỉ có tham gia đề án tên ‘Sản phẩm X’. 
--25. Ds các đề án chỉ do các nv thuộc phòng “Nghiên cứu” thực hiện. 
--26. Ds các nv có tham gia tất cả các đề án. Bài tập Cơ sở dữ liệu 2 
--27. Ds nv thuộc phòng ‘Nghiên cứu’ có tham gia tất cả các đề án do phòng số 5 chủ trì. 
--28. Cho biết lương trung bình của các phòng ban (mã, tên, lương TB). 
--29. Cho biết các phòng ban có lương trung bình > 2500. 
--30. Cho biết các phòng ban có chủ trì đề án có số nhân viên > 3 và có lương trung bình lớn hơn 2500. 
--31. Cho biết nhân viên nào có lương cao nhất trong từng phòng ban. 
--32. Cho biết phòng ban nào có lương trung bình cao nhất. 

		SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(NHANVIEN.LUONG) AS LUONGTB 
		FROM PHONGBAN 
		INNER JOIN NHANVIEN ON PHONGBAN.MAPHG = NHANVIEN.PHG 
		GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG 
		HAVING AVG(NHANVIEN.LUONG) = (
			SELECT MAX(LUONGTB) 
			FROM (
				SELECT AVG(NHANVIEN.LUONG) AS LUONGTB 
				FROM PHONGBAN 
				INNER JOIN NHANVIEN ON PHONGBAN.MAPHG = NHANVIEN.PHG 
				GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
			) 
		AS LUONGTB);

--33. Cho biết phòng ban nào có ít nhân viên nhất. 

		SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, COUNT(NHANVIEN.MANV) AS SOLUONG 
		FROM PHONGBAN 
		INNER JOIN NHANVIEN ON PHONGBAN.MAPHG = NHANVIEN.PHG 
		GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG 
		HAVING COUNT(NHANVIEN.MANV) = (
			SELECT MIN(SOLUONG) 
			FROM (
				SELECT COUNT(NHANVIEN.MANV) AS SOLUONG 
				FROM PHONGBAN 
				INNER JOIN NHANVIEN ON PHONGBAN.MAPHG = NHANVIEN.PHG 
				GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
			) 
		AS SOLUONG);
--34. Cho biết phòng ban nào có đông nhân viên nữ nhất. 
--35. Danh sách mã, tên của các phòng ban có chủ trì đề án tên là “SPX” lẫn “SPY”.

