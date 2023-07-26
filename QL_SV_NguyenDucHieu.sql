---@Author By HieuNguyenDuc NTTU------------------------------------------------------------------------------------------------

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


insert into SinhVien values('A01',N'Nguyễn Thu',N'Hải',0,'23/02/1980',N'TP.HCM','AV',100000)
insert into SinhVien values('A02',N'Trần Văn',N'Chính',1,'24/12/1982',N'TP.HCM','TH',100000)
insert into SinhVien values('A03',N'Lê Thu Bạch',N'Yến',0,'21/02/1982',N'Hà Nội','AV',140000)
insert into SinhVien values('A04',N'Trần Anh',N'Tuấn',1,'08/12/1984',N'Long An','LS',80000)
insert into SinhVien values('A05',N'Trần Thanh',N'Triều',1,'01/02/1980',N'Hà Nội','VL',80000)
insert into SinhVien values('B01',N'Trần Thanh',N'Mai',0,'20/12/1981',N'Bến Tre','TH',200000)
insert into SinhVien values('B02',N'Trần Thị Thu',N'Thủy',0,'13/02/1982',N'TP.HCM','TH',null)
insert into SinhVien values('B03',N'Trần Thị',N'Thanh',0,'31/12/1982',N'TP.HCM','TH',50000)
insert into SinhVien values('B04',N'Trương Hoàng',N'Long',1,'1980-06-19',N'TP.HP','AV',70000)

insert into MonHoc values ('01',N'Nhập môn máy tính',30)
insert into MonHoc values ('02',N'Trí tuệ nhân tạo',45)
insert into MonHoc values ('03',N'Truyền tin',45)
insert into MonHoc values ('04',N'Đồ họa',60)
insert into MonHoc values ('05',N'Văn phạm',45)
insert into MonHoc values ('06',N'Đàm thoại',30)
insert into MonHoc values ('07',N'Vật lý nguyên tử',30)

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

-----------------------Truy vấn dữ liệu các bảng-------------------------


select * from Khoa
select * from SinhVien
select * from MonHoc
select * from KetQua



-------------------------------------------Truy Vấn Cơ SỞ Dữ Liệu SQL--- Author By HieuNguyenDuc - NTTU --------------------------------------------------------------------------------------

--A.	Viết những truy vấn lọc và sắp xếp dữ liệu sau bằng ngôn ngữ SQL

use QL_SV;

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

--D.   Tạo các truy vấn tính toán thống kê dữ liệu

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

		SELECT Khoa.makh as N'Mã khoa', Khoa.tenkh as N'Tên khoa', COUNT(SinhVien.Masv) AS N'Tổng số sinh viên Nam'
		FROM KHOA
		JOIN SinhVien ON KHOA.MAKH = SinhVien.Makh
		WHERE SinhVien.Phai = 1
		GROUP BY KHOA.MAKH, KHOA.TENKH
		HAVING COUNT(SinhVien.Masv) >= 3

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


-----------------------------Sử dụng cấu trúc điều khiển--------------------------------------------------------------------------------------------------------------------------------------------

----Sử dụng cú pháp IF để thực hiện các yêu cầu sau:

--1. Cho biết học bổng trung bình của SV khoa Tin Học là bao nhiêu? 
--Nếu lớn hơn 100,000 thì in ra “không tăng học bổng”, ngược lại in ra “nên tăng học bổng”.

		DECLARE @AvgHocbong FLOAT;
		SELECT @AvgHocbong = AVG(ISNULL(Hocbong, 0)) 
		FROM SINHVIEN 
		INNER JOIN khoa ON sinhvien.makh = khoa.makh
		WHERE TENKH = N'Tin học';
		IF @AvgHocbong > 100000
			PRINT N'không tăng học bổng'
		ELSE
			PRINT N'nên tăng học bổng';
		GO
--2. Sử dụng hàm DATENAME để tính xem có SV nào sinh vào ngày chủ nhật không? 
--Nếu có thì in ra danh sách các SV đó, ngược lại thì in ra chuỗi “Không có SV nào sinh vào ngày Chủ Nhật”.

		DECLARE @TongSinhVienSinhVaoChuNhat INT;
		SELECT @TongSinhVienSinhVaoChuNhat = COUNT(*)
		FROM sinhvien
		WHERE DATENAME(WEEKDAY, ngaysinh) = 'Sunday';

		IF @TongSinhVienSinhVaoChuNhat > 0		
			SELECT *
			FROM sinhvien
			WHERE DATENAME(WEEKDAY, ngaysinh) = 'Sunday';
		ELse 
			PRINT N'Không có sinh viên nào sinh vào ngày chủ nhật';
		GO

--3. Hãy cho biết SV có mã số A01 đã thi bao nhiêu môn, nếu có thì in ra “SV A01 đã thi xxx môn”, 
--ngược lại thì in ra “SV A01 chưa có kết quả thi”.

		DECLARE @TongSinhVien INT;
		SELECT @TongSinhVien = COUNT(*)
		FROM ketqua
		WHERE masv = 'A01'

		IF @TongSinhVien > 0
			PRINT N'Sinh viên A01 đã thi ' + CONVERT(varchar, @TongSinhVien) + ' môn' 
		ELSE
			PRINT N'Sinh viên chưa có kết quả thi';
		GO
