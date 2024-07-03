CREATE TABLE DANHMUC (
    MADM    NUMBER(8,0) NOT NULL PRIMARY KEY,
    LOAI    NVARCHAR2(50),
    TEN     NVARCHAR2(80),
    NSX     DATE,
    HSD     DATE,
    KL      VARCHAR2(50), ---KH?I L??NG
    GT      NVARCHAR2(50),
    NG_GOC  NVARCHAR2(50),
    SL      NUMBER(8,0),
    GIA     NUMBER(12,0)
)
CREATE TABLE KHACHHANG (
  MAKH      NUMBER(8,0) NOT NULL PRIMARY KEY,
  HOTEN     NVARCHAR2(50),
  LOAI      NVARCHAR2(20),
  NGSINH    DATE,
  DIACHI    NVARCHAR2(100),
  SDT       VARCHAR2(15),
  EMAIL     VARCHAR2(50)
);
CREATE TABLE NHANVIEN (
  MANV      NUMBER(8,0) NOT NULL PRIMARY KEY,
  HOTEN     NVARCHAR2(50),
  NGSINH    DATE,
  GIOITINH  NVARCHAR2(10),
  SDT       VARCHAR2(20),
  DIACHI    NVARCHAR2(100),
  CHUCVU    NVARCHAR2(50)
);
CREATE TABLE GUITHUCUNG
(
    SOPHIEUGUI  NUMBER(8,0) NOT NULL PRIMARY KEY,
	TEN         NVARCHAR2(50),
	NGAYGUI     DATE,
	NGAYTRA     DATE,
	LOAI        NVARCHAR2(50),
	GIOITINH    NVARCHAR2(50),
	GIA         NUMBER(12,0),
    MAKH        NUMBER(8,0)
)
--TAIKHOAN
CREATE TABLE TAIKHOAN(
	MANV	NUMBER(8,0),
	TENDN	VARCHAR2(20),
	MK		VARCHAR2(20),
	constraint pk_tk primary key(MANV)
)
----------------------------------
CREATE TABLE HOADON
(
	SOHD            NUMBER(8,0) not null primary key,
	NGHD            DATE,
	PHUONGTHUCTT    NVARCHAR2(50),
	GIAMGIA         NUMBER(12,0),
	TRIGIA          NUMBER(12,0),
    TONGCONG        NUMBER(12,0),
	MANV            NUMBER(8,0)
)

