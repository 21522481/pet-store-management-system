CREATE OR REPLACE PROCEDURE SP_INSERT_DANHMUC_SANPHAM(
    p_loai    IN NVARCHAR2,
    p_ten     IN NVARCHAR2,
    p_nsx     IN DATE,
    p_hsd     IN DATE,
    p_kl      IN VARCHAR2,
    p_ng_goc  IN NVARCHAR2,
    p_sl      IN NUMBER,
    p_gia     IN NUMBER
)
AS
BEGIN
    INSERT INTO DANHMUC (LOAI,TEN,NSX,HSD,KL,GT,NG_GOC,SL,GIA)
    VALUES (
        --seq_madm.nextval,  -- S? d?ng SEQUENCE ?? t?o giá tr? cho c?t MADM
        p_loai,
        p_ten,
        p_nsx,
        p_hsd,
        p_kl,
        NULL,  -- Giá tr? m?c ??nh cho c?t GT
        p_ng_goc,
        p_sl,
        p_gia
    );
    COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE ThemMoiTaiKhoan (
  p_MANV   IN TAIKHOAN.MANV%TYPE,
  p_TENDN  IN TAIKHOAN.TENDN%TYPE,
  p_MK     IN TAIKHOAN.MK%TYPE
)
IS
BEGIN
  INSERT INTO TAIKHOAN (MANV, TENDN, MK)
  VALUES (p_MANV, p_TENDN, p_MK);
  
  COMMIT; -- L?u thay ??i vào c? s? d? li?u
  DBMS_OUTPUT.PUT_LINE('?ã thêm m?i m?t dòng vào b?ng TAIKHOAN.');
EXCEPTION
  WHEN OTHERS THEN
    -- X? lý l?i n?u có
    DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
    ROLLBACK; -- H?y thay ??i n?u có l?i
END;
/
-------------------------------------------------------------------------------
--PROCEDURE C?P NH?T
CREATE OR REPLACE PROCEDURE CAP_NHAT_DANHMUC(
    v_MADM NUMBER,
    v_LOAI NVARCHAR2,
    v_TEN NVARCHAR2,
    v_NSX DATE,
    v_HSD DATE,
    v_KL VARCHAR2,
    v_GT NVARCHAR2,
    v_NG_GOC NVARCHAR2,
    v_SL NUMBER,
    v_GIA NUMBER
)
IS
BEGIN
    UPDATE DANHMUC
    SET LOAI = v_LOAI,
        TEN = v_TEN,
        NSX = v_NSX,
        HSD = v_HSD,
        KL = v_KL,
        GT = v_GT,
        NG_GOC = v_NG_GOC,
        SL = v_SL,
        GIA = v_GIA
    WHERE MADM = v_MADM;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data not found in DANHMUC table.');
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE PROCEDURE SUA_TAIKHOAN(
    v_MANV NUMBER,
    v_TENDN VARCHAR2,
    v_MK VARCHAR2
)
IS
BEGIN
    UPDATE TAIKHOAN
    SET TENDN = v_TENDN,
        MK = v_MK
    WHERE MANV = v_MANV;
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data not found in TAIKHOAN table.');
    WHEN OTHERS THEN
        RAISE;
    
END;
/



CREATE OR REPLACE PROCEDURE CAPNHAT_TRIGIA_HOADON (
    p_SOHD IN HOADON.SOHD%TYPE
)
AS
    out_TRIGIA NUMBER;
BEGIN
    SELECT SUM(THANHTIEN) INTO out_TRIGIA 
    FROM CTHD
    WHERE CTHD.SOHD = p_SOHD;
    
    UPDATE HOADON
    SET TRIGIA = out_TRIGIA
    WHERE HOADON.SOHD = p_SOHD;
    
    COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE XOA_SP_TRONG_DANHMUC (p_MADM IN DANHMUC.MADM%TYPE)
IS
BEGIN
    DELETE FROM DANHMUC
    WHERE MADM = p_MADM;
    
    COMMIT;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data not found in DANHMUC table.');
    WHEN OTHERS THEN
        RAISE;
