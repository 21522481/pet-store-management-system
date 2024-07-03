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
ALTER TABLE KHACHHANG ADD CHECK (LOAI IN('VIP', 'Thành viên'))
ALTER TABLE CTHD ADD CONSTRAINT Check_So_luong CHECK (SL > 0);
ALTER TABLE TAIKHOAN ADD CONSTRAINT Check_Ten_DN_1 CHECK (TENDN = MANV);
alter table HOADON add check (PHUONGTHUCTT in ('Chuy?n kho?n', 'Ti?n m?t'));
---------------------------------------------------------------------------------------------
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'X?t h??ng d?n - Kong', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-01', 'YYYY-MM-DD'), '100ml', NULL, 'M?', 50, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'Túi d?n phân - Furminator', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), '50 túi', NULL, 'M?', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'Bình s?a chó mèo - Pedigree', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2026-06-03', 'YYYY-MM-DD'), '250ml', NULL, 'M?', 80, 100000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'Kh?n t?m - Royal Canin', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2026-06-04', 'YYYY-MM-DD'), '10 cái', NULL, 'Pháp', 120, 80000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'X?t kh? trùng - Ruffwear', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2026-06-05', 'YYYY-MM-DD'), '200ml', NULL, 'M?', 60, 200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'X?t kh? mùi - Hartz', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2026-06-06', 'YYYY-MM-DD'), '150ml', NULL, 'M?', 90, 120000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'Bàn chà t?m - Chuckit!', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2026-06-07', 'YYYY-MM-DD'), '1 cái', NULL, 'M?', 30, 250000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'Kem ?ánh r?ng chó mèo - Earthbath', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2026-06-08', 'YYYY-MM-DD'), '100g', NULL, 'M?', 70, 90000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'vòng c? ch?ng li?m - Nylabone', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2026-06-09', 'YYYY-MM-DD'), '1 cái', NULL, 'M?', 50, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'G?ng tay t?m - Kong', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2026-06-10', 'YYYY-MM-DD'), '1 ?ôi', NULL, 'M?', 40, 180000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'Clicker hu?n luy?n chó - Furminator', TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_DATE('2026-06-11', 'YYYY-MM-DD'), '1 cái', NULL, 'M?', 60, 70000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'X?t th?m mi?ng - Pedigree', TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), '50ml', NULL, 'M?', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'dung d?ch v? sinh tai - Royal Canin', TO_DATE('2023-06-13', 'YYYY-MM-DD'), TO_DATE('2026-06-13', 'YYYY-MM-DD'), '30ml', NULL, 'Pháp', 80, 90000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'N??c nh? m?t - Ruffwear', TO_DATE('2023-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-14', 'YYYY-MM-DD'), '50ml', NULL, 'M?', 120, 60000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'b?t nh? lông tai - Hartz', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2026-06-15', 'YYYY-MM-DD'), '50g', NULL, 'M?', 90, 80000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'X?t d??ng lông - Chuckit!', TO_DATE('2023-06-16', 'YYYY-MM-DD'), TO_DATE('2026-06-16', 'YYYY-MM-DD'), '200ml', NULL, 'M?', 70, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'N??c hoa - Earthbath', TO_DATE('2023-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-17', 'YYYY-MM-DD'), '50ml', NULL, 'M?', 80, 70000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('V?t d?ng ch?m sóc chó', 'Túi d?n phân - Nylabone', TO_DATE('2023-06-18', 'YYYY-MM-DD'), TO_DATE('2026-06-18', 'YYYY-MM-DD'), '100 túi', NULL, 'M?', 100, 40000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'Qu?n áo cho chó - Ruffwear - ??', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2033-06-01', 'YYYY-MM-DD'), 'S', NULL, 'M?', 50, 200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'Vòng c? dây d?t chó - Puppia - H?ng', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2033-06-02', 'YYYY-MM-DD'), 'M', NULL, 'Hàn Qu?c', 100, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'R? mõm cho chó - Hurtta - Xanh lá', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2033-06-03', 'YYYY-MM-DD'), 'L', NULL, 'Ph?n Lan', 80, 300000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'Qu?n áo cho chó - Pet Life - Xanh d??ng', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2033-06-04', 'YYYY-MM-DD'), 'XS', NULL, 'M?', 120, 100000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'Vòng c? dây d?t chó - Gooby - Xám', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2033-06-05', 'YYYY-MM-DD'), 'XL', NULL, 'M?', 60, 180000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'R? mõm cho chó - Ruffwear - ?en', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2033-06-06', 'YYYY-MM-DD'), 'S', NULL, 'M?', 90, 250000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'Qu?n áo cho chó - Puppia - Tr?ng', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2033-06-07', 'YYYY-MM-DD'), 'M', NULL, 'Hàn Qu?c', 70, 120000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'Vòng c? dây d?t chó - Hurtta - H?a ti?t', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2033-06-08', 'YYYY-MM-DD'), 'L', NULL, 'Ph?n Lan', 50, 280000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'R? mõm cho chó - Pet Life - Nhi?u màu', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2033-06-09', 'YYYY-MM-DD'), 'XS', NULL, 'M?', 110, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Ph? ki?n cho chó', 'Qu?n áo cho chó - Gooby - ??', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2033-06-10', 'YYYY-MM-DD'), 'XL', NULL, 'M?', 80, 220000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng cho chó', 'Royal Canin - v? bò h?m', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-10', 'YYYY-MM-DD'), '500g', NULL, 'Vi?t Nam', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho chó', 'Hills Science Diet - v? bò n??ng', TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), '2kg', NULL, 'M?', 50, 800000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Bánh th??ng cho chó', 'Purina Pro Plan - v? gà', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2024-06-02', 'YYYY-MM-DD'), '300g', NULL, 'M?', 200, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate cho chó', 'Orijen - v? v?t quay', TO_DATE('2023-05-29', 'YYYY-MM-DD'), TO_DATE('2023-06-29', 'YYYY-MM-DD'), '400g', NULL, 'Canada', 80, 200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Xúc xích cho chó', 'Acana - v? rau c?', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2024-06-03', 'YYYY-MM-DD'), '250g', NULL, 'Canada', 150, 120000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Dinh d??ng cho chó', 'Wellness - v? bò h?m', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), '1kg', NULL, 'M?', 70, 300000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng cho chó', 'Royal Canin - v? bò n??ng', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), '300g', NULL, 'Pháp', 120, 45000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho chó', 'Hills Science Diet - v? gà', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2024-06-04', 'YYYY-MM-DD'), '3kg', NULL, 'M?', 30, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Bánh th??ng cho chó', 'Purina Pro Plan - v? v?t quay', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '200g', NULL, 'M?', 80, 180000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate cho chó', 'Orijen - v? rau c?', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2023-07-03', 'YYYY-MM-DD'), '500g', NULL, 'Canada', 60, 250000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Xúc xích cho chó', 'Acana - v? bò h?m', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-07', 'YYYY-MM-DD'), '350g', NULL, 'Canada', 100, 130000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Dinh d??ng cho chó', 'Wellness - v? bò n??ng', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), '1.5kg', NULL, 'M?', 90, 280000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng cho chó', 'Royal Canin - v? gà', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), '400g', NULL, 'Pháp', 80, 55000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho chó', 'Hills Science Diet - v? v?t quay', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2024-06-08', 'YYYY-MM-DD'), '4kg', NULL, 'M?', 20, 1500000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Bánh th??ng cho chó', 'Purina Pro Plan - v? rau c?', TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), '250g', NULL, 'M?', 150, 160000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate cho chó', 'Orijen - v? bò n??ng', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2023-07-09', 'YYYY-MM-DD'), '600g', NULL, 'Canada', 40, 280000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Xúc xích cho chó', 'Acana - v? gà', TO_DATE('2023-06-13', 'YYYY-MM-DD'), TO_DATE('2024-06-13', 'YYYY-MM-DD'), '400g', NULL, 'Canada', 80, 110000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Dinh d??ng cho chó', 'Wellness - v? v?t quay', TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_DATE('2023-07-11', 'YYYY-MM-DD'), '2kg', NULL, 'M?', 60, 350000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng cho chó', 'Royal Canin - v? rau c?', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), '350g', NULL, 'Pháp', 100, 48000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t cho chó', 'Hills Science Diet - v? bò h?m', TO_DATE('2023-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-14', 'YYYY-MM-DD'), '5kg', NULL, 'M?', 10, 2000000);
--------------------------------------------------------------------------------------------------------------------------------------------