--4. Hãy cho biết SV có mã số A01 đã thi đủ tất cả các môn chưa, nếu có thì in ra “SV A01 đã thi đủ tất cả các môn”, 
--ngược lại thì in ra “SV A01 chưa thi đủ tất cả các môn”.

		DECLARE @TongMonHoc INT, @SinhVienDaThiTatCaCacMon INT;
		SELECT @TongMonHoc = COUNT(*) 
		FROM MonHoc;
		SELECT @SinhVienDaThiTatCaCacMon = COUNT(
			DISTINCT Mamh
		) 
		FROM KetQua 
		WHERE Masv = 'A01';

		IF @TongMonHoc = @SinhVienDaThiTatCaCacMon
			PRINT N'SV A01 đã thi đủ tất cả các môn'
		ELSE
			PRINT N'SV A01 chưa thi đủ tất cả các môn';
		GO

--5. Hãy cho biết môn Vật lý nguyên tử đã có SV thi chưa, 
--nếu có thì in ra “Đã có SV thi môn Vật lý nguyên tử với điểm trung bình là xxx”, 
--ngược lại thì in ra “Chưa có SV thi môn Vật lý nguyên tử”.

		DECLARE @DiemTrungBinh FLOAT;
		SELECT  @DiemTrungBinh = AVG(Diem) 
		FROM KetQua  
		INNER JOIN MonHoc ON ketqua.mamh = monhoc.mamh 
		WHERE Tenmh = N'Vật lý nguyên tử';

		IF @DiemTrungBinh IS NOT NULL
			PRINT N'Đã có SV thi môn Vật lý nguyên tử với điểm trung bình là ' + CONVERT(VARCHAR,  @DiemTrungBinh)
		ELSE
			PRINT N'Chưa có SV thi môn Vật lý nguyên tử';
		GO

----Sử dụng cú pháp CASE để thực hiện các yêu cầu sau:

---6. Liệt kê danh sách các SV có bổ sung thêm cột hiển thị thứ trong tuần (bằng tiếng Việt) của ngày sinh.

		SELECT  masv as N'Mã sinh viên', hosv+ ' '+tensv as N'Họ và tên sinh viên', NgaySinh as N'Ngày sinh', 
		CASE 
			WHEN DATEPART(WEEKDAY, NgaySinh) = 1 THEN N'Chủ Nhật'
			WHEN DATEPART(WEEKDAY, NgaySinh) = 2 THEN N'Thứ Hai'
			WHEN DATEPART(WEEKDAY, NgaySinh) = 3 THEN N'Thứ Ba'
			WHEN DATEPART(WEEKDAY, NgaySinh) = 4 THEN N'Thứ Tư'
			WHEN DATEPART(WEEKDAY, NgaySinh) = 5 THEN N'Thứ Năm'
			WHEN DATEPART(WEEKDAY, NgaySinh) = 6 THEN N'Thứ Sáu'
			WHEN DATEPART(WEEKDAY, NgaySinh) = 7 THEN N'Thứ Bảy'
		END AS N'Thứ trong tuần'
		FROM SinhVien;
		GO

----Sử dụng cú pháp WHILE để thực hiện các yêu cầu sau:

---7. Tính tổng các số nguyên từ 1 đến 100.

		DECLARE @TongCacSoNguyen INT = 0;
		DECLARE @Dem INT = 1;
		WHILE @Dem <= 100
		BEGIN
    		SET @TongCacSoNguyen = @TongCacSoNguyen + @Dem;
    		SET @Dem = @Dem + 1;
		END
		SELECT @TongCacSoNguyen AS N'Tổng các số nguyên từ 1 đến 100';
		GO	

---8. Tính tổng chẵn và tổng lẻ của các số nguyên từ 1 đến 100.

		DECLARE @TongChan INT = 0, @TongLe INT = 0;
		DECLARE @Dem INT = 1;
		WHILE @Dem <= 100
		BEGIN
    		IF @Dem % 2 = 0
        		SET @TongChan = @TongChan + @Dem;
    		ELSE
        		SET @TongLe = @TongLe + @Dem;
    		SET @Dem = @Dem + 1;
		END
		SELECT @TongChan AS N'Tổng các số chẵn từ 1 đến 100', 
       		   @TongLe AS N'Tổng các số lẻ từ 1 đến 100';
		GO

---9. Tạo một bảng tên MONHOC_1 có cấu trúc và dữ liệu dựa vào bảng MONHOC (chỉ lấy hai cột: MAMH, TENMH). 
--Sau đó, sử dụng vòng lặp WHILE viết đoạn chương trình dùng để xóa từng dòng dữ liệu trong bảng MONHOC_1 
--với điều kiện câu lệnh bên trong vòng lặp khi mỗi lần thực hiện chỉ được phép xóa một dòng dữ liệu trong bảng MONHOC_1. 
--Sau khi xóa một dòng thì thông báo ra màn hình nội dung “Đã xóa môn học ” + Tên môn học

		--- Tạo một bảng MONHOC_1
        SELECT MAMH, TENMH  INTO MONHOC_1
		FROM MONHOC;
		---
		--- Vòng lặp WHILE để xóa từng dữ liệu
		WHILE (SELECT COUNT(*) FROM MONHOC_1) > 0
		BEGIN
    		DECLARE @MonHoc nvarchar(100);
    		SELECT TOP (1) @MonHoc = TENMH 
			FROM MONHOC_1;
    		DELETE FROM MONHOC_1 WHERE TENMH = @MonHoc;
    		PRINT N'Đã xóa môn học ' + @MonHoc;
		END
		GO
		---

----Sử dụng đối tượng Cursor:

