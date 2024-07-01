/*
Tablolar
Ogrenciler: Öðrenci bilgilerini saklar.
Dersler: Ders bilgilerini saklar.
Ogretmenler: Öðretmen bilgilerini saklar.
Siniflar: Sýnýf bilgilerini saklar.
Kayitlar: Öðrencilerin hangi derslere kayýtlý olduðunu saklar.
Bolumler: Bölüm bilgilerini saklar.
DersProgrami: Derslerin hangi gün ve saatte olduðunu saklar.
*/

--Veritabaný oluþturma
CREATE DATABASE OgrenciYonetimSistemi;

-- Veritabanýna geçiþ yapma
USE OgrenciYonetimSistemi;

-- Bölümler Tablosu
CREATE TABLE Bolumler (
    BolumID INT IDENTITY(1,1) PRIMARY KEY,
    BolumAdi NVARCHAR(100) NOT NULL
);

-- Öðretmenler Tablosu
CREATE TABLE Ogretmenler (
    OgretmenID INT IDENTITY(1,1) PRIMARY KEY,
    Isim NVARCHAR(50) NOT NULL,
    Soyisim NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL
);

-- Dersler Tablosu
CREATE TABLE Dersler (
    DersID INT IDENTITY(1,1) PRIMARY KEY,
    DersAdi NVARCHAR(100) NOT NULL,
    Kredi INT NOT NULL,
    OgretmenID INT,
    FOREIGN KEY (OgretmenID) REFERENCES Ogretmenler(OgretmenID)
);

-- Sýnýflar Tablosu
CREATE TABLE Siniflar (
    SinifID INT IDENTITY(1,1) PRIMARY KEY,
    SinifAdi NVARCHAR(50) NOT NULL
);

-- Öðrenciler Tablosu
CREATE TABLE Ogrenciler (
    OgrenciID INT IDENTITY(1,1) PRIMARY KEY,
    Isim NVARCHAR(50) NOT NULL,
    Soyisim NVARCHAR(50) NOT NULL,
    DogumTarihi DATE,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    BolumID INT,
    FOREIGN KEY (BolumID) REFERENCES Bolumler(BolumID)
);

-- Kayýtlar Tablosu
CREATE TABLE Kayitlar (
    KayitID INT IDENTITY(1,1) PRIMARY KEY,
    OgrenciID INT,
    DersID INT,
    KayitTarihi DATE NOT NULL,
    FOREIGN KEY (OgrenciID) REFERENCES Ogrenciler(OgrenciID),
    FOREIGN KEY (DersID) REFERENCES Dersler(DersID)
);

-- Ders Programý Tablosu
CREATE TABLE DersProgrami (
    ProgramID INT IDENTITY(1,1) PRIMARY KEY,
    DersID INT,
    SinifID INT,
    Gun NVARCHAR(20) NOT NULL,
    Saat NVARCHAR(20) NOT NULL,
    FOREIGN KEY (DersID) REFERENCES Dersler(DersID),
    FOREIGN KEY (SinifID) REFERENCES Siniflar(SinifID)
);

-- Verileri Ekleme

-- Bölümler Tablosuna Veri Ekleme
INSERT INTO Bolumler (BolumAdi)
VALUES 
('Bilgisayar Mühendisliði'),
('Elektrik-Elektronik Mühendisliði'),
('Makine Mühendisliði');

-- Öðretmenler Tablosuna Veri Ekleme
INSERT INTO Ogretmenler (Isim, Soyisim, Email)
VALUES 
('Ahmet', 'Demir', 'kerem.kýlýc@example.com'),
('Aylin', 'Kaya', 'zeynep.kaya@example.com'),
('Emre', 'Tuna', 'eren.tuna@example.com');

-- Dersler Tablosuna Veri Ekleme
INSERT INTO Dersler (DersAdi, Kredi, OgretmenID)
VALUES 
('Algoritmalar', 4, 1),
('Elektrik Devreleri', 3, 2),
('Termodinamik', 3, 3);

-- Sýnýflar Tablosuna Veri Ekleme
INSERT INTO Siniflar (SinifAdi)
VALUES 
('A1'),
('B2'),
('C3');

-- Öðrenciler Tablosuna Veri Ekleme
INSERT INTO Ogrenciler (Isim, Soyisim, DogumTarihi, Email, BolumID)
VALUES 
('Nisa', 'Yýlmaz', '2000-05-10', 'nisa.yilmaz@example.com', 1),
('Ali', 'Kara', '1999-08-15', 'ali.kara@example.com', 2),
('Alperen', 'Þahin', '2001-12-20', 'alperen.sahin@example.com', 3);

-- Kayýtlar Tablosuna Veri Ekleme
INSERT INTO Kayitlar (OgrenciID, DersID, KayitTarihi)
VALUES 
(1, 2, '2024-01-15'),
(1, 3, '2024-01-16'),
(2, 4, '2024-01-17'),
(3, 2, '2024-01-18');

-- Ders Programý Tablosuna Veri Ekleme
INSERT INTO DersProgrami (DersID, SinifID, Gun, Saat)
VALUES 
(2, 1, 'Pazartesi', '09:00-11:00'),
(3, 2, 'Çarþamba', '13:00-15:00'),
(4, 3, 'Cuma', '10:00-12:00');