--DANHMUC
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t khô', 'Me-O - V? v?t quay', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), '500g', NULL, 'Vi?t Nam', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t khô', 'Minino Yum - V? rau c?', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), '1kg', NULL, 'M?', 200, 80000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Whiskas - V? bò', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), '100g', NULL, 'Hàn', 150, 10000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Nutrience Original Healthy Adult Indoor - V? th?t heo', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), '200g', NULL, 'Trung', 120, 15000);
-- Súp th??ng ?n li?n
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng ?n li?n', 'Cat’s Eye - V? gà', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), '80g', NULL, 'Vi?t Nam', 80, 12000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng ?n li?n', 'Home - Cat - V? cá', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), '100g', NULL, 'M?', 100, 15000);

-- Snack - Bánh th??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - Bánh th??ng', 'Royal Canin - V? th?t heo', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), '200g', NULL, 'Hàn', 120, 18000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - Bánh th??ng', 'CatsRang - V? cá', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'), '150g', NULL, 'Trung', 90, 20000);

-- Vitamin - Dinh d??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Me-O - Dinh d??ng t?ng h?p', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), '60g', NULL, 'Vi?t Nam', 200, 25000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Nutrience Original Healthy Adult Indoor - Dinh d??ng chuyên bi?t', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), '80g', NULL, 'M?', 150, 28000);