---6. Duyệt cursor và xử lý hiển thị danh sách các SV gồm các thông tin: mã SV, họ tên SV, mã khoa, 
--và có thêm cột tổng số môn thi.

		DECLARE @MaSinhVien nvarchar(10), @HoVaTenSinhVien nvarchar(50), @MaKhoa nvarchar(10), @TongSoMonThi int;
		DECLARE SinhVien_Cursor CURSOR FOR 
		SELECT MASV, HOSV + ' ' + TENSV, MAKH 
		FROM SinhVien;
		OPEN SinhVien_Cursor
		FETCH NEXT 
		FROM SinhVien_Cursor 
		INTO @MaSinhVien, @HoVaTenSinhVien, @MaKhoa
		WHILE @@Fetch_Status = 0
		BEGIN
    		SELECT @TongSoMonThi = COUNT(*) 
			FROM KetQua 
			WHERE Masv = @MaSinhVien;
    		PRINT @MaSinhVien + ' - ' + @HoVaTenSinhVien + ' - ' + @MaKhoa + ' - ' + CAST(@TongSoMonThi AS nvarchar);
    		FETCH NEXT FROM SinhVien_Cursor INTO @MaSinhVien, @HoVaTenSinhVien, @MaKhoa
		END
		CLOSE SinhVien_Cursor
		DEALLOCATE SinhVien_Cursor
		GO

---7. Duyệt cursor và xử lý hiển thị danh sách các môn học có thêm cột Ghi chú, 
--biết rằng nếu đã có SV thi thì in ra “Đã có xxx SV thi”, ngược lại thì in ra “Chưa có SV thi”.

		DECLARE @MaMonHoc nvarchar(10), @TenMonHoc nvarchar(50), @GhiChu nvarchar(100);
		DECLARE MonHoc_Cursor CURSOR FOR 
		SELECT MAMH, TENMH 
		FROM MONHOC;
		OPEN MonHoc_Cursor
		FETCH NEXT FROM MonHoc_Cursor INTO @MaMonHoc, @TenMonHoc
		WHILE @@Fetch_Status = 0
		BEGIN
    		DECLARE @SinhVienThi int;
    		SELECT @SinhVienThi = COUNT(
				DISTINCT MASV
			) 
			FROM KETQUA 
			WHERE MAMH = @MaMonHoc;
    		IF @SinhVienThi > 0
        		SET @GhiChu = N'Đã có ' + CAST(@SinhVienThi AS nvarchar) + ' SV thi'
    		ELSE
        		SET @GhiChu = N'Chưa có SV thi'
    		PRINT @MaMonHoc + ' - ' + @TenMonHoc + ' - ' + @GhiChu;
    		FETCH NEXT FROM MonHoc_Cursor INTO @MaMonHoc, @TenMonHoc
		END
		CLOSE MonHoc_Cursor
		DEALLOCATE MonHoc_Cursor
		GO

---8. Duyệt cursor và xử lý giảm học bổng của các SV theo các qui tắc sau:
-- - Không giảm nếu ĐTB ≥ 8.5
-- - Giảm 5% nếu 7.5 ≤ ĐTB < 8.5
-- - Giảm 10% nếu 7 ≤ ĐTB < 7.5

		--- Khai báo biến
		DECLARE @MaSinhVien nvarchar(3), @DiemTrungBinh FLOAT, @HocBong money

		--- Khai báo Cursor
		DECLARE student_cursor CURSOR FOR 
		--- Tìm ra mã sinh viên, điểm gán cho biến DTB và học bổng sinh viên từ bảng sinh viên
		SELECT MASV, ISNULL(Hocbong, 0) as HocBong, (
			SELECT ISNULL(AVG(Diem), 0) 
			FROM KETQUA 
			WHERE MASV = SINHVIEN.MASV
		) AS DTB 
		FROM SINHVIEN;
		--- Mở Cursor
		OPEN student_cursor
		--- Tìm dòng tiếp theo
		FETCH NEXT FROM student_cursor INTO @MaSinhVien, @DiemTrungBinh, @HocBong
		--- Vòng lặp mặc định trạng thái là 0, nếu trạng thái không phải là 0 thì vẫn tiếp tục chạy
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			--- Nếu điểm trung bình lớn hơn hoặc bằng 8.5
    		IF @DiemTrungBinh >= 8.5 
        		SET @HocBong = @HocBong -- Không thay đổi
			--- Nếu điểm trung bình lớn hơn hoặc bằng 7.5 hoặc nhỏ hơn 8.5
    		ELSE IF @DiemTrungBinh >= 7.5 AND @DiemTrungBinh < 8.5
        		SET @HocBong = @HocBong * 0.95 -- Giảm 5%
			--- Nếu điểm trung bình lớn hơn hoặc bằng 7 và nhỏ hơn 7.5 
    		ELSE IF @DiemTrungBinh >= 7 AND @DiemTrungBinh < 7.5
        		SET @HocBong = @HocBong * 0.90 -- Giảm 10%

			--- Cập nhật dữ liệu mới cho bản
    		UPDATE SinhVien
			--- Gán học bổng đã cập nhật vào cột học bổng trong bảng sinh viên
    		SET HocBong = @HocBong
			--- Điều kiện cập nhật là dựa vào mã sinh viên để xác định cập nhật cho chính xác
    		WHERE MaSV = @MaSinhVien
			--- Tìm dòng tiếp theo cho đến khi kết thúc
    		FETCH NEXT FROM student_cursor INTO @MaSinhVien, @DiemTrungBinh, @HocBong
		END 
		--- Thoát vóng lặp 

		--- Thoát Cursor
		CLOSE student_cursor
		DEALLOCATE student_cursor
		GO
		--- Kiểm tra và xem thay đổi kết quả sau khi đã cập nhật
		SELECT MASV, HOSV, TENSV, HOCBONG 
		FROM SINHVIEN;
		GO


		--- Cách 2:
		DECLARE @MaSinhVien nvarchar(10), @HocBong money, @DiemTrungBinh float;
		DECLARE SinhVien_Cursor CURSOR FOR 
		SELECT MASV, ISNULL(Hocbong, 0) as HocBong, (
			SELECT ISNULL(AVG(Diem), 0) 
			FROM KETQUA 
			WHERE MASV = SINHVIEN.MASV
		) AS DTB 
		FROM SINHVIEN;
		OPEN SinhVien_Cursor
		FETCH NEXT FROM SinhVien_Cursor INTO @MaSinhVien, @HocBong, @DiemTrungBinh
		WHILE @@Fetch_Status = 0
		BEGIN
    		IF @DiemTrungBinh < 7.5 AND @DiemTrungBinh >= 7
        		SET @HocBong = @HocBong - @HocBong * 0.1
    		ELSE IF @DiemTrungBinh < 8.5 AND @DiemTrungBinh >= 7.5
        		SET @HocBong = @HocBong - @HocBong * 0.05
   		 	UPDATE SinhVien SET HocBong = @HocBong 
			WHERE MASV = @MaSinhVien;
    		FETCH NEXT FROM SinhVien_Cursor INTO @MaSinhVien, @HocBong, @DiemTrungBinh
		END
		CLOSE SinhVien_Cursor
		DEALLOCATE SinhVien_Cursor
		GO
		---Xem kết quả thay đổi---
		SELECT MASV, HOSV, TENSV, HOCBONG 
		FROM SINHVIEN;
		GO

		SELECT * FROM KETQUA
		GO
