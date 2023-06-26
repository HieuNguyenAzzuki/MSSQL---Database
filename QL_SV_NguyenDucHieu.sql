﻿---@Author By HieuNguyenDuc NTTU----------------------------------------------------------------

---Định dạng ngày, tháng, năm
SET DATEFORMAT DMY

--- Database
CREATE DATABASE QL_SV

---Chọn Database hiện hành
USE QL_SV

---Tạo Table cho các bảng
CREATE TABLE KHOA
(
	MAKH	VARCHAR(2)		NOT NULL PRIMARY KEY,
	TENKH	NVARCHAR(50)	NOT NULL unique
)

create table MonHoc
(
	Mamh	varchar(2)		not null primary key,
	Tenmh	nvarchar(50)	not null,
	SoTiet	int				not null check (SoTiet in (30,45,60))
) 

create table SinhVien
(
	Masv		varchar(3)		not null primary key,
	Hosv		nvarchar(50)	not null,
	Tensv		nvarchar(50)	not null,
	Phai		int				not null check(Phai in (1, 0)),
	NgaySinh	datetime		not null,
	NoiSinh		nvarchar(50)	not null,
	Makh		varchar(2)		not null,
	Hocbong		int
)
alter table SinhVien add constraint FK_SV_Kh foreign key (Makh) references Khoa (Makh)

create table KetQua
(
	Masv		varchar(3)	not null,
	Mamh		varchar(2)	not null,
	Diem		real		not null check(Diem between 0 and 10)
)
alter table KetQua add constraint PK_KQ primary key (Masv, Mamh)
alter table KetQua add constraint FK_KQ_SV foreign key (Masv) references SinhVien (Masv)
alter table KetQua add constraint FK_KQ_MH foreign key (Mamh) references MonHoc (Mamh)

---Thêm dữ liệu vào Table Khoa
insert into Khoa values ('AV',N'Anh Văn')
insert into Khoa values ('LS',N'Lịch sử')
insert into Khoa values ('TH',N'Tin học')
insert into Khoa values ('TR',N'Triết')
insert into Khoa values ('VL',N'Vật lý')
insert into Khoa values ('SH',N'Sinh học')
select * from Khoa

insert into SinhVien values('A01',N'Nguyễn Thu',N'Hải',0,'23/02/1980',N'TP.HCM','AV',100000)
insert into SinhVien values('A02',N'Trần Văn',N'Chính',1,'24/12/1982',N'TP.HCM','TH',100000)
insert into SinhVien values('A03',N'Lê Thu Bạch',N'Yến',0,'21/02/1982',N'Hà Nội','AV',140000)
insert into SinhVien values('A04',N'Trần Anh',N'Tuấn',1,'08/12/1984',N'Long An','LS',80000)
insert into SinhVien values('A05',N'Trần Thanh',N'Triều',1,'01/02/1980',N'Hà Nội','VL',80000)
insert into SinhVien values('B01',N'Trần Thanh',N'Mai',0,'20/12/1981',N'Bến Tre','TH',200000)
insert into SinhVien values('B02',N'Trần Thị Thu',N'Thủy',0,'13/02/1982',N'TP.HCM','TH',null)
insert into SinhVien values('B03',N'Trần Thị',N'Thanh',0,'31/12/1982',N'TP.HCM','TH',50000)
insert into SinhVien values('B04',N'Trương Hoàng',N'Long',1,'1980-06-19',N'TP.HP','AV',70000)
select * from SinhVien

insert into MonHoc values ('01',N'Nhập môn máy tính',30)
insert into MonHoc values ('02',N'Trí tuệ nhân tạo',45)
insert into MonHoc values ('03',N'Truyền tin',45)
insert into MonHoc values ('04',N'Đồ họa',60)
insert into MonHoc values ('05',N'Văn phạm',45)
insert into MonHoc values ('06',N'Đàm thoại',30)
insert into MonHoc values ('07',N'Vật lý nguyên tử',30)
select * from MonHoc

insert into KetQua values('A01','01',10)
insert into KetQua values('A01','02',4)
insert into KetQua values('A01','04',2)
insert into KetQua values('A01','05',9)
insert into KetQua values('A01','06',3)
insert into KetQua values('A02','01',5)
insert into KetQua values('A02','04',2)
insert into KetQua values('A03','02',5)
insert into KetQua values('A03','04',10)
insert into KetQua values('A03','06',1)
insert into KetQua values('A04','02',4)
insert into KetQua values('A04','04',6)
insert into KetQua values('B01','01',0)
insert into KetQua values('B01','04',8)
insert into KetQua values('B02','03',6)
insert into KetQua values('B02','04',8)
insert into KetQua values('B03','04',4)
insert into KetQua values('B03','02',10)
insert into KetQua values('B03','03',9)
insert into KetQua values('B04','03',9)
insert into KetQua values('B04','01',5)
select * from KetQua
-----------------------Truy vấn dữ liệu các bảng-------------------------


select * from Khoa
select * from SinhVien
select * from MonHoc
select * from KetQua



-------------------------------------------Truy Vấn Cơ SỞ Dữ Liệu SQL--- Author By HieuNguyenDuc - NTTU --------------------------------------------------------------------------------------

--A.	Viết những truy vấn lọc và sắp xếp dữ liệu sau bằng ngôn ngữ SQL

use db_QLSV;

---1.   Cho biết danh sách các môn học, gồm các thông tin sau: Mã môn học, Tên môn học, Số tiết

		SELECT mamh as N'Mã môn học', tenmh as N'Tên môn học',sotiet as N'Số tiết'
        FROM monhoc;

---2.   Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần.

        SELECT masv as N'Mã sinh viên', hosv+tensv as N'Họ và tên sinh viên', hocbong as N'Học bổng'
        FROM sinhvien
        ORDER BY masv ASC;