-- C? mèo - Catnip
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('C? mèo - Catnip', 'Cat’s Eye - C? mèo t? nhiên', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), '20g', NULL, 'Vi?t Nam', 50, 8000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('C? mèo - Catnip', 'Home - Cat - Catnip h?u c?', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), '15g', NULL, 'M?', 70, 10000);

-- Bát ?n - Bình u?ng n??c
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Bát ?n - Bình u?ng n??c', 'Royal Canin - Bát ?n nh?a', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), NULL, NULL, 'Hàn', 100, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Bát ?n - Bình u?ng n??c', 'CatsRang - Bình u?ng n??c t? ??ng', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), NULL, NULL, 'Trung', 80, 250000);
-- Bát ?n - Bình u?ng n??c
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Bát ?n - Bình u?ng n??c', 'Me-O - Bát ?n inox', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), NULL, NULL, 'Vi?t Nam', 200, 350000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Bát ?n - Bình u?ng n??c', 'Nutrience Original Healthy Adult Indoor - Bình u?ng n??c th?y tinh', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), NULL, NULL, 'M?', 150, 450000);
-- Vitamin - Dinh d??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Whiskas - Vitamin t?ng h?p', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), '50g', NULL, 'Hàn', 100, 50000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Vitamin - Dinh d??ng', 'Cat’s Eye - Dinh d??ng ch?t l??ng cao', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), '80g', NULL, 'Vi?t Nam', 150, 60000);

-- Th?c ?n h?t khô
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t khô', 'Minino Yum - V? v?t quay', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), '1kg', NULL, 'Trung', 50, 150000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Th?c ?n h?t khô', 'Me-O - V? rau c?', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'), '2kg', NULL, 'Vi?t Nam', 80, 200000);
-- Pate - N??c s?t
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Whiskas - V? bò', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), '85g', NULL, 'M?', 200, 10000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Pate - N??c s?t', 'Royal Canin - V? th?t heo', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), '100g', NULL, 'Hàn', 150, 12000);
-- Súp th??ng ?n li?n
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng ?n li?n', 'Nutrience Original Healthy Adult Indoor - V? cá', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), '80g', NULL, 'M?', 100, 15000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Súp th??ng ?n li?n', 'Home - Cat - V? v?t quay', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), '70g', NULL, 'Vi?t Nam', 120, 12000);

-- Snack - Bánh th??ng
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - Bánh th??ng', 'CatsRang - Snack bánh th?t heo', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), '50g', NULL, 'Trung', 80, 8000);

INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA)
VALUES ('Snack - Bánh th??ng', 'Me-O - Snack bánh rau c?', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), '60g', NULL, 'Vi?t Nam', 90, 10000);
















INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'Khay - Nhà v? sinh', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '500g', NULL, 'M?', 100, 100000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'Cát v? sinh cho mèo', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '1kg', NULL, 'Vi?t Nam', 50, 150000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m sóc', 'S?a t?m - X?t d??ng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Trung', 80, 200000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'L??c ch?i lông', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Hàn', 120, 50000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m sóc', 'Máy mài - K?m c?t móng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Ý', 70, 300000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'Khay - Nhà v? sinh', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '500g', NULL, 'Vi?t Nam', 90, 80000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m sóc', 'Cát v? sinh cho mèo', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '1kg', NULL, 'M?', 60, 120000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'Bát ?n - Chén n??c', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), '200g', NULL, 'M?', 150, 90000);
      INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('v? sinh', 'Mái     che nhà v? sinh', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 80, 180000);
 INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m sóc', 'L??c ch?i lông', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Hàn', 120, 50000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ch?m sóc', 'Máy mài - K?m c?t móng', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Ý', 70, 300000);


































INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? dùng', 'Qu?n áo - Trang s?c', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'M?', 200, 120000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'Vòng c? - Dây d?t', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 150, 80000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? ch?i', '?? ch?i - Hu?n luy?n', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Trung', 100, 50000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'Túi xách mèo', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Hàn', 80, 150000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? dùng', 'Balo ??ng mèo', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Ý', 120, 200000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? ch?i', 'L?ng v?n chuy?n', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 100, 250000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? dùng', 'Bát ?n - Chén n??c', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Trung', 150, 90000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'Balo ??ng mèo', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Hàn', 80, 180000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('ph? ki?n', 'Dây d?t chó', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'M?', 100, 75000);
INSERT INTO DANHMUC (LOAI, TEN, NSX, HSD, KL, GT, NG_GOC, SL, GIA) VALUES ('?? ch?i', 'C?u ch?i mèo', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 'NULL', NULL, 'Vi?t Nam', 200, 60000);

























--THUCUNG
-- Thêm d? li?u cho lo?i mèo
INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo M? (American Shorthair)', 'Nh?', 'Cái', 'M?', 10, 500000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Ba T? (Persian Cat)', 'Trung bình', 'Cái', 'Ba T?', 8, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Bengal (Bengal Cat)', 'Nh?', 'Cái', 'Bengal', 5, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Siberian (Siberian Cat)', 'Trung bình', 'Cái', 'Nga', 7, 900000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Nga (Russian Blue)', 'Nh?', 'Cái', 'Nga', 9, 600000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Siamese (Siamese Cat)', 'Nh?', 'Cái', 'Siamese', 6, 700000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Maine Coon (Maine Coon Cat)', 'L?n', 'Cái', 'Maine Coon', 3, 1500000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Ragdoll (Ragdoll Cat)', 'L?n', 'Cái', 'M?', 4, 1400000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Scottish Fold (Scottish Fold Cat)', 'Trung bình', 'Cái', 'Scotland', 5, 1100000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Sphynx (Sphynx Cat)', 'Nh?', 'Cái', 'M?', 6, 1300000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Abyssinian (Abyssinian Cat)', 'Trung bình', 'Cái', 'Abyssinia', 7, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Oriental Shorthair (Oriental Shorthair)', 'Nh?', 'Cái', 'Mi?n ?ông', 8, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo British Shorthair (British Shorthair)', 'L?n', 'Cái', 'Anh', 5, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Devon Rex (Devon Rex)', 'Trung bình', 'Cái', 'Anh', 6, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Mèo', 'Mèo Chartreux (Chartreux Cat)', 'L?n', 'Cái', 'Pháp', 4, 1300000);