-----------------------------Sử dụng Stored Procedure--------------------------------------------------------------------------------------------------------------------------------------------

---1. Xây dựng Stored Procedure tên sp_KetQuaThi với tham số vào là mã số SV (giá trị mặc định là NULL) 
--để hiển thị thông tin: Mã SV, Họ và tên, Tên môn và Điểm. Nếu không truyền vào mã số SV thì 
--thủ tục sẽ liệt kê kết quả thi của tất cả các sinh viên.

		CREATE PROCEDURE sp_KetQuaThi 
    		@MASV VARCHAR(20) = NULL
		AS
		BEGIN
    		SELECT SINHVIEN.MASV, SINHVIEN.HOSV, SINHVIEN.TENSV, MONHOC.TENMH, KETQUA.DIEM 
    		FROM SINHVIEN 
    		JOIN KETQUA ON SINHVIEN.MASV = KETQUA.MASV 
    		JOIN MONHOC ON KETQUA.MAMH = MONHOC.MAMH 
    		WHERE SINHVIEN.MASV = ISNULL(@MASV, SINHVIEN.MASV);
		END;
		GO

		EXECUTE sp_KetQuaThi
		GO
---2. Xây dựng Stored Procedure tên sp_TongHocBongSVTheoKhoa với tham số vào là 
--Tên khoa để tính tổng học bổng của các sinh viên thuộc khoa đó. Nếu Tên khoa không hợp lệ thì thông báo lỗi.

		CREATE PROCEDURE sp_TongHocBongSVTheoKhoa 
    		@TENKHOA NVARCHAR(20)
		AS
		BEGIN
    		IF NOT EXISTS
			(
				SELECT *
				FROM KHOA 
				WHERE TENKH = @TENKHOA
			)
			BEGIN
				PRINT N'Không có khoa ' + @TENKHOA
				RETURN
			END
			IF NOT EXISTS 
			(
				SELECT *
				FROM KHOA 
				INNER JOIN SINHVIEN ON SINHVIEN.MAKH = KHOA.MAKH
				WHERE TENKH = @TENKHOA
			)
			BEGIN
				PRINT 'Khoa ' + @TENKHOA+ N' không có sinh viên'
				RETURN
			END
			DECLARE @TONG INT = 0
			SELECT @TONG = SUM(ISNULL(HOCBONG,0))
			FROM KHOA
			INNER JOIN SINHVIEN ON SINHVIEN.MAKH = KHOA.MAKH
			WHERE TENKH = @TENKHOA
			IF @TONG = 0
				PRINT 'Khoa ' + @TENKHOA + N' không có học bổng'
			ELSE
				PRINT 'Khoa ' + @TENKHOA + N' có tổng học bổng của sinh viên là: ' + CAST(@TONG AS VARCHAR(10))

		END;
		GO

		EXECUTE sp_TongHocBongSVTheoKhoa N'Anh Văn'
		GO
---3. Xây dựng Stored Procedure tên sp_DTB để tính điểm trung bình với 2 tham số vào là mã môn học và mã khoa.		

        CREATE PROCEDURE sp_DTB 
    		@MAMH VARCHAR(20), 
    		@MAKHOA VARCHAR(20)
		AS
		BEGIN
    		SELECT AVG(KETQUA.DIEM) as N'Điểm trung bình'
    		FROM KETQUA 
    		JOIN SINHVIEN ON KETQUA.MASV = SINHVIEN.MASV
    		WHERE KETQUA.MAMH = @MAMH AND SINHVIEN.MAKH = @MAKHOA;
		END;
		GO

		EXECUTE sp_DTB  '03', 'TH'
		GO
