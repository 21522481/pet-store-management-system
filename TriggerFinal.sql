--HUUPHUNG
CREATE SEQUENCE AUTO_INCREMENT_SEQUENCE_FOR_HOADON
START WITH 1
INCREMENT BY 1;
/
create or replace TRIGGER AUTO_INCREMENT_TRIGGER_FOR_HODON
BEFORE INSERT ON HOADON REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
    SELECT AUTO_INCREMENT_SEQUENCE_FOR_HOADON.NEXTVAL INTO :NEW.SOHD
    FROM DUAL;
END;
/
create or replace TRIGGER AUTO_INSERT_DATE_ON_HOADON
BEFORE INSERT ON HOADON
FOR EACH ROW
BEGIN
    :NEW.NGHD := SYSDATE;
END;
/
create or replace TRIGGER TRIGIA_TRGG
BEFORE INSERT OR UPDATE ON HOADON
FOR EACH ROW
BEGIN

    :NEW.TONGCONG := :NEW.TRIGIA - :NEW.GIAMGIA;
END;
/
create or replace TRIGGER trigger_check_ngaytra_gia
BEFORE INSERT OR UPDATE ON GUITHUCUNG
FOR EACH ROW
DECLARE
    ngay_gui DATE;
    ngay_tra DATE;
BEGIN
    -- L?y gi� tr? c?a c?t NGAYGUI v� NGAYTRA
    ngay_gui := :NEW.NGAYGUI;
    ngay_tra := :NEW.NGAYTRA;

    -- N?u NGAYTRA l� NULL, g�n gi� tr? m?c ??nh l� NGAYGUI + 1 ng�y
    IF ngay_tra IS NULL THEN
        ngay_tra := SYSDATE + INTERVAL '1' DAY;
    END IF;

    -- Ki?m tra n?u NGAYTRA kh�ng sau ho?c b?ng NGAYGUI �t nh?t 1 ng�y, g�n NGAYTRA = NGAYGUI + 1 ng�y
    IF ngay_tra < ngay_gui + INTERVAL '1' DAY THEN
        ngay_tra := ngay_gui + INTERVAL '1' DAY;
    END IF;

    -- C?p nh?t gi� tr? m?i cho c?t NGAYTRA
    :NEW.NGAYTRA := ngay_tra;
    IF :NEW.GIA IS NULL THEN
        -- T�nh gi� tr? cho c?t GIA
        :NEW.GIA := 200000 * (ngay_tra - ngay_gui);
    END IF;
END;
/
create or replace TRIGGER AUTO_INSERT_DATE_FOR_GUITHUCUNG
BEFORE INSERT ON GUITHUCUNG
FOR EACH ROW
BEGIN
    IF :NEW.NGAYGUI IS NULL THEN
        :NEW.NGAYGUI := COALESCE(:NEW.NGAYGUI, SYSDATE);
    END IF;
END;
/
CREATE SEQUENCE AUTO_INCREMENT_SEQUENCE_FOR_guithucung
START WITH 1
INCREMENT BY 1;
/
create or replace TRIGGER AUTO_INCREMENT_TRIGGER_FOR_guithucung
BEFORE INSERT ON GUITHUCUNG REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
    SELECT AUTO_INCREMENT_SEQUENCE_FOR_guithucung.NEXTVAL INTO :NEW.SOPHIEUGUI
    FROM DUAL;
END;
/
set serveroutput on
/
create or replace TRIGGER HOADON_DEFAULT_TRIGIA
BEFORE INSERT ON HOADON
FOR EACH ROW
BEGIN
    IF :NEW.TRIGIA IS NULL THEN
        :NEW.TRIGIA := 0;
    END IF;
    
    IF :NEW.GIAMGIA IS NULL THEN
        :NEW.GIAMGIA := 0;
    END IF;
END;
/
CREATE SEQUENCE seq_madm
    START WITH 2100
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;
    /
create or replace TRIGGER trg_danhmuc_madm
BEFORE INSERT ON DANHMUC
FOR EACH ROW
BEGIN
    SELECT seq_madm.nextval INTO :new.MADM FROM dual;