---3.   Danh sách các sinh viên, gồm các thông tin sau: Mã sinh viên, Tên sinh viên, Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ

		SELECT masv as N'Mã sinh viên', tensv as N'Tên sinh viên', phai as N'Giới tính', NgaySinh as N'Ngày sinh'
        FROM SinhVien
        ORDER BY Phai ASC;

---4.   Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần

        SELECT hosv+tensv as N'Họ và tên sinh viên', ngaysinh as N'Ngày sinh', hocbong as N'Học bổng'
		FROM sinhvien
		ORDER BY NgaySinh ASC, HocBong DESC;

---5.   Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên môn, Số tiết

		SELECT mamh as N'Mã môn học', tenmh as N'Tên môn học' , sotiet as N'Số tiết'
		FROM monhoc
		WHERE tenmh like  'T%'

---6.   Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Phái

		SELECT hosv+tensv as N'Họ và tên sinh viên', ngaysinh as N'Ngày sinh', phai as N'Giới tính'
		FROM sinhvien
		WHERE tensv like '%I'

---7.   Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các thông tin: Mã khoa, Tên khoa

		SELECT makh as N'Mã khoa', tenkh as N'Tên khoa'
		FROM khoa
		WHERE tenkh like '_N%'

---8.   Liệt kê những sinh viên mà họ có chứa chữ Thị

		SELECT *
		FROM sinhvien
		WHERE hosv+tensv like N'%Thị%'

---9.   Cho biết danh sách những sinh viên ký tự đầu tiên của tên nằm trong khoảng từ a đến m, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Phái, Học bổng.

		SELECT masv as N'Mã sinh viên', hosv+tensv as N'Họ và tên sinh viên', phai as N'Giới tính', hocbong as N'Học bổng'
		FROM sinhvien
		WHERE SUBSTRING(hosv+tensv, 1, 1) BETWEEN 'a' AND 'm';

---10. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến m, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách được sắp xếp tăng dần theo Họ tên sinh 

		SELECT hosv+tensv as N'Họ và tên sinh viên', NgaySinh as N'Ngày sinh', NoiSinh as N'Nơi sinh', HocBong as N'Học bổng'
		FROM sinhvien
		WHERE hosv+tensv LIKE '%[a-m]%'
		ORDER BY hosv+tensv ASC;

---11. Cho biết danh sách các sinh viên của khoa Anh văn, gồm các thông tin sau: Mã sinh viên, Họ tên sinh viên, Ngày sinh, Mã khoa

		SELECT masv as N'Mã sinh viên', hosv+tensv as N'Họ và tên sinh viên', NgaySinh as N'Ngày sinh', makh as N'Mã khoa'
		FROM sinhvien
		WHERE makh = 'AV';

---12. Liệt kê danh sách sinh viên của khoa Vật Lý, gồm các thông tin sau: Mã sinh viên, Họ tên sinh viên, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Ngày sinh giảm dần

		SELECT masv as N'Mã sinh viên', hosv+tensv as N'Họ và tên sinh viên', NgaySinh as N'Ngày sinh', makh as N'Mã khoa'
		FROM sinhvien
		WHERE makh = 'VL'
		ORDER BY ngaysinh DESC;

---13. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã khoa giảm dần

		SELECT masv as N'Mã sinh viên', hosv+tensv as N'Họ và tên sinh viên', makh as N'Mã khoa', hocbong as N'Học bổng' 
		FROM sinhvien
		WHERE hocbong > 100000 
		ORDER BY makh DESC;

---14. Liệt kê danh sách sinh viên sinh vào ngày 20/12/1981, gồm các thông tin: Họ tên sinh viên, Mã khoa, Tên khoa, Học bổng

		SELECT SinhVien.hosv+tensv as N'Họ và tên sinh viên', SinhVien.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa', SinhVien.hocbong as N'Học bổng'
        FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE SinhVien.ngaysinh = '1981-12-20';

---15. Liệt kê kết quả học tập các môn của sinh viên khoa Anh Văn, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Tên môn, Điểm. Danh sách được sắp xếp giảm dần theo Họ tên sinh viên

		SELECT SinhVien.hosv+tensv as N'Họ và tên sinh viên', SinhVien.NgaySinh as N'Ngày sinh', MonHoc.tenmh as N'Tên môn học', KetQua.diem as N'Điểm'
		FROM SinhVien
		JOIN KetQua ON SinhVien.masv = KetQua.masv
		JOIN MonHoc ON KetQua.mamh = MonHoc.mamh
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE Khoa.tenkh = N'Anh Văn'
		ORDER BY SinhVien.hosv+tensv DESC;

---16. Liệt kê danh sách sinh viên trong khoa Tin học, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Mã khoa, Tên khoa, Mã môn, Điểm. Danh sách được sắp giảm dần theo Điểm, nếu cùng điểm thì sắp tăng dần theo Mã môn.

		SELECT SinhVien.hosv+tensv as N'Họ và tên sinh viên', SinhVien.NgaySinh, SinhVien.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa', MonHoc.mamh as N'Mã môn', KetQua.Diem as N'Điểm'
		FROM SinhVien
		JOIN KetQua ON SinhVien.masv = KetQua.masv
		JOIN MonHoc ON KetQua.mamh= MonHoc.mamh
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE Khoa.tenkh = N'Tin học'
		ORDER BY KetQua.Diem DESC, MonHoc.mamh ASC;

--B.	Viết những truy vấn lọc và sắp xếp dữ liệu sau bằng ngôn ngữ SQL

---1.   Cho biết các sinh viên sinh sau ngày 20/12/1981, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự ngày sinh giảm dần

		SELECT hosv+tensv as N'Họ và tên sinh viên', ngaysinh as N'Ngày sinh', noisinh as N'Nơi sinh', hocbong as N'Học bổng'
		FROM sinhvien
		WHERE ngaysinh > '1981-12-20'
		ORDER BY ngaysinh DESC 

