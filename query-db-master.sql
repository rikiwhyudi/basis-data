
DROP DATABASE IF EXISTS rumahsakit;

CREATE DATABASE rumahsakit;

DROP PROCEDURE IF EXISTS rumahsakit.transaksi1;

DELIMITER $$
$$
CREATE PROCEDURE rumahsakit.transaksi1()
BEGIN
	START TRANSACTION;
	
	INSERT INTO pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin) VALUES (2, 'Tito', 'Jl. Pakis Haji no 23', 1);
	
	SELECT * FROM pasien;	
END$$
DELIMITER ;

CALL transaksi1();

-- 

DROP PROCEDURE IF EXISTS rumahsakit.transaksi2;

DELIMITER $$
$$
CREATE PROCEDURE rumahsakit.transaksi2()
BEGIN
	START TRANSACTION;
	
	INSERT INTO pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin) VALUES (2, 'Tito', 'Jl. Pakis Haji no 23', 1);
	
	SELECT * FROM pasien;
	
	COMMIT;
END$$
DELIMITER ;

CALL transaksi2();

-- 

DROP PROCEDURE IF EXISTS rumahsakit.transaksi3;

DELIMITER $$
$$
CREATE PROCEDURE rumahsakit.transaksi3()
BEGIN
	START TRANSACTION;
	
	UPDATE rumahsakit.pasien SET nama_pasien='Danar' WHERE id_pasien=1;
	
	SELECT * FROM pasien;
	
	ROLLBACK;
	COMMIT;
END$$
DELIMITER ;

CALL transaksi3();

-- 

DROP PROCEDURE IF EXISTS rumahsakit.transaksi4;

DELIMITER $$
$$
CREATE PROCEDURE rumahsakit.transaksi4()
BEGIN
	START TRANSACTION;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (3, 'Hanif', 'Jl. Babakan loa no 22', 1);
	
	ROLLBACK;
	
	UPDATE rumahsakit.pasien SET nama_pasien='Septin' WHERE id_pasien=1;
	
	COMMIT;
	
	SELECT * FROM pasien;
END$$
DELIMITER ;

CALL transaksi4();
	
-- 
	
DROP PROCEDURE IF EXISTS rumahsakit.transaksi5;

DELIMITER $$
$$
CREATE PROCEDURE rumahsakit.transaksi5()
BEGIN
	START TRANSACTION;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (3, 'Hanif', 'Jl. Babakan loa no 22', 1);
	SAVEPOINT POINT1;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (4, 'Tina', 'Jl. Sangkuriang no 45', 2);
	ROLLBACK TO SAVEPOINT POINT1;
	
	INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin)  VALUES (5, 'Luthfi', 'Jl. Dipenogoro 24', 1);
	COMMIT;
	
	SELECT * FROM pasien;
END$$
DELIMITER ;

CALL transaksi5();

-- 

CREATE TABLE obat (
    id_obat INT(6) AUTO_INCREMENT PRIMARY KEY,
    kode_obat VARCHAR(5),
    nama_obat VARCHAR(30),
    harga INT(10),
    stok INT(5)
);

CREATE TABLE transaksi_obat (
    id_transaksi INT(3) AUTO_INCREMENT PRIMARY KEY,
    id_pasien INT(3),
    id_obat INT(6),
    jumlah INT(10),
    total_harga INT(10)
);

-- 
CREATE INDEX transaksi_obat_id_pasien_IDX USING BTREE ON rumahsakit.transaksi_obat (id_pasien);
CREATE INDEX transaksi_obat_id_obat_IDX USING BTREE ON rumahsakit.transaksi_obat (id_obat);

ALTER TABLE rumahsakit.transaksi_obat ADD CONSTRAINT transaksi_obat_pasien_FK FOREIGN KEY (id_pasien) REFERENCES rumahsakit.pasien(id_pasien) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE rumahsakit.transaksi_obat ADD CONSTRAINT transaksi_obat_obat_FK FOREIGN KEY (id_obat) REFERENCES rumahsakit.obat(id_obat) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO rumahsakit.obat (id_obat, kode_obat, nama_obat, harga, stok) VALUES (1, 'A001', 'Amikacin', 20000, 10), (2, 'A002', 'Amoxillin', 15000, 20), (3, 'A003', 'Betadine', 7000, 5);

SELECT * FROM obat o;

-- 

DELIMITER $$
$$
CREATE TRIGGER tg_jual AFTER INSERT ON transaksi_obat 
FOR EACH ROW
BEGIN
    UPDATE obat 
    SET stok = stok - NEW.jumlah 
    WHERE id_obat = NEW.id_obat;
END$$
DELIMITER ;

SELECT * FROM obat;

pasien id 1 membeli obat id 2 (amoxilin) sebanyak 5 buah.
INSERT INTO rumahsakit.transaksi_obat (id_pasien, id_obat, jumlah, total_harga) VALUES (1, 2, 5, 0);

SELECT * FROM obat;

RESET BINARY LOGS AND GTIDS;

CREATE USER 'prodisi'@'%' IDENTIFIED BY 'prodisi';
GRANT REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'prodisi'@'%';

SHOW BINARY LOG STATUS;

INSERT INTO rumahsakit.pasien (id_pasien, nama_pasien, alamat_pasien, jenis_kelamin) VALUES (6, 'Uji Replikasi', 'Jakarta', '1');

SELECT * from pasien p;

	