-- Thêm d? li?u cho lo?i chó
INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Ph?c Sóc (Poodle)', 'Nh?', 'Cái', 'M?', 9, 600000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Chihuahua (Chihuahua)', 'Nh?', 'Cái', 'Mexico', 10, 500000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Bulldog (Bulldog)', 'Trung bình', 'Cái', 'Anh', 7, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Pomeranian (Pomeranian)', 'Nh?', 'Cái', '??c', 8, 700000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Corgi (Corgi)', 'Trung bình', 'Cái', 'X? Wales', 6, 900000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Husky Siberia (Siberian Husky)', 'L?n', 'Cái', 'Nga', 5, 1100000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Golden Retriever (Golden Retriever)', 'L?n', 'Cái', 'Anh', 4, 1300000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Labrador Retriever (Labrador Retriever)', 'L?n', 'Cái', 'Canada', 6, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Beagle (Beagle)', 'Trung bình', 'Cái', 'Anh', 7, 800000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Boxer (Boxer)', 'L?n', 'Cái', '??c', 8, 700000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Doberman (Doberman)', 'L?n', 'Cái', '??c', 5, 1200000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Dalmatian (Dalmatian)', 'L?n', 'Cái', 'Croatia', 6, 1000000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Shih Tzu (Shih Tzu)', 'Nh?', 'Cái', 'Trung Qu?c', 7, 900000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó Rottweiler (Rottweiler)', 'L?n', 'Cái', '??c', 4, 1400000);

INSERT INTO DANHMUC (LOAI, TEN, KL, GT, NG_GOC, SL, GIA)
VALUES ('Chó', 'Chó German Shepherd (German Shepherd)', 'L?n', 'Cái', '??c', 3, 1500000);





























--NHAN VIEN

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Nguy?n V?n An', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Nam', '0987654321', 'Hà N?i', 'Bán hàng');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Tr?n Th? Bình', TO_DATE('1992-02-10', 'YYYY-MM-DD'), 'N?', '0123456789', 'H? Chí Minh', 'Kho');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Ph?m V?n C??ng', TO_DATE('1985-08-25', 'YYYY-MM-DD'), 'Nam', '0987654321', '?à N?ng', 'Qu?n lý');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Lê Th? Dung', TO_DATE('1993-11-20', 'YYYY-MM-DD'), 'N?', '0123456789', 'H?i Phòng', 'Ch?m sóc');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Hoàng V?n H?i', TO_DATE('1991-07-05', 'YYYY-MM-DD'), 'Nam', '0987654321', 'C?n Th?', 'Bán hàng');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Nguy?n Th? Kim', TO_DATE('1990-09-18', 'YYYY-MM-DD'), 'N?', '0123456789', 'Bình D??ng', 'Kho');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Tr?n V?n Lâm', TO_DATE('1988-03-12', 'YYYY-MM-DD'), 'Nam', '0987654321', 'H?i D??ng', 'Qu?n lý');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Ph?m Th? Mai', TO_DATE('1995-06-28', 'YYYY-MM-DD'), 'N?', '0123456789', 'Hu?', 'Ch?m sóc');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Lê V?n Nam', TO_DATE('1994-01-02', 'YYYY-MM-DD'), 'Nam', '0987654321', 'Ngh? An', 'Bán hàng');

INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
VALUES ('Ph?m Th? Qu?nh', TO_DATE('1993-04-28', 'YYYY-MM-DD'), 'N?', '0123456789', 'Hà T?nh', 'Qu?n lý');