---2.   Liệt kê các sinh viên có học bổng lớn hơn 100,000 và sinh ở TP.HCM, gồm các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng

		SELECT hosv+tensv as N'Họ và tên sinh viên', makh as N'Mã khoa', noisinh as N'Nơi sinh', hocbong as N'Học bổng'
		FROM sinhvien
		WHERE hocbong > 100000 and  noisinh = 'TP.HCM'

---3.   Danh sách các sinh viên của khoa Anh văn và khoa Triết, gồm các thông tin: Mã sinh viên, Mã khoa, Phái

		SELECT masv as N'Mã sinh viên', makh as N'Mã khoa', phai as N'Giới tính'
		FROM sinhvien
		WHERE makh in ('AV', 'TR')

---4.   Cho biết những sinh viên có ngày sinh từ ngày 01/01/1978 đến  ngày 05/06/1983, gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng

		SELECT masv as N'Mã sinh viên', ngaysinh as N'Ngày sinh', noisinh as N'Nơi sinh', hocbong as N'Học bổng'
		FROM sinhvien
		WHERE ngaysinh between '1978-01-01' and '1983-06-05'

---5.   Danh sách những sinh viên có học bổng từ 200,000 xuống đến 80,000, gồm các thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa

		SELECT masv as N'Mã sinh viên', ngaysinh as N'Ngày sinh', phai as N'Giới tính', makh as N'Mã khoa'
		FROM sinhvien
		WHERE hocbong between 80000 and 200000
		ORDER BY hocbong DESC

---6.   Cho biết những môn học có số tiết lớn hơn 40 và nhỏ hơn 60, gồm các thông tin: Mã môn học, Tên môn học, Số tiết

		SELECT mamh as N'Mã môn học',tenmh as N'Tên môn học', sotiet as N'Số tiết'
		FROM monhoc
		WHERE sotiet > 40 and sotiet < 60

---7.   Liệt kê các nam sinh viên của khoa Anh văn, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Phái

		SELECT masv as N'Mã sinh viên', hosv+tensv as N'Họ và tên sinh viên', phai as N'Giới tính'
		FROM sinhvien
		WHERE makh  = 'AV' and phai = 1

---8.   Danh sách sinh viên có nơi sinh ở Hà Nội và ngày sinh sau ngày 01/01/1982, gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh

		SELECT hosv+tensv as N'Họ và tên sinh viên', noisinh as N'Nơi sinh', ngaysinh as N'Ngày sinh'
		FROM sinhvien
		WHERE noisinh = N'Hà Nội' and ngaysinh > '1982-01-01'

---9.   Liệt kê những sinh viên nữ, tên có chứa chữ N

		SELECT *
		FROM sinhvien
		WHERE phai = 0 and tensv = 'N'
---10. Danh sách các nam sinh viên khoa Tin Học có ngày sinh sau ngày 30/05/1981

		SELECT *
		FROM sinhvien
		WHERE phai = 1 and makh = 'TH' and ngaysinh > '1981-05-30'

---11. Liệt kê kết quả học tập môn Trí tuệ nhân tạo của các sinh viên khoa Anh Văn, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Tên môn, Điểm. Danh sách được sắp xếp giảm dần theo Họ tên sinh viên

		SELECT hosv+tensv as N'Họ và tên sinh viên', ngaysinh as N'Ngày sinh', tenmh as N'Tên môn học', diem as N'Điểm'
		FROM sinhvien 
		JOIN ketqua ON sinhvien.masv = sinhvien.masv
		JOIN monhoc ON ketqua.mamh = monhoc.mamh
		WHERE sinhvien.makh = 'AV' and  monhoc.tenmh = N'Trí tuệ nhân tạo'
		ORDER BY hosv+tensv DESC

		---Câu hỏi thêm--- Liệt kê kết quả học tập của sinh viên gồm: Họ và tên sinh viên, Điểm, Mã môn học, Tên môn học

		SELECT hosv+tensv as N'Họ và tên sinh viên', diem as N'Điểm', monhoc.mamh as N'Mã môn học', monhoc.tenmh as N'Tên môn học'
		FROM sinhvien 
		JOIN ketqua ON sinhvien.masv = sinhvien.masv
		JOIN monhoc ON ketqua.mamh = monhoc.mamh

---12. Liệt kê danh sách sinh viên trong khoa Tin học, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Mã khoa, Tên khoa, Mã môn, Tên môn, Điểm. Danh sách được sắp giảm dần theo Điểm, nếu cùng điểm thì sắp tăng dần theo Mã môn.

		SELECT hosv+tensv as N'Họ và tên sinh viên', ngaysinh as N'Ngày sinh', khoa.makh as N'Mã khoa', tenkh as N'Tên khoa', monhoc.mamh as N'Mã môn học', tenmh as N'Tên môn học', diem as N'Điểm'
		FROM sinhvien
		JOIN khoa on sinhvien.makh = khoa.makh
		JOIN ketqua on sinhvien.masv  = ketqua.masv
		JOIN monhoc on ketqua.mamh = monhoc.mamh
		WHERE khoa.tenkh = N'Tin học'
		ORDER BY ketqua.diem DESC, monhoc.mamh ASC;

--C.   Tạo truy vấn  dữ liệu sau có sử dụng hàm trong truy vấn dữ liệu

---1.   Liệt kê danh sách sinh viên gồm các thông tin sau: Họ và tên sinh viên, Giới tính, Ngày sinh. Trong đó Giới tính hiển thị ở dạng Nam/Nữ tuỳ theo giá trị của field Phai là Yes hay No

		SELECT hosv+tensv as N'Họ và tên sinh viên', 
			   CASE WHEN Phai = '1' THEN N'Nam' ELSE N'Nữ' END AS N'Giới tính', 
			   NgaySinh as N'Ngày sinh'
		FROM SinhVien

