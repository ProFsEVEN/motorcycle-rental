# 🏍️ Motorcycle Rental & Fleet Management (SAP CAP)

[![SAP CAP](https://img.shields.io/badge/SAP-CAP-blue)](https://cap.cloud.sap/docs/)
[![Node.js](https://img.shields.io/badge/Runtime-Node.js-green)](https://nodejs.org/)
[![UI5](https://img.shields.io/badge/Frontend-Fiori%20Elements-orange)](https://ui5.sap.com/)

[English](#english) | [Türkçe](#türkçe)

---

<a name="english"></a>
## 🇬🇧 English

This project is a modern **Full-Stack Fleet Management Application** developed using the **SAP Cloud Application Programming (CAP)** model. It demonstrates a clean architecture with a Node.js backend and an SAP Fiori Elements frontend.

### 🚀 Tech Stack
* **Framework:** SAP CAP (Node.js)
* **Protocol:** OData V4
* **Database:** SQLite (Persistent)
* **Frontend:** SAP Fiori Elements (List Report & Object Page)
* **Languages:** CDS (Core Data Services), JavaScript, XML

### ⚙️ Key Features
* **Business Logic & Validations:**
    * **Auto-Calculation:** Automatically calculates the `total_price` based on the rental duration (days * daily rate).
    * **Input Validation:** Prevents selecting start dates in the past or end dates before start dates.
    * **Transactional Consistency:** Automatically updates the bike's status to `Rent (Kirada)` when a rental is created and resets it to `Available (Müsait)` when returned.
* **UI/UX:**
    * **Metadata Driven UI:** All UI layouts (columns, fields, facets) are generated via `common.cds` annotations without writing HTML/CSS.
    * **Visual Status:** Color-coded status indicators (Green for Available, Red for Rented) using Criticality.

### 💻 Installation & Usage

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/motorcycle-rental.git](https://github.com/YOUR_USERNAME/motorcycle-rental.git)
    cd motorcycle-rental
    ```

2.  **Install dependencies:**
    ```bash
    npm install
    ```

3.  **Initialize Database (SQLite):**
    ```bash
    cds deploy --to sqlite
    ```

4.  **Run the application:**
    ```bash
    cds watch
    ```
    *Open `http://localhost:4004` in your browser.*

---

<a name="türkçe"></a>
## 🇹🇷 Türkçe

Bu proje, **SAP Cloud Application Programming (CAP)** modeli kullanılarak geliştirilmiş modern bir **Motosiklet Kiralama ve Filo Yönetim** sistemidir. Uçtan uca (Full-Stack) mimaride, Backend validasyonları ve Fiori arayüzü ile kurumsal standartlarda hazırlanmıştır.

### 🚀 Teknolojiler
* **Altyapı:** SAP CAP (Node.js)
* **Protokol:** OData V4
* **Veritabanı:** SQLite (Kalıcı Hafıza)
* **Önyüz:** SAP Fiori Elements (List Report & Object Page)
* **Diller:** CDS (Core Data Services), JavaScript

### ⚙️ Öne Çıkan Özellikler
* **İş Mantığı (Business Logic):**
    * **Otomatik Hesaplama:** Kiralama gün sayısına göre toplam tutarı (`total_price`) anlık olarak hesaplar.
    * **Validasyonlar:** Geçmiş tarihli kiralama yapılmasını veya bitiş tarihinin başlangıçtan önce seçilmesini engeller.
    * **Otomatik Statü Yönetimi:** Bir motor kiralandığında statüsünü otomatik olarak `Kirada` yapar, teslim alındığında `Müsait` durumuna çeker.
* **Arayüz (UI):**
    * **Metadata Güdümlü Tasarım:** HTML/CSS yazmadan, sadece `annotation` kullanarak dinamik ve responsive SAP Fiori ekranları oluşturulmuştur.
    * **Görsel Deneyim:** Araç durumları renk kodlarıyla (Müsait: Yeşil, Kirada: Kırmızı) görselleştirilmiştir.

### 💻 Kurulum ve Çalıştırma

1.  **Projeyi indirin:**
    ```bash
    git clone [https://github.com/KULLANICI_ADINIZ/motorcycle-rental.git](https://github.com/KULLANICI_ADINIZ/motorcycle-rental.git)
    cd motorcycle-rental
    ```

2.  **Paketleri yükleyin:**
    ```bash
    npm install
    ```

3.  **Veritabanını Kurun (SQLite):**
    ```bash
    cds deploy --to sqlite
    ```

4.  **Projeyi Başlatın:**
    ```bash
    cds watch
    ```
    *Tarayıcınızda `http://localhost:4004` adresine gidin.*

---
**Developer:** [Abdullah Alıcı]