END;
/

--MINHQUANG
--KHACHHANG
--trigger them th�ng tin kh�ch h�ng
CREATE SEQUENCE SEQ_MAKH START WITH 1 INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER AUTO_INCREMENT_TRIGGER_FOR_KHACHHANG
BEFORE INSERT ON KHACHHANG REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
    SELECT SEQ_MAKH.NEXTVAL INTO :NEW.MAKH
    FROM DUAL;
END;



--trigger check
CREATE OR REPLACE TRIGGER trigger_check_khachhang_tuoi
BEFORE INSERT OR UPDATE ON KHACHHANG
FOR EACH ROW
DECLARE
    v_tuoi NUMBER;
BEGIN
    -- T�nh tu?i d?a tr�n ng�y sinh v� ng�y hi?n t?i
    v_tuoi := TRUNC(MONTHS_BETWEEN(SYSDATE, :NEW.NGSINH) / 12);

    -- Ki?m tra tu?i
    IF v_tuoi < 18 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Tu?i KHACHHANG ph?i l?n h?n ho?c b?ng 18 tu?i.');
    END IF;
END;
/
--NHANVIEN
--Trigger th�m nh�n vi�n

CREATE SEQUENCE SEQ_MANV START WITH 21522001 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER AUTO_INCREMENT_TRIGGER_FOR_NHANVIEN
BEFORE INSERT ON NHANVIEN REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
    SELECT SEQ_MANV.NEXTVAL INTO :NEW.MANV
    FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER trigger_check_nhanvien_tuoi
BEFORE INSERT OR UPDATE ON NHANVIEN
FOR EACH ROW
DECLARE
    v_tuoi NUMBER;
BEGIN
    -- T�nh tu?i d?a tr�n ng�y sinh v� ng�y hi?n t?i
    v_tuoi := TRUNC(MONTHS_BETWEEN(SYSDATE, :NEW.NGSINH) / 12);

    -- Ki?m tra tu?i
    IF v_tuoi < 18 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Tu?i NHANVIEN ph?i l?n h?n ho?c b?ng 18 tu?i.');
    END IF;
END;
/

--LUUHA
-- Moi hoa don phai co it nhat mot CTHD
CREATE OR REPLACE TRIGGER TRG_KIEMTRA_SL_CTHD 
AFTER DELETE ON CTHD 
FOR EACH ROW
	DECLARE d INT;
BEGIN
	SELECT COUNT(*) INTO d
    FROM CTHD c
	WHERE c.SOHD = :OLD.SOHD;
	IF d<1 THEN
		 raise_application_error(-20003, 'MOI HOA DON PHAI CO IT NHAT 1 CHI TIET HOA DON');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER AUTOGIAM_SL_DANHMUC_TINHTHANHTIEN_TRIGIAHD
BEFORE INSERT ON CTHD
FOR EACH ROW
DECLARE
    SLSPBD DANHMUC.SL%TYPE; 
    GIA_MADM DANHMUC.GIA%TYPE; 
    TG HOADON.TRIGIA%TYPE;
    
BEGIN
    SELECT SL, GIA INTO SLSPBD, GIA_MADM FROM DANHMUC WHERE :NEW.ID = DANHMUC.MADM; 
    SELECT TRIGIA INTO TG FROM HOADON WHERE HOADON.SOHD = :NEW.SOHD;
    IF SLSPBD - :NEW.SL >= 0 THEN
    UPDATE DANHMUC SET SL = SLSPBD - :NEW.SL WHERE :NEW.ID = DANHMUC.MADM;  
    ELSE RAISE_APPLICATION_ERROR(-20000, 'So luong san pham chi con: ' || SLSPBD);
    END IF;
    :NEW.THANHTIEN := :NEW.SL * GIA_MADM;
    UPDATE HOADON SET TRIGIA = TG + :NEW.THANHTIEN WHERE :NEW.SOHD = HOADON.SOHD;
END;
/