---2.   Cho biết danh sách sinh viên gồm các thông tin sau: Mã sinh viên, Tuổi, Nơi sinh, Mã khoa. Trong đó Tuổi sẽ được tính bằng cách lấy năm hiện hành trừ cho năm sinh

		SELECT masv as N'Mã sinh viên', 
			   YEAR(GETDATE()) - YEAR(ngaysinh) AS N'Tuổi', 
			   NoiSinh as N'Nơi sinh', 
               makh as N'Mã khoa'
		FROM SinhVien;

---3.   Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi, Học bổng
		
		SELECT hosv+tensv as N'Họ và tên sinh viên', 
		       YEAR(GETDATE()) - YEAR(NgaySinh) AS N'Tuổi', 
			   HocBong as N'Học bổng'
		FROM SinhVien
		WHERE YEAR(GETDATE()) - YEAR(NgaySinh) > 20;

---4.   Liệt kê danh sách những sinh viên có tuổi từ 20 đến 30, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa

		SELECT hosv+tensv as N'Họ và tên sinh viên', 
               YEAR(GETDATE()) - YEAR(NgaySinh) AS N'Tuổi', 
               tenkh as N'Tên khoa'
		FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE YEAR(GETDATE()) - YEAR(NgaySinh) BETWEEN 20 AND 30;

---5.   Liệt kê danh sách sinh viên gồm các thông tin sau: Họ và tên sinh viên, Giới tính, Tuổi, Mã khoa. Trong đó Giới tính hiển thị ở dạng Nam/Nữ tuỳ theo giá trị của field Phai là Yes hay No, Tuổi sẽ được tính bằng cách lấy năm hiện hành trừ cho năm sinh. Danh sách sẽ được sắp xếp theo thứ tự Tuổi giảm 

		SELECT hosv+tensv as N'Họ và tên sinh viên', 
               CASE WHEN Phai = '1' THEN N'Nam' ELSE N'Nữ' END AS N'Giới tính', 
               YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, 
               makh as N'Mã khoa'
		FROM SinhVien
		ORDER BY Tuoi  DESC;

---6.   liệt kê danh sách sinh viên sinh vào tháng 2 năm 1980, gồm các thông tin: Họ tên sinh viên, Phái, Ngày sinh. Trong đó, Ngày sinh chỉ lấy giá trị ngày của field NGAYSINH. Sắp xếp dữ liệu giảm dần theo cột Ngày sinh
		
		SELECT hosv+tensv as N'Họ và tên sinh viên',
			   Phai as N'Giới tính', 
               DAY(NgaySinh) AS N'Ngày sinh'
		FROM SinhVien
		WHERE MONTH(NgaySinh) = 2 AND YEAR(NgaySinh) = 1980
		ORDER BY NgaySinh DESC;

---7.   Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 100,000 và ngược lại hiển thị là “Mức trung bình”

		SELECT masv as N'Mã sinh viên', 
			   Phai as N'Giới tính', 
               makh as N'Mã khoa', 
               CASE WHEN HocBong > 100000 THEN N'Học bổng cao' ELSE N'Mức trung bình' END AS N'Mức học bổng'
		FROM SinhVien;

---8.   Cho biết điểm thi của các sinh viên, gồm các thông tin: Họ tên sinh viên, Mã môn học, Điểm. Kết quả sẽ được sắp theo thứ tự Họ tên sinh viên và mã môn học tăng dần

		SELECT hosv+tensv as N'Họ và tên sinh viên', 
               mamh as N'Mã môn học', 
               diem as N'Điểm'
		FROM ketqua
		JOIN SinhVien ON ketqua.masv = SinhVien.masv
		ORDER BY hosv+tensv ASC, mamh ASC;

---9.   Danh sách sinh viên của khoa Anh văn, điều kiện lọc phải sử dụng tên khoa, gồm các thông tin sau: Họ tên sinh viên, Giới tính, Tên khoa. Trong đó, Giới tính sẽ hiển thị dạng Nam/Nữ
		
		SELECT hosv+tensv as N'Họ và tên sinh viên', 
		       CASE WHEN Phai = '1' THEN N'Nam' ELSE N'Nữ' END AS N'Giới tính', 
               tenkh as N'Tên khoa'
		FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE tenkh = N'Anh văn';


---10. Liệt kê bảng điểm của sinh viên khoa Tin Học, gồm các thông tin: Tên khoa, Họ tên sinh viên, Tên môn học, Sốt tiết, Điểm

		SELECT tenkh as N'Tên khoa', 
               hosv+tensv as N'Họ và tên sinh viên', 
               tenmh as N'Tên môn học', 
               SoTiet as N'Số tiết', 
               Diem as N'Điểm'
		FROM ketqua
        JOIN SinhVien ON ketqua.masv = SinhVien.masv
        JOIN MonHoc ON ketqua.mamh = MonHoc.mamh
        JOIN Khoa ON SinhVien.makh = Khoa.makh
        WHERE tenkh = N'Tin Học';

---11. Kết quả học tập của sinh viên, gồm các thông tin: Họ tên sinh viên, Mã khoa, Tên môn học, Điểm thi, Loại. Trong đó, Loại sẽ là Giỏi nếu điểm thi > 8, từ 6 đến 8 thì Loại là Khá, nhỏ hơn 6 thì loại là Trung Bình

		SELECT hosv+tensv as N'Họ và tên sinh viên', 
               makh as N'Mã khoa', 
               tenmh as N'Tên môn học', 
               diem as N'Điểm',
               CASE 
                   WHEN diem > 8 THEN N'Giỏi'
                   WHEN diem >= 6 THEN N'Khá'
                   ELSE N'Trung Bình'
			   END AS N'Loại'
		FROM ketqua
		JOIN monhoc ON ketqua.mamh = monhoc.mamh
		JOIN SinhVien ON ketqua.masv = SinhVien.masv;

--D.   tạo các truy vấn tính toán thống kê dữ liệu