-- CTHD
CREATE TABLE CTHD(
	SOHD	NUMBER(8,0),
	ID		NUMBER(8,0),
	SL		NUMBER(8,0),
    THANHTIEN NUMBER(12,0),
	constraint pk_cthd primary key(SOHD,ID)
)
---------------------------------------------------
ALTER TABLE GUITHUCUNG ADD FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV)
-- Khoa ngoai cho bang TAIKHOAN
ALTER TABLE TAIKHOAN ADD CONSTRAINT fk_TK FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD FOREIGN KEY (ID) REFERENCES DANHMUC(MADM);
------------------------------------------------------------------------------------------
alter table HOADON add check (GIAMGIA in (10000, 30000));
ALTER TABLE KHACHHANG ADD CHECK (LOAI IN('VIP', 'Th�nh vi�n'))
ALTER TABLE CTHD ADD CONSTRAINT Check_So_luong CHECK (SL > 0);
ALTER TABLE TAIKHOAN ADD CONSTRAINT Check_Ten_DN_1 CHECK (TENDN = MANV);
alter table HOADON add check (PHUONGTHUCTT in ('Chuy?n kho?n', 'Ti?n m?t'));
---------------------------------------------------------------------------------------------
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'X?t h??ng d?n - Kong', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-01', 'YYYY-MM-DD'), '100ml', NULL, 'M?', 50, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'T�i d?n ph�n - Furminator', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), '50 t�i', NULL, 'M?', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'B�nh s?a ch� m�o - Pedigree', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2026-06-03', 'YYYY-MM-DD'), '250ml', NULL, 'M?', 80, 100000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'Kh?n t?m - Royal Canin', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2026-06-04', 'YYYY-MM-DD'), '10 c�i', NULL, 'Ph�p', 120, 80000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'X?t kh? tr�ng - Ruffwear', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2026-06-05', 'YYYY-MM-DD'), '200ml', NULL, 'M?', 60, 200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'X?t kh? m�i - Hartz', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2026-06-06', 'YYYY-MM-DD'), '150ml', NULL, 'M?', 90, 120000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'B�n ch� t?m - Chuckit!', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2026-06-07', 'YYYY-MM-DD'), '1 c�i', NULL, 'M?', 30, 250000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'Kem ?�nh r?ng ch� m�o - Earthbath', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2026-06-08', 'YYYY-MM-DD'), '100g', NULL, 'M?', 70, 90000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'v�ng c? ch?ng li?m - Nylabone', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2026-06-09', 'YYYY-MM-DD'), '1 c�i', NULL, 'M?', 50, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'G?ng tay t?m - Kong', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2026-06-10', 'YYYY-MM-DD'), '1 ?�i', NULL, 'M?', 40, 180000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'Clicker hu?n luy?n ch� - Furminator', TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_DATE('2026-06-11', 'YYYY-MM-DD'), '1 c�i', NULL, 'M?', 60, 70000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'X?t th?m mi?ng - Pedigree', TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), '50ml', NULL, 'M?', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'dung d?ch v? sinh tai - Royal Canin', TO_DATE('2023-06-13', 'YYYY-MM-DD'), TO_DATE('2026-06-13', 'YYYY-MM-DD'), '30ml', NULL, 'Ph�p', 80, 90000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'N??c nh? m?t - Ruffwear', TO_DATE('2023-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-14', 'YYYY-MM-DD'), '50ml', NULL, 'M?', 120, 60000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'b?t nh? l�ng tai - Hartz', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2026-06-15', 'YYYY-MM-DD'), '50g', NULL, 'M?', 90, 80000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'X?t d??ng l�ng - Chuckit!', TO_DATE('2023-06-16', 'YYYY-MM-DD'), TO_DATE('2026-06-16', 'YYYY-MM-DD'), '200ml', NULL, 'M?', 70, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'N??c hoa - Earthbath', TO_DATE('2023-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-17', 'YYYY-MM-DD'), '50ml', NULL, 'M?', 80, 70000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m s�c ch�', 'T�i d?n ph�n - Nylabone', TO_DATE('2023-06-18', 'YYYY-MM-DD'), TO_DATE('2026-06-18', 'YYYY-MM-DD'), '100 t�i', NULL, 'M?', 100, 40000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'Qu?n �o cho ch� - Ruffwear - ??', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2033-06-01', 'YYYY-MM-DD'), 'S', NULL, 'M?', 50, 200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'V�ng c? d�y d?t ch� - Puppia - H?ng', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2033-06-02', 'YYYY-MM-DD'), 'M', NULL, 'H�n Qu?c', 100, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'R? m�m cho ch� - Hurtta - Xanh l�', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2033-06-03', 'YYYY-MM-DD'), 'L', NULL, 'Ph?n Lan', 80, 300000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'Qu?n �o cho ch� - Pet Life - Xanh d??ng', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2033-06-04', 'YYYY-MM-DD'), 'XS', NULL, 'M?', 120, 100000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'V�ng c? d�y d?t ch� - Gooby - X�m', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2033-06-05', 'YYYY-MM-DD'), 'XL', NULL, 'M?', 60, 180000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'R? m�m cho ch� - Ruffwear - ?en', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2033-06-06', 'YYYY-MM-DD'), 'S', NULL, 'M?', 90, 250000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'Qu?n �o cho ch� - Puppia - Tr?ng', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2033-06-07', 'YYYY-MM-DD'), 'M', NULL, 'H�n Qu?c', 70, 120000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'V�ng c? d�y d?t ch� - Hurtta - H?a ti?t', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2033-06-08', 'YYYY-MM-DD'), 'L', NULL, 'Ph?n Lan', 50, 280000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'R? m�m cho ch� - Pet Life - Nhi?u m�u', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2033-06-09', 'YYYY-MM-DD'), 'XS', NULL, 'M?', 110, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho ch�', 'Qu?n �o cho ch� - Gooby - ??', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2033-06-10', 'YYYY-MM-DD'), 'XL', NULL, 'M?', 80, 220000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng cho ch�', 'Royal Canin - v? b� h?m', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-10', 'YYYY-MM-DD'), '500g', NULL, 'Vi?t Nam', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho ch�', 'Hills Science Diet - v? b� n??ng', TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), '2kg', NULL, 'M?', 50, 800000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('B�nh th??ng cho ch�', 'Purina Pro Plan - v? g�', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2024-06-02', 'YYYY-MM-DD'), '300g', NULL, 'M?', 200, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate cho ch�', 'Orijen - v? v?t quay', TO_DATE('2023-05-29', 'YYYY-MM-DD'), TO_DATE('2023-06-29', 'YYYY-MM-DD'), '400g', NULL, 'Canada', 80, 200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('X�c x�ch cho ch�', 'Acana - v? rau c?', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2024-06-03', 'YYYY-MM-DD'), '250g', NULL, 'Canada', 150, 120000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Dinh d??ng cho ch�', 'Wellness - v? b� h?m', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), '1kg', NULL, 'M?', 70, 300000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng cho ch�', 'Royal Canin - v? b� n??ng', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), '300g', NULL, 'Ph�p', 120, 45000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho ch�', 'Hills Science Diet - v? g�', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2024-06-04', 'YYYY-MM-DD'), '3kg', NULL, 'M?', 30, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('B�nh th??ng cho ch�', 'Purina Pro Plan - v? v?t quay', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '200g', NULL, 'M?', 80, 180000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate cho ch�', 'Orijen - v? rau c?', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2023-07-03', 'YYYY-MM-DD'), '500g', NULL, 'Canada', 60, 250000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('X�c x�ch cho ch�', 'Acana - v? b� h?m', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-07', 'YYYY-MM-DD'), '350g', NULL, 'Canada', 100, 130000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Dinh d??ng cho ch�', 'Wellness - v? b� n??ng', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), '1.5kg', NULL, 'M?', 90, 280000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng cho ch�', 'Royal Canin - v? g�', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), '400g', NULL, 'Ph�p', 80, 55000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho ch�', 'Hills Science Diet - v? v?t quay', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2024-06-08', 'YYYY-MM-DD'), '4kg', NULL, 'M?', 20, 1500000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('B�nh th??ng cho ch�', 'Purina Pro Plan - v? rau c?', TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), '250g', NULL, 'M?', 150, 160000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate cho ch�', 'Orijen - v? b� n??ng', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2023-07-09', 'YYYY-MM-DD'), '600g', NULL, 'Canada', 40, 280000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('X�c x�ch cho ch�', 'Acana - v? g�', TO_DATE('2023-06-13', 'YYYY-MM-DD'), TO_DATE('2024-06-13', 'YYYY-MM-DD'), '400g', NULL, 'Canada', 80, 110000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Dinh d??ng cho ch�', 'Wellness - v? v?t quay', TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_DATE('2023-07-11', 'YYYY-MM-DD'), '2kg', NULL, 'M?', 60, 350000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng cho ch�', 'Royal Canin - v? rau c?', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), '350g', NULL, 'Ph�p', 100, 48000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho ch�', 'Hills Science Diet - v? b� h?m', TO_DATE('2023-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-14', 'YYYY-MM-DD'), '5kg', NULL, 'M?', 10, 2000000);
--------------------------------------------------------------------------------------------------------------------------------------------