--KHACHHANG
INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n V?n Anh', 'Thành viên', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Hà N?i', '1234567890', 'nguyenvananh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n Th? Bích', 'VIP', TO_DATE('1992-02-10', 'YYYY-MM-DD'), 'H? Chí Minh', '0987654321', 'tranthibich@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m V?n C??ng', 'Thành viên', TO_DATE('1985-08-25', 'YYYY-MM-DD'), '?à N?ng', '0123456789', 'phamvancuong@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Lê Th? Dung', 'Thành viên', TO_DATE('1993-11-20', 'YYYY-MM-DD'), 'H?i Phòng', '0987654321', 'lethidung@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Hoàng V?n Hùng', 'VIP', TO_DATE('1991-07-05', 'YYYY-MM-DD'), 'C?n Th?', '0123456789', 'hoangvanhung@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n Th? Kim', 'Thành viên', TO_DATE('1990-09-18', 'YYYY-MM-DD'), 'Bình D??ng', '0987654321', 'nguyenthikim@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n V?n Lâm', 'Thành viên', TO_DATE('1988-03-12', 'YYYY-MM-DD'), 'H?i D??ng', '0123456789', 'tranvanlam@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m Th? Mai', 'VIP', TO_DATE('1995-06-28', 'YYYY-MM-DD'), 'Hu?', '0987654321', 'phamthimai@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n V?n Quang', 'Thành viên', TO_DATE('1993-12-15', 'YYYY-MM-DD'), 'Hà N?i', '0987654321', 'nguyenvanquang@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n Th? Linh', 'VIP', TO_DATE('1991-09-20', 'YYYY-MM-DD'), 'H? Chí Minh', '0123456789', 'tranthilinh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m V?n Tú', 'Thành viên', TO_DATE('1994-07-25', 'YYYY-MM-DD'), '?à N?ng', '0987654321', 'phamvantu@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Lê Th? H?nh', 'Thành viên', TO_DATE('1990-03-10', 'YYYY-MM-DD'), 'H?i Phòng', '0123456789', 'lethihanh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Hoàng Th? Y?n', 'VIP', TO_DATE('1989-11-18', 'YYYY-MM-DD'), 'C?n Th?', '0987654321', 'hoangthiyen@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Nguy?n V?n Bình', 'Thành viên', TO_DATE('1992-06-12', 'YYYY-MM-DD'), 'Bình D??ng', '0123456789', 'nguyenvanbinh@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Tr?n Th? Th?o', 'Thành viên', TO_DATE('1996-08-28', 'YYYY-MM-DD'), 'H?i D??ng', '0987654321', 'tranthithao@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Lê V?n Nam', 'VIP', TO_DATE('1993-01-02', 'YYYY-MM-DD'), 'Hu?', '0123456789', 'levannam@gmail.com');

INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
VALUES ('Ph?m Th? H??ng', 'Thành viên', TO_DATE('1995-04-28', 'YYYY-MM-DD'), 'Ngh? An', '0987654321', 'phamthihuong@gmail.com');

























--GUITHUCUNG

-- Ví d? 1
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (18, 'Mèo M? (American Shorthair)', TO_DATE('2023-06-07', 'YYYY-MM-DD'), 'mèo', '??c');

-- Ví d? 2
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (19, 'Mèo Ba T? (Persian Cat)', TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'mèo', 'cái');

-- Ví d? 3
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (19, 'Mèo Bengal (Bengal Cat)', TO_DATE('2023-06-09', 'YYYY-MM-DD'), 'mèo', '??c');

-- Ví d? 4
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (19, 'Mèo Siberian (Siberian Cat)', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'mèo', 'cái');

-- Ví d? 5
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (23, 'Mèo Nga (Russian Blue)', TO_DATE('2023-06-11', 'YYYY-MM-DD'), 'mèo', '??c');

-- Ví d? 6
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (23, 'Mèo Siamese (Siamese Cat)', TO_DATE('2023-06-12', 'YYYY-MM-DD'), 'mèo', 'cái');

-- Ví d? 7
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (24, 'Mèo Maine Coon (Maine Coon Cat)', TO_DATE('2023-06-13', 'YYYY-MM-DD'), 'mèo', '??c');

-- Ví d? 8
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (28, 'Mèo Ragdoll (Ragdoll Cat)', TO_DATE('2023-06-14', 'YYYY-MM-DD'), 'mèo', 'cái');

-- Ví d? 9
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (28, 'Mèo Scottish Fold (Scottish Fold Cat)', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'mèo', '??c');

-- Ví d? 10
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (29, 'Mèo Sphynx (Sphynx Cat)', TO_DATE('2023-06-16', 'YYYY-MM-DD'), 'mèo', 'cái');
-- Ví d? 11
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (29, 'Chó Ph?c Sóc (Poodle)', TO_DATE('2023-06-17', 'YYYY-MM-DD'), 'chó', '??c');

-- Ví d? 12
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (32, 'Chó Chihuahua (Chihuahua)', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 'chó', 'cái');

-- Ví d? 13
INSERT INTO GUITHUCUNG (MAKH, TEN, NGAYTRA, LOAI, GIOITINH)
VALUES (32, 'Chó Bulldog (Bulldog)', TO_DATE('2023-06-19', 'YYYY-MM-DD'), 'chó', '??c');






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