---1.   Cho biết trung bình điểm thi theo từng môn, gồm các thông tin: Mã môn, Tên môn, Trung bình điểm thi

		SELECT monhoc.mamh as N'Mã môn học', tenmh as N'Tên môn học', AVG(Diem) AS N'Trung bình điểm thi'
		FROM ketqua
		JOIN monhoc ON ketqua.mamh = monhoc.mamh
		JOIN sinhvien ON sinhvien.masv = ketqua.masv
		GROUP BY monhoc.mamh, tenmh;


---2.   Danh sách số môn thi của từng sinh viên, gồm các thông tin: Họ tên sinh viên, Tên khoa, Tổng số môn thi

	    SELECT hosv+tensv as N'Họ và tên sinh viên', tenkh as N'Tên khoa', COUNT(*) AS N'Tổng số môn thi'
		FROM SinhVien
		JOIN ketqua ON SinhVien.masv = ketqua.masv
		JOIN khoa ON khoa.makh = sinhvien.makh
		GROUP BY hosv+tensv, tenkh;

---3.   Tổng điểm thi của từng sinh viên, gồm các thông tin: Tên sinh viên, Tên khoa, Giới tính, Tổng điểm thi

		SELECT hosv+tensv as N'Họ và tên sinh viên', tenkh as N'Tên khoa', Phai N'Giới tính', SUM(diem) AS N'Tổng điểm thi'
		FROM SinhVien
		JOIN ketqua ON SinhVien.masv = ketqua.masv
		JOIN khoa ON khoa.makh = sinhvien.makh
		GROUP BY hosv+tensv, tenkh, Phai;

---4.   Cho biết tổng số sinh viên ở mỗi khoa, gồm các thông tin: Tên khoa, Tổng số sinh viên (liệt kê cả các khoa chưa có sinh viên)

		SELECT tenkh as N'Tên khoa', COUNT(SinhVien.masv) AS N'Tổng số sinh viên'
		FROM Khoa
		LEFT JOIN SinhVien ON Khoa.makh = SinhVien.makh
		GROUP BY tenkh;

---5.   Cho biết điểm cao nhất của mỗi sinh viên, gồm các thông tin: Họ tên sinh viên, Điểm cao nhất

		SELECT hosv+tensv as N'Họ và tên sinh viên', MAX(diem) AS N'Điểm cao nhất'
		FROM ketqua
		JOIN sinhvien ON ketqua.masv = sinhvien.masv
		GROUP BY hosv+tensv;
		
---6.   Thông tin của môn học có số tiết nhiều nhất, gồm các thông tin: Tên môn học, Số tiết

		SELECT tenmh as N'Tên môn học', MAX(SoTiet) AS N'Số tiết nhiều nhất'
		FROM MonHoc
		GROUP BY monhoc.tenmh

---7.   Cho biết học bổng cao nhất của từng khoa, gồm Mã khoa, Tên khoa, Học bổng cao nhất

		SELECT Khoa.makh, tenkh, MAX(HocBong) AS N'Học bổng cao nhất'
		FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		GROUP BY Khoa.makh, tenkh;

---8.   Cho biết điểm cao nhất của mỗi môn, gồm các thông tin: Tên môn, Điểm cao nhất

		SELECT monhoc.mamh as N'Mã môn học', tenmh as N'Tên môn học', MAX(diem) AS N'Điểm cao nhất'
		FROM ketqua
		JOIN monhoc ON monhoc.mamh = ketqua.mamh
		GROUP BY monhoc.mamh, tenmh;

---9.   Thống kê số sinh viên học của từng môn, thông tin gồm có: Mã môn, Tên môn, Số sinh viên đang học (liệt kê cả các môn học chưa có sinh viên nào dự thi)

		SELECT monhoc.mamh as N'Mã môn học', monhoc.tenmh as N'Tên môn học', COUNT(ketqua.masv) AS N'Số sinh viên'
		FROM MonHoc
		LEFT JOIN ketqua ON MonHoc.mamh = ketqua.mamh
		GROUP BY monhoc.mamh, monhoc.tenmh;

---10. Cho biết môn nào có điểm thi cao nhất, gồm các thông tin: Tên môn, Số tiết, Tên sinh viên, Điểm

		SELECT MonHoc.tenmh as N'Tên môn học', MonHoc.sotiet as N'Số tiết', SinhVien.hosv+tensv as N'Họ và tên sinh viên',ketqua.diem as N'Điểm thi'
		FROM MonHoc
		JOIN ketqua ON MonHoc.mamh = ketqua.mamh
		JOIN SinhVien ON ketqua.masv = SinhVien.masv
		WHERE diem = (
			SELECT MAX(diem)
			FROM ketqua
		)

---11. Cho biết khoa nào có đông sinh viên nhất, bao gồm: Mã khoa, Tên khoa, Tổng số sinh viên

		SELECT TOP 1 Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa', COUNT(SinhVien.masv) AS N'Tổng số sinh viên'
		FROM Khoa
		LEFT JOIN SinhVien ON Khoa.makh = SinhVien.makh
		GROUP BY Khoa.makh, Khoa.tenkh
		ORDER BY COUNT(SinhVien.masv) DESC

---12. Cho biết khoa nào có sinh viên lãnh học bổng cao nhất, gồm các thông tin sau: Tên khoa, Họ tên sinh viên, Học bổng

		SELECT Khoa.tenkh as N'Tên khoa', SinhVien.hosv+tensv as N'Họ và tên sinh viên', SinhVien.HocBong as N'Học bổng cao nhất'
		FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE SinhVien.HocBong = (
			SELECT MAX(HocBong)
			FROM SinhVien
		);

---13. Cho biết sinh viên của khoa Tin học có học bổng cao nhất, gồm các thông tin: Mã sinh viên, Họ sinh viên, Tên sinh viên, Tên khoa, Học bổng

		SELECT SinhVien.masv as N'Mã sinh viên', SinhVien.hosv+tensv as N'Họ và tên sinh viên', Khoa.tenkh as N'Tên khoa', SinhVien.HocBong as N'Học bổng cao nhất'
		FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE SinhVien.HocBong = (
				SELECT MAX(HocBong)
				FROM SinhVien
				WHERE tenkh = N'Tin học'
		);