--DANHMUC
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t kh�', 'Me-O - V? v?t quay', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), '500g', NULL, 'Vi?t Nam', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t kh�', 'Minino Yum - V? rau c?', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), '1kg', NULL, 'M?', 200, 80000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Whiskas - V? b�', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), '100g', NULL, 'H�n', 150, 10000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Nutrience Original Healthy Adult Indoor - V? th?t heo', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), '200g', NULL, 'Trung', 120, 15000);
-- S�p th??ng ?n li?n
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng ?n li?n', 'Cat�s Eye - V? g�', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), '80g', NULL, 'Vi?t Nam', 80, 12000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng ?n li?n', 'Home - Cat - V? c�', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), '100g', NULL, 'M?', 100, 15000);

-- Snack - B�nh th??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - B�nh th??ng', 'Royal Canin - V? th?t heo', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), '200g', NULL, 'H�n', 120, 18000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - B�nh th??ng', 'CatsRang - V? c�', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'), '150g', NULL, 'Trung', 90, 20000);

-- Vitamin - Dinh d??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Me-O - Dinh d??ng t?ng h?p', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), '60g', NULL, 'Vi?t Nam', 200, 25000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Nutrience Original Healthy Adult Indoor - Dinh d??ng chuy�n bi?t', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), '80g', NULL, 'M?', 150, 28000);