---4. Xây dựng Stored Procedure tên sp_HienThi_DSSV_TheoKhoa với tham số vào là mã khoa để hiển thị thông tin sinh viên 
--thuộc Khoa đó và có thêm cột GHI CHÚ hiển thị “Đã thi xxx môn” nếu SV có kết quả thi, 
--ngược lại thì hiển thị “Chưa có kết quả thi” nếu SV chưa thi môn nào.

		CREATE PROCEDURE sp_HienThi_DSSV_TheoKhoa 
    		@MAKHOA NVARCHAR(5)
		AS
		BEGIN
    		SELECT 
        		SINHVIEN.MASV,
        		SINHVIEN.HOSV,
        		SINHVIEN.TENSV,
        		CASE 
            		WHEN EXISTS (SELECT (1) FROM KETQUA WHERE KETQUA.MASV = SINHVIEN.MASV) 
					THEN N'Đã thi ' + CAST((SELECT COUNT(*) FROM KETQUA WHERE KETQUA.MASV = SINHVIEN.MASV) AS NVARCHAR(10)) + ' môn'
            		ELSE 
                		N'Chưa có kết quả thi'
        		END AS N'Ghi chú'
    		FROM SINHVIEN
    		WHERE SINHVIEN.MAKH = @MAKHOA;
		END;
		GO

		EXECUTE sp_HienThi_DSSV_TheoKhoa 'TH'
		GO

---5. Xây dựng Stored Procedure tên sp_Them_SV để thêm 1 SV mới, cần kiểm tra ràng buộc dữ liệu trước khi thực hiện lệnh thêm mới.

		CREATE PROCEDURE sp_Them_SV 
    		@MASV NVARCHAR(50), 
    		@HOSV NVARCHAR(50), 
    		@TENSV NVARCHAR(50),
			@GIOITINH BIT,
			@NGAYSINH DATE,
			@NOISINH NVARCHAR(50),
    		@MAKHOA NVARCHAR(5)
		AS
		BEGIN
    		IF EXISTS (SELECT 1 FROM SINHVIEN WHERE MASV = @MASV) 
    		BEGIN
        		PRINT N'Mã SV đã tồn tại'
        		RETURN
    		END

    		IF NOT EXISTS (SELECT 1 FROM KHOA WHERE MAKH = @MAKHOA) 
    		BEGIN
        		PRINT N'Mã khoa không hợp lệ'
        		RETURN
    		END

    		INSERT INTO SINHVIEN(MASV, HOSV, TENSV,PHAI, NgaySinh, NoiSinh, MAKH)
    		VALUES(@MASV, @HOSV, @TENSV,@GIOITINH,@NGAYSINH, @NOISINH, @MAKHOA)

    		PRINT N'Thêm sinh viên thành công'
		END;
		GO

		EXECUTE sp_Them_SV 'A09', N'Trương Hoàng', N'Long', '1','2002-09-23',N'Hải Phòng', 'TH'
		GO

---6. Xây dựng Stored Procedure tên sp_Xoa_SV để xóa 1 SV với tham số vào là mã SV muốn xóa, 
--cần kiểm tra ràng buộc dữ liệu trước khi thực hiện lệnh xóa

		CREATE PROCEDURE sp_Xoa_SV 
    		@MASV NVARCHAR(50)
		AS
		BEGIN
    		IF NOT EXISTS (SELECT 1 FROM SINHVIEN WHERE MASV = @MASV) 
    		BEGIN
        		PRINT N'Mã SV không tồn tại'
        		RETURN
    		END

    		DELETE FROM SINHVIEN WHERE MASV = @MASV

    		PRINT N'Xóa sinh viên thành công'
		END;
		GO

		EXECUTE sp_Xoa_SV 'A09'
		GO
---7. Xây dựng Stored Procedure tên sp_Sua_SV để sửa thông tin 1 SV, cần kiểm tra ràng buộc dữ liệu trước khi thực hiện lệnh cập nhật.

		CREATE PROCEDURE sp_Sua_SV 
    		@MASV NVARCHAR(50), 
    		@HOSV NVARCHAR(50), 
    		@TENSV NVARCHAR(50),
    		@MAKHOA NVARCHAR(50)
		AS
		BEGIN
    		IF NOT EXISTS (SELECT 1 FROM SINHVIEN WHERE MASV = @MASV) 
    		BEGIN
        		PRINT N'Mã SV không tồn tại'
        		RETURN
    		END

    		IF NOT EXISTS (SELECT 1 FROM KHOA WHERE MAKH = @MAKHOA) 
    		BEGIN
        		PRINT N'Mã khoa không hợp lệ'
        		RETURN
    		END

    		UPDATE SINHVIEN
    		SET HOSV = @HOSV, TENSV = @TENSV, MAKH = @MAKHOA
    		WHERE MASV = @MASV

    		PRINT N'Cập nhật thông tin sinh viên thành công'
		END;
			GO
		EXECUTE sp_Sua_SV 'A01', N'Nguyễn Thu', N'Hải', 'AV'
		GO
		--- Kiểm tra thay đổi sinh viên sau khi đã chỉnh sửa
		SELECT * FROM SinhVien
		GO

---8. Xây dựng Stored Procedure tên sp_DTB_SV để tính điểm trung bình của sinh viên với tham số vào 
--là mã sinh viên và tham số ra là điểm trung bình của sinh viên có mã sinh viên trùng với mã sinh viên truyền vào.

		CREATE PROCEDURE sp_DTB_SV 
    		@MASV NVARCHAR(50),
    		@DTB DECIMAL(5, 2) OUTPUT
		AS
		BEGIN
    		SELECT @DTB = AVG(DIEM) 
    		FROM KETQUA 
    		WHERE MASV = @MASV
		END;
		GO
		EXECUTE sp_DTB_SV  'A01', ''
		GO

		