---14. Cho biết sinh viên nào có điểm môn Nhập môn máy tính lớn nhất, bao gồm các thông tin: Họ sinh viên, Tên môn, Điểm

		SELECT TOP (1) SinhVien.hosv+tensv as N'Họ và tên sinh viên', MonHoc.tenmh as N'Tên môn học', Ketqua.diem as N'Điểm'
		FROM SinhVien
		JOIN Ketqua ON SinhVien.masv = Ketqua.masv
		JOIN MonHoc ON Ketqua.mamh = MonHoc.mamh
		WHERE MonHoc.tenmh = N'Nhập môn máy tính'
		ORDER BY Ketqua.diem DESC

---15. Cho biết  3 sinh viên có điểm thi môn Đồ hoạ thấp nhất, thông tin bao gồm: Họ tên sinh viên, Tên khoa, Tên môn, Điểm
		
		SELECT TOP (3) SinhVien.hosv+tensv as N'Họ và tên sinh viên', Khoa.tenkh as N'Tên khoa', MonHoc.tenmh as N'Tên môn học', ketqua.Diem as N'Điểm thấp nhất'
		FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		JOIN Ketqua ON SinhVien.masv = Ketqua.masv
		JOIN MonHoc ON Ketqua.mamh = MonHoc.mamh
		WHERE MonHoc.tenmh = N'Đồ hoạ'
		ORDER BY Ketqua.Diem ASC

---16. Cho biết khoa nào có nhiều sinh viên nữ nhất, gồm các thông tin: Mã khoa, Tên khoa

		SELECT TOP (1) Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa'
		FROM Khoa
		JOIN SinhVien ON Khoa.makh = SinhVien.makh
		WHERE SinhVien.Phai = 0
		GROUP BY Khoa.makh, Khoa.tenkh
		ORDER BY COUNT(SinhVien.masv) DESC

---17. Thống kê sinh viên theo khoa, gồm các thông tin: Mã khoa, Tên khoa, Tổng số  sinh viên, Tổng số sinh viên nam, Tổng số sinh viên nữ (kể cả những khoa chưa có sinh viên).

		SELECT Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa', COUNT(SinhVien.masv) AS N'Tổng số sinh viên', 
			SUM(CASE WHEN SinhVien.Phai = 1 THEN 1 ELSE 0 END) AS N'Tổng số sinh viên Nam', 
			SUM(CASE WHEN SinhVien.Phai = 0 THEN 1 ELSE 0 END) AS N'Tổng số sinh viên Nữ'
		FROM Khoa
		LEFT JOIN SinhVien ON Khoa.makh = SinhVien.makh
		GROUP BY Khoa.makh, Khoa.tenkh;

---18. Cho biết kết quả học tập của sinh viên, gồm Họ tên sinh viên, Tên khoa, Kết quả. Trong đó, Kết quả sẽ là Đậu nếu không có môn nào có điểm nhỏ hơn 4

		SELECT SinhVien.hosv+tensv as N'Họ và tên sinh viên', Khoa.tenkh as N'Tên khoa',
				CASE WHEN MIN(Ketqua.Diem) >= 4 THEN N'Đậu' ELSE N'Rớt' END AS N'Kết quả'
		FROM SinhVien
		JOIN KHOA ON Khoa.makh = Sinhvien.makh
		LEFT JOIN Ketqua ON SinhVien.masv = Ketqua.masv
		GROUP BY SinhVien.masv, SinhVien.hosv+tensv, Khoa.tenkh;

---19. Danh sách những sinh viên không có môn nào nhỏ hơn 4 điểm, gồm các thông tin: Họ tên sinh viên, Tên khoa, Giới tính. Trong đó Giới tính hiển thị Nam/Nữ

		SELECT SinhVien.hosv+tensv as N'Họ và tên sinh viên', Khoa.tenkh as N'Tên khoa',
			CASE WHEN MIN(Ketqua.Diem) >= 4 THEN N'Nam' ELSE N'Nữ' END AS N'Giới tính'
		FROM SinhVien
		JOIN KHOA ON Khoa.makh = sinhvien.makh
		LEFT JOIN Ketqua ON SinhVien.masv = Ketqua.masv
		GROUP BY SinhVien.masv, SinhVien.hosv+tensv, Khoa.tenkh
		HAVING MIN(Ketqua.Diem) IS NOT NULL;

---20. Cho biết danh sách những môn không có điểm thi nhỏ hơn 4, gồm các thông tin: Mã môn, Tên Môn

		SELECT MonHoc.mamh as N'Mã môn học', MonHoc.tenmh as N'Tên môn học'
		FROM MonHoc
		LEFT JOIN Ketqua ON MonHoc.mamh = Ketqua.mamh
		GROUP BY MonHoc.mamh, MonHoc.tenmh
		HAVING MIN(Ketqua.diem) IS NULL OR MIN(Ketqua.diem) > 4;

---21. Cho biết những khoa không có sinh viên rớt, sinh viên rớt nếu điểm thi của môn nhỏ hơn 5, gồm các thông tin: Mã khoa, Tên khoa
		
		SELECT Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa'
		FROM Khoa
		WHERE Khoa.makh  IN (
			SELECT SinhVien.makh
			FROM SinhVien
			JOIN Ketqua ON SinhVien.masv = Ketqua.masv
			WHERE Ketqua.diem < 5
		)