END;
/
CREATE OR REPLACE PROCEDURE XOA_TAIKHOAN(p_MANV IN TAIKHOAN.MANV%TYPE)
IS
BEGIN
    DELETE FROM TAIKHOAN
    WHERE MANV = p_MANV;
    
    COMMIT;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data not found in TAIKHOAN table.');
    WHEN OTHERS THEN
        RAISE;
END;
/
CREATE OR REPLACE PROCEDURE sp_insert_danhmuc_THUCUNG(
    p_loai    IN NVARCHAR2,
    p_ten     IN NVARCHAR2,
    p_kl      IN VARCHAR2,
    p_ng_goc  IN NVARCHAR2,
    p_sl      IN NUMBER,
    p_gia     IN NUMBER
)
AS
BEGIN
    INSERT INTO DANHMUC (LOAI,TEN,NSX,HSD,KL,GT,NG_GOC,SL,GIA)
    VALUES (
        --seq_madm.nextval,  -- S? d?ng SEQUENCE ?? t?o giá tr? cho c?t MADM
        p_loai,
        p_ten,
        NULL,
        NULL,
        p_kl,
        NULL,  -- Giá tr? m?c ??nh cho c?t GT
        p_ng_goc,
        p_sl,
        p_gia
    );
    
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE InsertCustomer(
    p_hoten IN NVARCHAR2,
    p_sdt IN VARCHAR2,
    p_loai IN VARCHAR2,
    p_email IN VARCHAR2,
    p_diachi IN NVARCHAR2,
    p_ngaysinh IN DATE)