-- C? m�o - Catnip
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('C? m�o - Catnip', 'Cat�s Eye - C? m�o t? nhi�n', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), '20g', NULL, 'Vi?t Nam', 50, 8000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('C? m�o - Catnip', 'Home - Cat - Catnip h?u c?', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), '15g', NULL, 'M?', 70, 10000);

-- B�t ?n - B�nh u?ng n??c
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('B�t ?n - B�nh u?ng n??c', 'Royal Canin - B�t ?n nh?a', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), NULL, NULL, 'H�n', 100, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('B�t ?n - B�nh u?ng n??c', 'CatsRang - B�nh u?ng n??c t? ??ng', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), NULL, NULL, 'Trung', 80, 250000);
-- B�t ?n - B�nh u?ng n??c
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('B�t ?n - B�nh u?ng n??c', 'Me-O - B�t ?n inox', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), NULL, NULL, 'Vi?t Nam', 200, 350000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('B�t ?n - B�nh u?ng n??c', 'Nutrience Original Healthy Adult Indoor - B�nh u?ng n??c th?y tinh', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), NULL, NULL, 'M?', 150, 450000);
-- Vitamin - Dinh d??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Whiskas - Vitamin t?ng h?p', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), '50g', NULL, 'H�n', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Cat�s Eye - Dinh d??ng ch?t l??ng cao', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), '80g', NULL, 'Vi?t Nam', 150, 60000);

-- Th?c ?n h?t kh�
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t kh�', 'Minino Yum - V? v?t quay', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), '1kg', NULL, 'Trung', 50, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t kh�', 'Me-O - V? rau c?', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'), '2kg', NULL, 'Vi?t Nam', 80, 200000);
-- Pate - N??c s?t
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Whiskas - V? b�', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), '85g', NULL, 'M?', 200, 10000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Royal Canin - V? th?t heo', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), '100g', NULL, 'H�n', 150, 12000);
-- S�p th??ng ?n li?n
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng ?n li?n', 'Nutrience Original Healthy Adult Indoor - V? c�', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), '80g', NULL, 'M?', 100, 15000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('S�p th??ng ?n li?n', 'Home - Cat - V? v?t quay', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), '70g', NULL, 'Vi?t Nam', 120, 12000);

-- Snack - B�nh th??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - B�nh th??ng', 'CatsRang - Snack b�nh th?t heo', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), '50g', NULL, 'Trung', 80, 8000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - B�nh th??ng', 'Me-O - Snack b�nh rau c?', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), '60g', NULL, 'Vi?t Nam', 90, 10000);
















INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'Khay - Nh� v? sinh', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '500g', NULL, 'M?', 100, 100000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'C�t v? sinh cho m�o', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '1kg', NULL, 'Vi?t Nam', 50, 150000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m s�c', 'S?a t?m - X?t d??ng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Trung', 80, 200000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'L??c ch?i l�ng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'H�n', 120, 50000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m s�c', 'M�y m�i - K?m c?t m�ng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, '�', 70, 300000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'Khay - Nh� v? sinh', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '500g', NULL, 'Vi?t Nam', 90, 80000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m s�c', 'C�t v? sinh cho m�o', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '1kg', NULL, 'M?', 60, 120000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'B�t ?n - Ch�n n??c', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '200g', NULL, 'M?', 150, 90000);
      INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'M�i     che nh� v? sinh', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 80, 180000);
 INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m s�c', 'L??c ch?i l�ng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'H�n', 120, 50000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m s�c', 'M�y m�i - K?m c?t m�ng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, '�', 70, 300000);


































INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? d�ng', 'Qu?n �o - Trang s?c', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'M?', 200, 120000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'V�ng c? - D�y d?t', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 150, 80000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? ch?i', '?? ch?i - Hu?n luy?n', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Trung', 100, 50000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'T�i x�ch m�o', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'H�n', 80, 150000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? d�ng', 'Balo ??ng m�o', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, '�', 120, 200000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? ch?i', 'L?ng v?n chuy?n', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 100, 250000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? d�ng', 'B�t ?n - Ch�n n??c', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Trung', 150, 90000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'Balo ??ng m�o', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'H�n', 80, 180000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'D�y d?t ch�', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'M?', 100, 75000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? ch?i', 'C?u ch?i m�o', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 200, 60000);

