---22. Thống kê số sinh viên đậu và số sinh viên rớt của từng môn, biết rằng sinh viên rớt khi điểm của môn nhỏ hơn 5, gồm có: Mã môn, Tên môn, Số sinh viên đậu, Số sinh viên rớt (kể cả những môn chưa có sinh viên dự thi)

		SELECT MonHoc.mamh as N'Mã môn học', MonHoc.tenmh as N'Tên môn học',
    		SUM(CASE WHEN Ketqua.diem >= 5 THEN 1 ELSE 0 END) AS N'Số sinh viên đậu',
    		SUM(CASE WHEN Ketqua.diem < 5 THEN 1 ELSE 0 END) AS N'Số sinh viên rớt'
		FROM MonHoc
		LEFT JOIN Ketqua ON MonHoc.mamh = ketqua.mamh
		GROUP BY MonHoc.mamh, MonHoc.tenmh;

---23. Cho biết môn nào không có sinh viên rớt, gồm các thông tin: Mã môn, Tên môn

		SELECT MonHoc.mamh as N'Mã môn học', MonHoc.tenmh as N'Tên môn học'
		FROM MonHoc
		WHERE Monhoc.mamh NOT IN (
			SELECT Ketqua.mamh
			FROM ketqua
			WHERE ketqua.diem < 5
		)

---24. Danh sách sinh viên không có môn nào rớt, thông tin gồm: Mã sinh viên, Họ tên, Mã khoa

		SELECT Sinhvien.masv as N'Mã sinh viên', Hosv+tensv as N'Họ và tên sinh viên', Sinhvien.makh as N'Mã khoa'
		FROM sinhvien
		WHERE sinhvien.masv NOT IN (
			SELECT ketqua.masv
			FROM ketqua
			WHERE ketqua.diem < 5
		)

---25. Danh sách các sinh viên rớt trên 2 môn, gồm Mã sinh viên, Họ sinh viên, Tên sinh viên, Mã khoa

		SELECT Sinhvien.masv as N'Mã sinh viên', Hosv+tensv as N'Họ và tên sinh viên', sinhvien.makh as N'Mã khoa'
		FROM sinhvien
		JOIN Ketqua on Sinhvien.masv = Ketqua.masv
		WHere Ketqua.diem < 5
		GROUP BY Sinhvien.masv, Sinhvien.Hosv+tensv, Sinhvien.makh
		HAVING COUNT(DISTINCT ketqua.mamh) >= 2; 

---26. Cho biết danh sách những khoa có nhiều hơn 10 sinh viên, gồm Mã khoa, Tên khoa, Tổng số sinh viên của khoa

		SELECT Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa', COUNT(Sinhvien.masv) as N'Tổng số sinh viên'
		FROM khoa
		JOIN sinhvien ON Khoa.makh = sinhvien.makh
		GROUP BY Khoa.makh, Khoa.tenkh
		HAVING COUNT(Sinhvien.masv) > 10;

---27. Danh sách những sinh viên thi nhiều hơn 3 môn, gồm có Mã sinh viên, Họ tên sinh viên, Số môn thi

		SELECT Sinhvien.masv as N'Mã sinh viên', Sinhvien.hosv+tensv as N'Họ và tên sinh viên'
		FROM sinhvien
		JOIN Ketqua On sinhvien.masv = ketqua.masv
		GROUP BY Sinhvien.masv, Sinhvien.hosv+tensv
		HAVING COUNT(DISTINCT ketqua.mamh) > 3;

---28. Cho biết khoa có 3 sinh viên nam trở lên, thông tin gồm có: Mã khoa, Tên khoa, Tổng số sinh viên nam

		SELECT Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa', COUNT(CASE WHEN sinhvien.phai = 1 THEN 1 END) as N'Tổng số sinh viên Nam'
		FROM khoa
		JOIN sinhvien ON Khoa.makh = sinhvien.makh
		GROUP BY Khoa.makh, Khoa.tenkh
		HAVING COUNT(CASE WHEN Sinhvien.phai = 1 THEN 1 END) >= 3

---29. Danh sách những sinh viên có trung bình điểm thi lớn hơn 4, gồm các thông tin sau: Họ tên sinh viên, Tên khoa, Giới tính, Điểm trung bình các môn

		SELECT Sinhvien.hosv+tensv as N'Họ và tên sinh viên', Khoa.tenkh as N'Tên khoa', Sinhvien.Phai, AVG(Ketqua.Diem) as N'Điểm trung bình'
		FROM sinhvien
		JOIN Ketqua ON Sinhvien.masv = ketqua.masv
		JOIN Monhoc ON Ketqua.mamh = Monhoc.mamh
		JOIN KHOA On Sinhvien.makh = Khoa.makh
		GROUP BY Sinhvien.masv, Sinhvien.hosv+tensv, Khoa.tenkh, Sinhvien.phai
		HAVING AVG(Ketqua.Diem) > 4;

---30. Cho biết trung bình điểm thi của từng môn, chỉ lấy môn nào có trung bình điểm thi lớn hơn 6, thông tin gồm có: Mã môn, Tên môn, Trung bình điểm

		SELECT Monhoc.mamh as N'Mã môn học', Monhoc.tenmh as N'Tên môn học', AVG(Ketqua.diem) as N'Điểm trung bình'
		FROM monhoc
		JOIN Ketqua ON Monhoc.mamh = Ketqua.mamh
		GROUP BY Monhoc.mamh, Monhoc.tenmh
		HAVING AVG(Ketqua.diem) > 6;


--E. Tạo các truy vấn con (Sub Query)

---1.   Liệt kê danh sách sinh viên chưa thi môn nào, thông tin gồm: Mã sinh viên, Mã khoa, Phái

		SELECT SinhVien.masv as N'Mã sinh viên', SinhVien.makh as N'Mã khoa', SinhVien.Phai as N'Giới tính'
		FROM SinhVien
		WHERE SinhVien.masv NOT IN (SELECT DISTINCT ketqua.masv FROM ketqua);