---9. Xây dựng Stored Procedure tên sp_SoMonDauRot để tính số môn đậu, số môn rớt của sinh viên với tham số vào 
--là mã sinh viên, 2 tham số ra là số môn đậu và số môn rớt của sinh viên có mã sinh viên trùng với mã sinh viên truyền vào.		

		CREATE PROCEDURE sp_SoMonDauRot
    		@MASV NVARCHAR(50),
    		@SoMonDau INT OUTPUT,
    		@SoMonRot INT OUTPUT
		AS
		BEGIN
    		SELECT @SoMonDau = COUNT(*)
    		FROM KETQUA
    		WHERE MASV = @MASV AND DIEM >= 5.0

    		SELECT @SoMonRot = COUNT(*)
    		FROM KETQUA
    		WHERE MASV = @MASV AND DIEM < 5.0
		END;
		GO
		EXECUTE sp_SoMonDauRot 'A01', '', ''
		GO
-----------------------------Sử dụng FUNCTION--------------------------------------------------------------------------------------------------------------------------------------------

---1. Xây dựng hàm fn_TongHaiSoNguyen(@so1, @so2) trả về tổng  của hai số nguyên.

		CREATE FUNCTION fn_TongHaiSoNguyen(@so1 INT, @so2 INT)
		RETURNS INT
		AS
		BEGIN
			DECLARE @tong INT
			IF @so1 IS NULL OR @so2 IS NULL
				SET @tong =0
			SET @tong = @so1 + @so2
    		RETURN @tong
		END
		GO
		--- Dùng PRINT ---
		IF dbo.fn_TongHaiSoNguyen(5, null) >0
			PRINT dbo.fn_TongHaiSoNguyen(5, null)
		ELSE 
			PRINT '...'
		GO

---2. Xây dựng hàm fn_TongDaySoNguyen(@n) trả về tổng của các số nguyên từ 1 đến n.

		CREATE FUNCTION fn_TongDaySoNguyen(@n INT)
		RETURNS INT
		AS
		BEGIN
    		DECLARE @i INT = 1, @tong INT = 0
    		WHILE @i <= @n
    		BEGIN
        		SET @tong = @tong + @i
        		SET @i = @i + 1
    		END
    		RETURN @tong
		END
		GO
				--- Dùng PRINT ---
		IF dbo.fn_TongDaySoNguyen(5) >0
			PRINT dbo.fn_TongDaySoNguyen(5)
		ELSE 
			PRINT '...'
		GO


---3. Xây dựng hàm fn_SoNT(@n) trả về 1 nếu @n là số nguyên tố, ngược lại thì trả về 0.

		CREATE FUNCTION fn_SoNT(@n INT)
		RETURNS BIT
		AS
		BEGIN
    		IF @n <= 1
        		RETURN 0
    		DECLARE @i INT = 2
    		WHILE @i * @i <= @n
    		BEGIN
        		IF @n % @i = 0
            		RETURN 0
        		SET @i = @i + 1
    		END
    		RETURN 1
		END
		GO

---4. Xây dựng hàm fn_CacSoNT(@n) trả về chuỗi các số nguyên tố  nằm trong khoảng từ 2 đến n.

		CREATE FUNCTION fn_CacSoNT(@n INT)
		RETURNS NVARCHAR(MAX)
		AS
		BEGIN
    		DECLARE @i INT = 2, @result NVARCHAR(MAX) = ''
    		WHILE @i <= @n
    		BEGIN
        		IF dbo.fn_SoNT(@i) = 1
            		SET @result = @result + CAST(@i AS NVARCHAR) + ', '
        		SET @i = @i + 1
    		END
    		SET @result = SUBSTRING(@result, 0, LEN(@result)) -- Xóa dấu phẩy và khoảng trắng ở cuối
    		RETURN @result
		END
		GO

---5. Xây dựng hàm fn_DTB_MH(@mamh) trả về điểm TB của môn học có mã số truyền vào.

		CREATE FUNCTION fn_DTB_MH(@mamh NVARCHAR(10))
		RETURNS FLOAT
		AS
		BEGIN
			DECLARE @ketqua INT 
    		SELECT @ketqua=AVG(diem) FROM KETQUA WHERE mamh = @mamh
			RETURN @ketqua
		END
		GO
		PRINT N'Điểm trung bình của môn là: ' + CONVERT(nvarchar(10),dbo.fn_DTB_MH('01')) + N' điểm'
		GO

		--Cách 2

		CREATE FUNCTION fn_DTB_MH_2(@mamh NVARCHAR(10))
		RETURNS DECIMAL(5, 2)
		AS
		BEGIN
    		RETURN (
        		SELECT AVG(DIEM)
        		FROM KETQUA
        		WHERE MAMH = @mamh
    		)
		END
		GO

---6. Xây dựng thủ tục sp_CapNhatMH có sử dụng hàm fn_DTB_MH để cập nhật lại số tiết trong bảng MONHOC theo các qui tắc sau:
-- • Tăng 10 tiết nếu ĐTB của SV học dưới 5.
-- • Tăng 5 tiết nếu ĐTB của SV học từ 5 ≤ ĐTB < 7
-- • Không tăng số tiết nếu ĐTB của SV học ≥ 7 hoặc không có SV học.
		--- Cách 1
		CREATE PROCEDURE sp_CapNhatMH(@MaMH varchar(10))
		AS
			IF @MaMH IS NULL
			BEGIN
				PRINT N'Chưa có mã môn học'
				RETURN
			END
			DECLARE @DTB INT, @STT INT 
			SET @DTB=dbo.fn_DTB_MH(@MaMH)
			if @DTB < 5 
				SET @STT = 10;
			IF @DTB >= 5 AND @DTB < 7
				SET @STT = 5;
			IF @DTB > 7 
				SET @STT = 0;
			UPDATE MonHoc
				SET SoTiet = SoTiet + @STT
				WHERE Mamh = @MaMH
			PRINT N'Đã cập nhật'
			
		GO
		SELECT *, dbo.fn_DTB_MH('01')
		FROM MonHoc
		WHERE Mamh = '01'
		EXECUTE sp_CapNhatMH '01'
		GO
		--- Cách 2
		CREATE PROCEDURE sp_CapNhatMH(@MaMH varchar(10))
		AS
		BEGIN
    		UPDATE MONHOC
    		SET SOTIET = CASE
        		WHEN dbo.fn_DTB_MH(MAMH) < 5 THEN SOTIET + 10
        		WHEN dbo.fn_DTB_MH(MAMH) BETWEEN 5 AND 7 THEN SOTIET + 5
        		ELSE SOTIET
    		END
		END
		GO
		PRINT sp_CapNhatMH('01')
		GO