--THUCUNG
-- Th�m d? li?u cho lo?i m�o
INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o M? (American Shorthair)', 'Nh?', 'C�i', 'M?', 10, 500000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Ba T? (Persian Cat)', 'Trung b�nh', 'C�i', 'Ba T?', 8, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Bengal (Bengal Cat)', 'Nh?', 'C�i', 'Bengal', 5, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Siberian (Siberian Cat)', 'Trung b�nh', 'C�i', 'Nga', 7, 900000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Nga (Russian Blue)', 'Nh?', 'C�i', 'Nga', 9, 600000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Siamese (Siamese Cat)', 'Nh?', 'C�i', 'Siamese', 6, 700000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Maine Coon (Maine Coon Cat)', 'L?n', 'C�i', 'Maine Coon', 3, 1500000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Ragdoll (Ragdoll Cat)', 'L?n', 'C�i', 'M?', 4, 1400000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Scottish Fold (Scottish Fold Cat)', 'Trung b�nh', 'C�i', 'Scotland', 5, 1100000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Sphynx (Sphynx Cat)', 'Nh?', 'C�i', 'M?', 6, 1300000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Abyssinian (Abyssinian Cat)', 'Trung b�nh', 'C�i', 'Abyssinia', 7, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Oriental Shorthair (Oriental Shorthair)', 'Nh?', 'C�i', 'Mi?n ?�ng', 8, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o British Shorthair (British Shorthair)', 'L?n', 'C�i', 'Anh', 5, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Devon Rex (Devon Rex)', 'Trung b�nh', 'C�i', 'Anh', 6, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('M�o', 'M�o Chartreux (Chartreux Cat)', 'L?n', 'C�i', 'Ph�p', 4, 1300000);


-- Th�m d? li?u cho lo?i ch�
INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Ph?c S�c (Poodle)', 'Nh?', 'C�i', 'M?', 9, 600000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Chihuahua (Chihuahua)', 'Nh?', 'C�i', 'Mexico', 10, 500000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Bulldog (Bulldog)', 'Trung b�nh', 'C�i', 'Anh', 7, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Pomeranian (Pomeranian)', 'Nh?', 'C�i', '??c', 8, 700000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Corgi (Corgi)', 'Trung b�nh', 'C�i', 'X? Wales', 6, 900000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Husky Siberia (Siberian Husky)', 'L?n', 'C�i', 'Nga', 5, 1100000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Golden Retriever (Golden Retriever)', 'L?n', 'C�i', 'Anh', 4, 1300000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Labrador Retriever (Labrador Retriever)', 'L?n', 'C�i', 'Canada', 6, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Beagle (Beagle)', 'Trung b�nh', 'C�i', 'Anh', 7, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Boxer (Boxer)', 'L?n', 'C�i', '??c', 8, 700000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Doberman (Doberman)', 'L?n', 'C�i', '??c', 5, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Dalmatian (Dalmatian)', 'L?n', 'C�i', 'Croatia', 6, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Shih Tzu (Shih Tzu)', 'Nh?', 'C�i', 'Trung Qu?c', 7, 900000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� Rottweiler (Rottweiler)', 'L?n', 'C�i', '??c', 4, 1400000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ch�', 'Ch� German Shepherd (German Shepherd)', 'L?n', 'C�i', '??c', 3, 1500000);





