---2.   Liệt kê danh sách những sinh viên chưa thi môn Đồ họa, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa

		SELECT Sinhvien.masv as N'Mã sinh viên', Sinhvien.hosv+tensv as N'Họ và tên sinh viên', sinhvien.makh as N'Mã khoa'
		FROM sinhvien
		WHERE Sinhvien.masv NOT IN (
			SELECT DISTINCT ketqua.masv
			FROM ketqua
			WHERE Ketqua.mamh = 'ĐH'
		)

---3.   Cho biết môn nào chưa có sinh viên thi, gồm thông tin về: Mã môn, Tên môn, Số tiết

		SELECT Monhoc.mamh as N'Mã môn học', Monhoc.tenmh as N'Tên môn học', Monhoc.sotiet as N'Số tiết'
		FROM monhoc
		WHERE Monhoc.mamh NOT IN (
			SELECT DISTINCT ketqua.mamh
			FROM ketqua
		)

---4.   Cho biết Khoa nào chưa có sinh viên học, thông tin gồm: Mã khoa, Tên khoa

		SELECT Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa'
		FROM khoa
		WHERE Khoa.makh NOT IN (
			SELECT DISTINCT sinhvien.makh
			FROM sinhvien
		)

---5.   Cho biết những sinh viên của khoa Anh văn chưa thi môn Đồ họa

		SELECT sinhvien.masv as N'Mã sinh viên', Sinhvien.hosv+tensv as N'Họ và tên sinh viên', Sinhvien.makh as N'Mã khoa'
		FROM sinhvien
		WHERE Sinhvien.makh = 'AV' AND Sinhvien.masv NOT IN (
			SELECT DISTINCT ketqua.masv
			FROM ketqua
			WHERE Ketqua.mamh = 'ĐH'
		)

---6.   Cho biết môn nào chưa có sinh viên khoa Vật Lý dự thi

		SELECT Monhoc.mamh as N'Mã môn học', Monhoc.tenmh as N'Tên môn học'
		FROM monhoc
		WHERE Monhoc.mamh NOT IN (
			SELECT DISTINCT ketqua.mamh
			FROM ketqua
			WHERE Ketqua.masv IN (
				SELECT sinhvien.masv
				FROM Sinhvien
				WHERE makh = 'VL'
			)
		)

---7.   Liệt kê danh sách những sinh viên có điểm thi môn Đồ hoạ nhỏ hơn điểm thi môn Đồ hoạ nhỏ nhất của sinh viên khoa Tin học.

		SELECT Sinhvien.masv as N'Mã sinh viên', Sinhvien.hosv+tensv as N'Họ và tên sinh viên'
		FROM sinhvien
		WHERE Sinhvien.masv IN (
			SELECT Ketqua.masv
			FROM ketqua
			WHERE Ketqua.mamh = 'ĐH' AND Ketqua.diem < (
				SELECT MIN (Ketqua.diem)
				FROM ketqua
				WHERE Ketqua.mamh = 'ĐH' AND ketqua.masv IN (
					SELECT Sinhvien.masv
					FROM sinhvien
					WHERE makh = 'TH'
				)
            )
		)
---8.   Liệt kê những sinh viên có tuổi sau sinh viên có tuổi nhỏ nhất trong khoa Anh văn

		SELECT Sinhvien.masv as N'Mã sinh viên', Sinhvien.hosv+tensv as N'Họ và tên sinh viên'
		FROM sinhvien
		WHERE Sinhvien.ngaysinh > (
			SELECT MIN(Sinhvien.ngaysinh)
			FROM sinhvien
			WHERE Sinhvien.makh = 'AV'
		)

---9.   Cho biết những sinh viên có học bổng lớn hơn tổng học bổng của những sinh viên thuộc khoa Tin học

		SELECT SinhVien.masv as N'Mã sinh viên', SinhVien.hosv+tensv as N'Họ và tên sinh viên'
		FROM SinhVien
		WHERE SinhVien.HocBong > (
			SELECT SUM(SinhVien.HocBong) 
			FROM SinhVien 
			WHERE SinhVien.makh = 'TH'
		);

---10. Danh sách sinh viên có nơi sinh cùng với nơi sinh của sinh viên có học bổng lớn nhất trong khoa Vật lý

		SELECT SinhVien.masv as N'Mã sinh viên', SinhVien.hosv+tensv as N'Họ và tên sinh viên'
		FROM SinhVien
		WHERE SinhVien.NoiSinh IN (
			SELECT SinhVien.NoiSinh 
			FROM SinhVien 
			WHERE SinhVien.HocBong = (
				SELECT MAX(SinhVien.HocBong) 
				FROM SinhVien 
				WHERE SinhVien.makh = 'VL'
			)
		);

--Tạo các truy vấn tổng hợp:

---1. Danh sách sinh viên có điểm cao nhất ứng với mỗi môn, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Tên môn, Điểm

		SELECT ketqua.masv as N'Mã sinh viên', SinhVien.hosv+tensv as N'Họ và tên sinh viên', MonHoc.tenmh as N'Tên môn học', ketqua.diem as N'Điểm thi'
		FROM ketqua
		JOIN SinhVien ON ketqua.masv = SinhVien.masv
		JOIN MonHoc ON ketqua.mamh = MonHoc.mamh
		WHERE ketqua.diem = (
		      SELECT MAX(Diem) 
			  FROM ketqua 
			  WHERE mamh = ketqua.mamh
	    );

---2. Danh sách các sinh viên có học bổng cao nhất theo từng khoa, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Tên khoa, Học bổng

		SELECT SinhVien.masv as N'Mã sinh viên', SinhVien.hosv+tensv as N'Họ và tên sinh viên', Khoa.tenkh as N'Tên khoa', SinhVien.hocbong as N'Học bổng'
		FROM SinhVien
		JOIN Khoa ON SinhVien.makh = Khoa.makh
		WHERE SinhVien.HocBong = (
			  SELECT MAX(HocBong) 
			  FROM SinhVien 
			  WHERE makh = SinhVien.makh
		);