---7. Xây dựng thủ tục sp_CapNhatMH_KyTuDau(@kytudau) có sử dụng hàm fn_DTB_MH để cập nhật lại số tiết trong bảng MONHOC cho các môn học mà tên có ký tự đầu là “T”.

		CREATE PROCEDURE sp_CapNhatMH_KyTuDau(@kytudau NVARCHAR(1))
		AS
		BEGIN
    		UPDATE MONHOC
    		SET SOTIET = CASE
        		WHEN dbo.fn_DTB_MH(MAMH) < 5 THEN SOTIET + 10
        		WHEN dbo.fn_DTB_MH(MAMH) BETWEEN 5 AND 7 THEN SOTIET + 5
        		ELSE SOTIET
    		END
    		WHERE LEFT(TENMH, 1) = @kytudau
		END
		GO

---8. Xây dựng hàm fn_DanhSachSinhVien_DTB(@makh) trả về danh sách các SV của mã khoa truyền vào, gồm các thông tin: mã SV, họ tên SV, ĐTB.

		CREATE FUNCTION fn_DanhSachSinhVien_DTB(@makh NVARCHAR(10))
		RETURNS @result TABLE 
		(
    		MASV NVARCHAR(10),
    		HOTEN NVARCHAR(50),
    		DTB FLOAT
		)
		AS
		BEGIN
    		INSERT INTO @result (MASV, HOTEN, DTB)
    		SELECT SINHVIEN.MASV, SINHVIEN.Hosv+Tensv, AVG(KETQUA.DIEM) AS DTB
    		FROM SINHVIEN
    		INNER JOIN KETQUA ON SINHVIEN.MASV = KETQUA.MASV
    		WHERE SINHVIEN.MAKH = @makh
    		GROUP BY SINHVIEN.MASV, SINHVIEN.Hosv+Tensv

    		RETURN
		END
		GO
		SELECT *
		FROM dbo.fn_DanhSachSinhVien_DTB('TH')
		GO
---9. Xây dựng hàm fn_DanhSachMonHoc(@masv) trả về danh sách gồm các thông tin: mã môn học, tên môn học và điểm số tương ứng của mã SV truyền vào.

		CREATE FUNCTION fn_DanhSachMonHoc(@masv NVARCHAR(10))
		RETURNS TABLE
		AS
		RETURN (
    		SELECT MONHOC.MAMH, MONHOC.TENMH, KETQUA.DIEM
    		FROM MONHOC
    		INNER JOIN KETQUA ON MONHOC.MAMH = KETQUA.MAMH
    		WHERE KETQUA.MASV = @masv
		)
		GO
		SELECT * FROM dbo.fn_DanhSachMonHoc('A01')
		GO
---10. Xây dựng hàm fn_DSSV_ThiMon(@mamh) để lọc danh sách SV đã thi môn học với mã môn truyền vào, gồm các thông tin: mã SV, họ tên SV, tên khoa.

		CREATE FUNCTION fn_DSSV_ThiMon(@mamh NVARCHAR(10))
		RETURNS @result TABLE 
		(		
    		MASV NVARCHAR(10),
    		HOTEN NVARCHAR(50),
    		KHOA NVARCHAR(50)
		)
		AS
		BEGIN
    		INSERT INTO @result (MASV, HOTEN, KHOA)
    		SELECT SINHVIEN.MASV, SINHVIEN.Hosv+Tensv, KHOA.TENKH
    		FROM SINHVIEN
    		INNER JOIN KHOA ON SINHVIEN.MAKH = KHOA.MAKH
    		INNER JOIN KETQUA ON SINHVIEN.MASV = KETQUA.MASV
    		WHERE KETQUA.MAMH = @mamh

    		RETURN
		END
		GO
		SELECT * FROM dbo.fn_DSSV_ThiMon('01')
		GO
---11. Xây dựng hàm fn_DSKhoa_ThiMon(@mamh) để lọc danh sách khoa có SV đã thi môn học với mã môn truyền vào.

		CREATE FUNCTION fn_DSKhoa_ThiMon(@mamh NVARCHAR(10))
		RETURNS TABLE
		AS
		RETURN 
		(
    		SELECT DISTINCT KHOA.MAKH, KHOA.TENKH
    		FROM KHOA
    		INNER JOIN SINHVIEN ON SINHVIEN.MAKH = KHOA.MAKH
    		INNER JOIN KETQUA ON KETQUA.MASV = SINHVIEN.MASV
    		WHERE KETQUA.MAMH = @mamh
		)
		GO