--NHAN VIEN

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Nguy?n V?n An', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Nam', '0987654321', 'H� N?i', 'B�n h�ng');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Tr?n Th? B�nh', TO_DATE('1992-02-10', 'YYYY-MM-DD'), 'N?', '0123456789', 'H? Ch� Minh', 'Kho');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Ph?m V?n C??ng', TO_DATE('1985-08-25', 'YYYY-MM-DD'), 'Nam', '0987654321', '?� N?ng', 'Qu?n l�');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('L� Th? Dung', TO_DATE('1993-11-20', 'YYYY-MM-DD'), 'N?', '0123456789', 'H?i Ph�ng', 'Ch?m s�c');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Ho�ng V?n H?i', TO_DATE('1991-07-05', 'YYYY-MM-DD'), 'Nam', '0987654321', 'C?n Th?', 'B�n h�ng');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Nguy?n Th? Kim', TO_DATE('1990-09-18', 'YYYY-MM-DD'), 'N?', '0123456789', 'B�nh D??ng', 'Kho');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Tr?n V?n L�m', TO_DATE('1988-03-12', 'YYYY-MM-DD'), 'Nam', '0987654321', 'H?i D??ng', 'Qu?n l�');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Ph?m Th? Mai', TO_DATE('1995-06-28', 'YYYY-MM-DD'), 'N?', '0123456789', 'Hu?', 'Ch?m s�c');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('L� V?n Nam', TO_DATE('1994-01-02', 'YYYY-MM-DD'), 'Nam', '0987654321', 'Ngh? An', 'B�n h�ng');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Ph?m Th? Qu?nh', TO_DATE('1993-04-28', 'YYYY-MM-DD'), 'N?', '0123456789', 'H� T?nh', 'Qu?n l�');