IS
BEGIN
    INSERT INTO KHACHHANG (HOTEN, LOAI, NGSINH, DIACHI, SDT, EMAIL)
    VALUES ( p_hoten, p_loai, p_ngaysinh, p_diachi, p_sdt, p_email);
    
    COMMIT;
        
    DBMS_OUTPUT.PUT_LINE('Khách hàng ?ã ???c thêm thành công.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('L?i khi thêm khách hàng: ' || SQLERRM);
END;
/

--S?a thông tin khách hàng
CREATE OR REPLACE PROCEDURE UpdateCustomer(
    p_makh IN NUMBER,
    p_hoten IN NVARCHAR2,
    p_sdt IN VARCHAR2,
    p_email IN VARCHAR2,
    p_diachi IN NVARCHAR2,
    p_ngaysinh IN DATE)
IS
BEGIN
    UPDATE KHACHHANG
    SET HOTEN = p_hoten,
        SDT = p_sdt,
        EMAIL = p_email,
        DIACHI = p_diachi,
        NGSINH = p_ngaysinh
    WHERE MAKH = p_makh;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Thông tin khách hàng ?ã ???c c?p nh?t thành công.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('L?i khi c?p nh?t thông tin khách hàng: ' || SQLERRM);
END;
/

--tìm ki?m thông tin khách hàng d?a vào tên
CREATE OR REPLACE PROCEDURE FIND_CUSTOMER_BY_NAME(
  p_name IN VARCHAR2,
  p_result OUT SYS_REFCURSOR
)
AS
BEGIN
  OPEN p_result FOR
    SELECT *
    FROM KHACHHANG
    WHERE HOTEN LIKE '%' || p_name || '%';
END;
/
CREATE OR REPLACE PROCEDURE AddEmployee(
    p_hoten     IN NVARCHAR2,
    p_ngsinh    IN DATE,
    p_gioitinh  IN NVARCHAR2,
    p_sdt       IN VARCHAR2,
    p_diachi    IN NVARCHAR2,
    p_chucvu    IN NVARCHAR2)
IS
BEGIN
    INSERT INTO NHANVIEN (HOTEN, NGSINH, GIOITINH, SDT, DIACHI, CHUCVU)
    VALUES (p_hoten, p_ngsinh, p_gioitinh, p_sdt, p_diachi, p_chucvu);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Nhân viên ?ã ???c thêm thành công.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('L?i khi thêm nhân viên: ' || SQLERRM);
END;
/
--C?p nh?t thông tin nhân viên
CREATE OR REPLACE PROCEDURE UpdateEmployee(
    p_manv      IN NUMBER,
    p_hoten     IN NVARCHAR2,
    p_ngsinh    IN DATE,
    p_gioitinh  IN NVARCHAR2,
    p_sdt       IN VARCHAR2,
    p_diachi    IN NVARCHAR2,
    p_chucvu    IN NVARCHAR2)
IS
BEGIN
    UPDATE NHANVIEN
    SET HOTEN = p_hoten,
        NGSINH = p_ngsinh,
        GIOITINH = p_gioitinh,
        SDT = p_sdt,
        DIACHI = p_diachi,
        CHUCVU = p_chucvu
    WHERE MANV = p_manv;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Thông tin nhân viên ?ã ???c c?p nh?t thành công.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('L?i khi c?p nh?t thông tin nhân viên: ' || SQLERRM);
END;
/

--TÍM KI?M
--ch?m sóc
CREATE OR REPLACE PROCEDURE FIND_CARE_EMPLOYEES(
  p_keyword IN VARCHAR2,
  p_result OUT SYS_REFCURSOR
)
AS
BEGIN
  OPEN p_result FOR
    SELECT *
    FROM NHANVIEN
    WHERE CHUCVU = 'Ch?m sóc'
    AND (HOTEN LIKE '%' || p_keyword || '%' OR DIACHI LIKE '%' || p_keyword || '%');
END;
/
--kho
CREATE OR REPLACE PROCEDURE FIND_WAREHOUSE_EMPLOYEES(
  p_keyword IN VARCHAR2,
  p_result OUT SYS_REFCURSOR
)
AS
BEGIN
  OPEN p_result FOR
    SELECT *
    FROM NHANVIEN
    WHERE CHUCVU = 'Kho'
    AND (HOTEN LIKE '%' || p_keyword || '%' OR DIACHI LIKE '%' || p_keyword || '%');
END;
/
--bán hàng
CREATE OR REPLACE PROCEDURE FIND_SALES_EMPLOYEES(
  p_keyword IN VARCHAR2,
  p_result OUT SYS_REFCURSOR
)
AS
BEGIN
  OPEN p_result FOR
    SELECT *
    FROM NHANVIEN
    WHERE CHUCVU = 'Bán hàng'
    AND (HOTEN LIKE '%' || p_keyword || '%' OR DIACHI LIKE '%' || p_keyword || '%');
END;
/

--qu?n lý
CREATE OR REPLACE PROCEDURE FIND_MANAGER_EMPLOYEES(
  p_manager_id IN NUMBER,
  p_result OUT SYS_REFCURSOR
)
AS
BEGIN
  OPEN p_result FOR
    SELECT *
    FROM NHANVIEN
    WHERE CHUCVU = 'Qu?n lý'
    AND MANV = p_manager_id;
END;
/

CREATE OR REPLACE PROCEDURE LietkethongtinCTHD (So_HD CTHD.SOHD%TYPE) 
AS
BEGIN
    FOR C IN (
    SELECT CT.SOHD, HD.NGHD, HD.PHUONGTHUCTT, CT.THANHTIEN, NV.HOTEN, NV.SDT, DM.MADM, DM.TEN, CT.SL
    FROM CTHD CT, HOADON HD, NHANVIEN NV, DANHMUC DM
    WHERE   CT.SOHD = HD.SOHD
    AND     HD.MANV = NV.MANV
    AND     CT.SOHD = So_HD  
    AND     CT.ID = DM.MADM 
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(' Ngay:'|| C.NGHD ||', Thanh toan:'|| C.PHUONGTHUCTT ||', Mat hang:'||C.TEN || ', So luong:' || C.SL || ', Thong tin nhan vien thanh toan: '|| C.HOTEN ||', '|| C.SDT);
    END LOOP;
END;
/


--Tao mot procedure them moi mot CTHD
CREATE OR REPLACE PROCEDURE INSERTCTHD (p_SOHD IN HOADON.SOHD%TYPE, 
                                        p_ID IN CTHD.ID%TYPE, 
                                        p_SL IN CTHD.SL%TYPE 
                                        )
AS
  v_SOHD HOADON.SOHD%TYPE;
  v_ID CTHD.ID%TYPE;
  v_SL CTHD.SL%TYPE;
  v_Gia DANHMUC.GIA%TYPE;
  v_SLConLai number;
BEGIN
  --Ki?m tra hóa ??n có t?n t?i--
  BEGIN
	SELECT SOHD INTO v_SOHD
	FROM HOADON
	WHERE SOHD = p_SOHD;
	EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR (-20001,'Hóa ??n không t?n t?i');
END;
  --Ki?m tra s?n ph?m/ thú c?ng có t?n t?i--
  BEGIN
	SELECT MADM, SL, GIA INTO v_ID, v_SL,v_Gia
	FROM DANHMUC
	WHERE MADM = p_ID;
	EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR (-20002,'S?n ph?m/thú c?ng không t?n t?i');
  END;
  	INSERT INTO CTHD (SOHD, ID, SL) VALUES (p_SOHD,p_ID,p_SL);
  	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE INSERT_INTO_HOADON (
    p_PTTT IN HOADON.PHUONGTHUCTT%TYPE,
    p_GIAMGIA IN HOADON.GIAMGIA%TYPE,
    p_MANV IN HOADON.MANV%TYPE,
    p_SOHD OUT HOADON.SOHD%TYPE
)
AS
BEGIN
    INSERT INTO HOADON (PHUONGTHUCTT, GIAMGIA, MANV) VALUES ( p_PTTT,
    p_GIAMGIA,
    p_MANV);
    
    COMMIT;
    SELECT MAX(SOHD) INTO p_SOHD FROM HOADON;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE PRINT_HOADON_INFO (
  p_SOHD IN HOADON.SOHD%TYPE
) AS
BEGIN
  -- Bi?n l?u tr? thông tin hóa ??n
  DECLARE
    v_SOHD HOADON.SOHD%TYPE;
    v_NGHD HOADON.NGHD%TYPE;
    v_PHUONGTHUCTT HOADON.PHUONGTHUCTT%TYPE;
    v_GIAMGIA HOADON.GIAMGIA%TYPE;
    v_TRIGIA HOADON.TRIGIA%TYPE;
    v_TONGCONG HOADON.TONGCONG%TYPE;
    v_MANV HOADON.MANV%TYPE;
    v_HOTEN NHANVIEN.HOTEN%TYPE;
    v_ID CTHD.ID%TYPE;
    v_SL CTHD.SL%TYPE;
    v_THANHTIEN CTHD.THANHTIEN%TYPE;
    v_TEN DANHMUC.TEN%TYPE;
    v_GIA DANHMUC.GIA%TYPE;
    v_KL DANHMUC.KL%TYPE;
  BEGIN
    -- L?y thông tin hóa ??n
    SELECT SOHD, NGHD, PHUONGTHUCTT, GIAMGIA, TRIGIA, TONGCONG, MANV
    INTO v_SOHD, v_NGHD, v_PHUONGTHUCTT, v_GIAMGIA, v_TRIGIA, v_TONGCONG, v_MANV
    FROM HOADON
    WHERE SOHD = p_SOHD;

    -- L?y tên nhân viên
    SELECT HOTEN INTO v_HOTEN
    FROM NHANVIEN
    WHERE MANV = v_MANV;
    
    DBMS_OUTPUT.PUT_LINE('HOADON: ' || v_SOHD); 
    DBMS_OUTPUT.PUT_LINE('NGHD: ' || v_NGHD);
    DBMS_OUTPUT.PUT_LINE('PHUONGTHUCTT: ' || v_PHUONGTHUCTT );
    DBMS_OUTPUT.PUT_LINE('NHANVIEN: ' || v_HOTEN);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------');
    -- L?y thông tin chi ti?t hóa ??n
    FOR c IN (
      SELECT ID, SL, THANHTIEN
      FROM CTHD
      WHERE SOHD = v_SOHD
    ) LOOP
      v_ID := c.ID;
      v_SL := c.SL;
      v_THANHTIEN := c.THANHTIEN;

      -- L?y tên s?n ph?m và giá t? DANHMUC
      SELECT TEN, GIA, KL INTO v_TEN, v_GIA, v_KL
      FROM DANHMUC
      WHERE MADM = v_ID;

      -- In thông tin c?a HOADON và CTHD
      
      
      DBMS_OUTPUT.PUT_LINE('ID: ' || v_ID || '        , TEN: ' || v_TEN ||' ('|| v_KL ||'),         SL: ' || v_SL || ',         GIA: ' || v_GIA  ||',         THANHTIEN: ' || v_THANHTIEN);
      
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE( 'TRIGIA: ' || v_TRIGIA);
    DBMS_OUTPUT.PUT_LINE( 'GIAMGIA: ' || v_GIAMGIA );
    DBMS_OUTPUT.PUT_LINE( 'TONGCONG: ' || v_TONGCONG );
  END;
END;
/
CREATE OR REPLACE PROCEDURE SUA_GUITHUCUNG(
    v_SOPHIEUGUI NUMBER,
    v_TEN NVARCHAR2,
    v_NGAYGUI DATE,
    v_NGAYTRA DATE,
    v_LOAI NVARCHAR2,
    v_GIOITINH NVARCHAR2,
    v_MAKH NUMBER
)
IS
BEGIN
    UPDATE GUITHUCUNG
    SET TEN = v_TEN,
        NGAYGUI = v_NGAYGUI,
        NGAYTRA = v_NGAYTRA,
        LOAI = v_LOAI,
        GIOITINH = v_GIOITINH,
        --GIA = v_GIA,
        MAKH = v_MAKH
    WHERE SOPHIEUGUI = v_SOPHIEUGUI;

    COMMIT;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data not found in GUITHUCUNG table.');
    WHEN OTHERS THEN
        RAISE;
END;
/
CREATE OR REPLACE PROCEDURE THEM_MOI_GUITHUCUNG (
    p_TEN         IN GUITHUCUNG.TEN%TYPE,
    p_NGAYTRA     IN GUITHUCUNG.NGAYTRA%TYPE,
    p_LOAI        IN GUITHUCUNG.LOAI%TYPE,
    p_GIOITINH    IN GUITHUCUNG.GIOITINH%TYPE,
    p_MAKH        IN GUITHUCUNG.MAKH%TYPE
)
IS
BEGIN
    INSERT INTO GUITHUCUNG (TEN, NGAYTRA, LOAI, GIOITINH, MAKH)
    VALUES (p_TEN, p_NGAYTRA, p_LOAI, p_GIOITINH, p_MAKH);
    COMMIT;
END;
/

--Tao mot procedure them moi mot CTHD
CREATE OR REPLACE PROCEDURE INSERTCTHD (p_SOHD IN HOADON.SOHD%TYPE, 
                                        p_ID IN CTHD.ID%TYPE, 
                                        p_SL IN CTHD.SL%TYPE 
                                        )
AS
  v_SOHD HOADON.SOHD%TYPE;
  v_ID CTHD.ID%TYPE;
  v_SL CTHD.SL%TYPE;
  v_Gia DANHMUC.GIA%TYPE;
  v_SLConLai number;
BEGIN
  --Ki?m tra hóa ??n có t?n t?i--
  BEGIN
	SELECT SOHD INTO v_SOHD
	FROM HOADON
	WHERE SOHD = p_SOHD;
	EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR (-20001,'Hóa ??n không t?n t?i');
END;
  --Ki?m tra s?n ph?m/ thú c?ng có t?n t?i--
  BEGIN
	SELECT MADM, SL, GIA INTO v_ID, v_SL,v_Gia
	FROM DANHMUC
	WHERE MADM = p_ID;
	EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR (-20002,'S?n ph?m/thú c?ng không t?n t?i');
  END;
--Ki?m tra xem s? l??ng có ??--
  IF (p_SL <= v_SL)
	Then
  	v_SLConLai := v_SL - p_SL;
  	UPDATE DANHMUC SET SL = v_SLConLai WHERE MADM = p_ID;
  	INSERT INTO CTHD (SOHD, ID, SL) VALUES (p_SOHD,p_ID,p_SL);
  	--COMMIT;
  ELSE RAISE_APPLICATION_ERROR (-20003,'S? l??ng trong kho không ??');
  END IF;
END;

commit;