---12. Xây dựng hàm fn_DSKhoa_ThiMon_Diem(@mamh) để lọc danh sách khoa có SV đã thi môn học với mã môn truyền vào, gồm các
--thông tin: mã khoa, tên khoa, điểm thi cao nhất, điểm thi thấp nhất và ĐTB.

		CREATE FUNCTION fn_DSKhoa_ThiMon_Diem(@mamh NVARCHAR(10))
		RETURNS @result TABLE 
		(
    		MAKH NVARCHAR(10),
    		TENKH NVARCHAR(50),
    		MAX_DIEM FLOAT,
    		MIN_DIEM FLOAT,
    		AVG_DIEM FLOAT
		)
		AS
		BEGIN
    		INSERT INTO @result (MAKH, TENKH, MAX_DIEM, MIN_DIEM, AVG_DIEM)
    		SELECT KHOA.MAKH, KHOA.TENKH, MAX(KETQUA.DIEM), MIN(KETQUA.DIEM), AVG(KETQUA.DIEM)
    		FROM KHOA
    		INNER JOIN SINHVIEN ON SINHVIEN.MAKH = KHOA.MAKH
    		INNER JOIN KETQUA ON KETQUA.MASV = SINHVIEN.MASV
    		WHERE KETQUA.MAMH = @mamh
    		GROUP BY KHOA.MAKH, KHOA.TENKH

    		RETURN
		END
		GO

---13. Xây dựng hàm fn_LocDSSV_CapNhatHB(@makh) để lọc danh sách SV (gồm các thông tin: mã SV, họ tên SV, học bổng mới) của
--mã Khoa truyền vào, có cập nhật lại học bổng của SV theo các qui tắc sau:
--	• Không cấp học bổng nếu ĐTB < 7
--	• Cấp học bổng 500.000đ nếu 7 ≤ ĐTB < 8
--	• Cấp học bổng 800.000đ nếu 8 ≤ ĐTB < 9
--	• Cấp học bổng 1.000.000đ nếu 9 ≤ ĐTB ≤ 10

		CREATE FUNCTION fn_LocDSSV_CapNhatHB(@makh NVARCHAR(10))
		RETURNS @KetQua TABLE 
		(
    		MASV NVARCHAR(10),
    		HOTEN NVARCHAR(50),
    		HOCBONG FLOAT
		)
		AS
		BEGIN
    		INSERT INTO @KetQua (MASV, HOTEN, HOCBONG)
    		SELECT SINHVIEN.MASV, SINHVIEN.Hosv+Tensv,
    		CASE 
        		WHEN Diem_TB < 7 THEN 0
        		WHEN Diem_TB >= 7 AND Diem_TB < 8 THEN 500000
        		WHEN Diem_TB >= 8 AND Diem_TB < 9 THEN 800000
        		WHEN Diem_TB >= 9 THEN 1000000
    		END
    		FROM SINHVIEN
    		INNER JOIN (SELECT MASV, AVG(DIEM) AS Diem_TB FROM KETQUA GROUP BY MASV) AS KQ
    		ON SINHVIEN.MASV = KQ.MASV
    		WHERE SINHVIEN.MAKH = @makh

    		RETURN
		END
		GO
		SELECT * FROM dbo.fn_LocDSSV_CapNhatHB('AV')
		GO

---14. Xây dựng hàm fn_LocDSMH_CapNhatSoTiet để lọc danh sách môn học (gồm các thông tin: mã MH, tên MH, ĐTB thi của SV, số tiết cũ,
--số tiết mới) với số tiết mới của SV được tính theo các qui tắc sau:
--	• Không tăng số tiết nếu không có SV học hoặc ĐTB của SV học dưới 5.
--	• Tăng 5 tiết nếu ĐTB của SV học từ 5 ≤ ĐTB < 7
--	• Tăng 10 tiết nếu ĐTB của SV học ≥ 7

		CREATE FUNCTION fn_LocDSMH_CapNhatSoTiet()
		RETURNS @result TABLE 
		(
    		MAMH NVARCHAR(10),
    		TENMH NVARCHAR(50),
    		DTB FLOAT,
    		SOTIET_CU INT,
    		SOTIET_MOI INT
		)
		AS
		BEGIN
    		INSERT INTO @result (MAMH, TENMH, DTB, SOTIET_CU, SOTIET_MOI)
    		SELECT Monhoc.Mamh, TENMH, AVG_DIEM, SOTIET,
    		CASE 
        		WHEN AVG_DIEM IS NULL OR AVG_DIEM < 5 THEN SOTIET
        		WHEN AVG_DIEM >= 5 AND AVG_DIEM < 7 THEN SOTIET + 5
        		WHEN AVG_DIEM >= 7 THEN SOTIET + 10
    		END
    		FROM MONHOC
    		LEFT JOIN (SELECT MAMH, AVG(DIEM) AS AVG_DIEM FROM KETQUA GROUP BY MAMH) AS KQ
    		ON MONHOC.MAMH = KQ.MAMH

    		RETURN
		END
		GO






		ALTER TABLE KHOA ADD SOSV INT;
		ALTER TABLE SINHVIEN ADD DTB REAL, SOTC INT;
		GO

		CREATE TRIGGER UpdateStudentAverageAndCredit
		ON KETQUA
		FOR INSERT, UPDATE, DELETE
		AS
		BEGIN
    		UPDATE SINHVIEN
    		SET DTB = (SELECT AVG(DIEM) FROM KETQUA WHERE MASV = INSERTED.MASV),
    		SOTC = (SELECT SUM(SOTC) FROM MONHOC WHERE MAMH IN (SELECT MAMH FROM KETQUA WHERE MASV = INSERTED.MASV))
    		FROM INSERTED
		END;
		GO


---@Author By HieuNguyenDuc NTTU------------------------------------------------------------------------------------------------