--KHACHHANG
INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n V?n Anh', 'Th�nh vi�n', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'H� N?i', '1234567890', 'nguyenvananh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n Th? B�ch', 'VIP', TO_DATE('1992-02-10', 'YYYY-MM-DD'), 'H? Ch� Minh', '0987654321', 'tranthibich@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m V?n C??ng', 'Th�nh vi�n', TO_DATE('1985-08-25', 'YYYY-MM-DD'), '?� N?ng', '0123456789', 'phamvancuong@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('L� Th? Dung', 'Th�nh vi�n', TO_DATE('1993-11-20', 'YYYY-MM-DD'), 'H?i Ph�ng', '0987654321', 'lethidung@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ho�ng V?n H�ng', 'VIP', TO_DATE('1991-07-05', 'YYYY-MM-DD'), 'C?n Th?', '0123456789', 'hoangvanhung@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n Th? Kim', 'Th�nh vi�n', TO_DATE('1990-09-18', 'YYYY-MM-DD'), 'B�nh D??ng', '0987654321', 'nguyenthikim@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n V?n L�m', 'Th�nh vi�n', TO_DATE('1988-03-12', 'YYYY-MM-DD'), 'H?i D??ng', '0123456789', 'tranvanlam@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m Th? Mai', 'VIP', TO_DATE('1995-06-28', 'YYYY-MM-DD'), 'Hu?', '0987654321', 'phamthimai@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n V?n Quang', 'Th�nh vi�n', TO_DATE('1993-12-15', 'YYYY-MM-DD'), 'H� N?i', '0987654321', 'nguyenvanquang@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n Th? Linh', 'VIP', TO_DATE('1991-09-20', 'YYYY-MM-DD'), 'H? Ch� Minh', '0123456789', 'tranthilinh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m V?n T�', 'Th�nh vi�n', TO_DATE('1994-07-25', 'YYYY-MM-DD'), '?� N?ng', '0987654321', 'phamvantu@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('L� Th? H?nh', 'Th�nh vi�n', TO_DATE('1990-03-10', 'YYYY-MM-DD'), 'H?i Ph�ng', '0123456789', 'lethihanh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ho�ng Th? Y?n', 'VIP', TO_DATE('1989-11-18', 'YYYY-MM-DD'), 'C?n Th?', '0987654321', 'hoangthiyen@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n V?n B�nh', 'Th�nh vi�n', TO_DATE('1992-06-12', 'YYYY-MM-DD'), 'B�nh D??ng', '0123456789', 'nguyenvanbinh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n Th? Th?o', 'Th�nh vi�n', TO_DATE('1996-08-28', 'YYYY-MM-DD'), 'H?i D??ng', '0987654321', 'tranthithao@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('L� V?n Nam', 'VIP', TO_DATE('1993-01-02', 'YYYY-MM-DD'), 'Hu?', '0123456789', 'levannam@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m Th? H??ng', 'Th�nh vi�n', TO_DATE('1995-04-28', 'YYYY-MM-DD'), 'Ngh? An', '0987654321', 'phamthihuong@gmail.com');

























--GUITHUCUNG

-- V� d? 1
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (18, 'M�o M? (American Shorthair)', TO_DATE('2023-06-07', 'YYYY-MM-DD'), 'm�o', '??c');

-- V� d? 2
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (19, 'M�o Ba T? (Persian Cat)', TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'm�o', 'c�i');

-- V� d? 3
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (19, 'M�o Bengal (Bengal Cat)', TO_DATE('2023-06-09', 'YYYY-MM-DD'), 'm�o', '??c');

-- V� d? 4
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (19, 'M�o Siberian (Siberian Cat)', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'm�o', 'c�i');

-- V� d? 5
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (23, 'M�o Nga (Russian Blue)', TO_DATE('2023-06-11', 'YYYY-MM-DD'), 'm�o', '??c');

-- V� d? 6
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (23, 'M�o Siamese (Siamese Cat)', TO_DATE('2023-06-12', 'YYYY-MM-DD'), 'm�o', 'c�i');

-- V� d? 7
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (24, 'M�o Maine Coon (Maine Coon Cat)', TO_DATE('2023-06-13', 'YYYY-MM-DD'), 'm�o', '??c');

-- V� d? 8
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (28, 'M�o Ragdoll (Ragdoll Cat)', TO_DATE('2023-06-14', 'YYYY-MM-DD'), 'm�o', 'c�i');

-- V� d? 9
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (28, 'M�o Scottish Fold (Scottish Fold Cat)', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'm�o', '??c');

-- V� d? 10
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (29, 'M�o Sphynx (Sphynx Cat)', TO_DATE('2023-06-16', 'YYYY-MM-DD'), 'm�o', 'c�i');
-- V� d? 11
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (29, 'Ch� Ph?c S�c (Poodle)', TO_DATE('2023-06-17', 'YYYY-MM-DD'), 'ch�', '??c');

-- V� d? 12
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (32, 'Ch� Chihuahua (Chihuahua)', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 'ch�', 'c�i');

-- V� d? 13
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (32, 'Ch� Bulldog (Bulldog)', TO_DATE('2023-06-19', 'YYYY-MM-DD'), 'ch�', '??c');






--HOADON

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Chuy?n kho?n', 10000, NULL, NULL, 21522011);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-02', 'YYYY-MM-DD'), 'Ti?n m?t', 30000, NULL, NULL, 21522011);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'Chuy?n kho?n', 10000, NULL, NULL, 21522011);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-03', 'YYYY-MM-DD'), 'Ti?n m?t', 10000, NULL, NULL, 21522015);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'Chuy?n kho?n', 30000, NULL, NULL, 21522015);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-21', 'YYYY-MM-DD'), 'Ti?n m?t', 10000, NULL, NULL, 21522015);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-05', 'YYYY-MM-DD'), 'Chuy?n kho?n', 30000, NULL, NULL, 21522019);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-06', 'YYYY-MM-DD'), 'Ti?n m?t', 10000, NULL, NULL, 21522019);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-05-19', 'YYYY-MM-DD'), 'Chuy?n kho?n', 30000, NULL, NULL, 21522019);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Chuy?n kho?n', 10000, 50000, 40000, 21522011);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-01-02', 'YYYY-MM-DD'), 'Ti?n m?t', 30000, 80000, 50000, 21522015);

INSERT INTO HOADON (NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV)
VALUES (TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Chuy?n kho?n', 10000, 60000, 50000, 21522015);







--CTHD
INSERT INTO CTHD (SOHD, ID, SL) VALUES (37, 2225, 3);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (37, 2226, 4);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (37, 2227, 2);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (37, 2228, 6);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (38, 2229, 1);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (38, 2230, 5);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (39, 2240, 2);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (40, 2242, 3);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (40, 2244, 4);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (41, 2246, 6);

INSERT INTO CTHD (SOHD, ID, SL) VALUES (42, 2248, 3);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (42, 2250, 2);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (42, 2252, 1);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (42, 2254, 4);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (42, 2256, 6);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (43, 2258, 6);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (43, 2260, 5);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (44, 2262, 3);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (44, 2264, 2);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (45, 2268, 1);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (46, 2270, 4);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (47, 2272, 6);
INSERT INTO CTHD (SOHD, ID, SL) VALUES (48, 2274, 5);







