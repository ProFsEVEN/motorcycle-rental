# 🏍️ Motorcycle Fleet Management System

[![SAP CAP](https://img.shields.io/badge/SAP-CAP-blue)](https://cap.cloud.sap/docs/)
[![Node.js](https://img.shields.io/badge/Runtime-Node.js-green)](https://nodejs.org/)
[![UI5](https://img.shields.io/badge/Frontend-Fiori%20Elements-orange)](https://ui5.sap.com/)

[English](#english) | [Türkçe](#türkçe)

---

<a name="english"></a>
## 🇬🇧 English

This project is a modern **Full-Stack Fleet Management Application** developed using the **SAP Cloud Application Programming (CAP)** model. It demonstrates a unified architecture that serves two distinct user experiences: a professional Back-Office for managers and a visual Storefront for customers.

### 🌟 Project Architecture & Features

#### 1. Admin Panel (Back-Office)
* **Technology:** SAP Fiori Elements (List Report & Object Page).
* **Functionality:** Designed for fleet managers to handle data operations.
* **Key Features:**
    * Advanced filtering and search capabilities.
    * Excel-like data management (CRUD operations).
    * Real-time status tracking (Available/Rented).

#### 2. Customer Storefront (Public View)
* **Technology:** SAP Fiori Elements (Customized).
* **Functionality:** A public-facing catalog for customers to browse motorcycles.
* **Key Features:**
    * **Mobile-First Design:** Automatically adapts to a "Card View" layout on mobile devices.
    * **Visual Focus:** High-quality image display with essential vehicle details.
    * **Read-Only Access:** Secure browsing without modification rights.

### 🚀 Tech Stack
* **Framework:** SAP CAP (Node.js)
* **Protocol:** OData V4
* **Database:** SQLite (Dev) / HANA (Prod Ready)
* **Frontend:** SAP Fiori Elements
* **Languages:** CDS (Core Data Services), JavaScript

### 💻 Installation & Usage

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/ProFSEVEN/motorcycle-rental.git](https://github.com/ProFSEVEN/motorcycle-rental.git)
    cd motorcycle-rental
    ```

2.  **Install dependencies:**
    ```bash
    npm install
    ```

3.  **Initialize Database:**
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

Bu proje, **SAP Cloud Application Programming (CAP)** modeli kullanılarak geliştirilmiş modern bir **Motosiklet Kiralama ve Filo Yönetim** sistemidir. Proje, tek bir mimari üzerinde iki farklı kullanıcı deneyimi sunan uçtan uca (Full-Stack) bir çözümdür.

### 🌟 Proje Mimarisi ve Özellikler

#### 1. Admin Paneli (Yönetim Ekranı)
* **Teknoloji:** SAP Fiori Elements (List Report & Object Page).
* **Amaç:** Filo yöneticilerinin tüm verileri yönetebilmesi için tasarlanmıştır.
* **Özellikler:**
    * Gelişmiş filtreleme ve arama seçenekleri.
    * Excel benzeri veri yönetimi ve CRUD işlemleri.
    * Anlık durum takibi (Müsait/Kirada ayrımı).

#### 2. Müşteri Vitrini (Public Store)
* **Teknoloji:** SAP Fiori Elements (Özelleştirilmiş).
* **Amaç:** Müşterilerin araçları inceleyebilmesi için oluşturulmuş vitrin ekranıdır.
* **Özellikler:**
    * **Mobil Uyumlu Tasarım:** Mobil cihazlarda otomatik olarak "Kart Görünümü"ne (Card View) dönüşen responsive yapı.
    * **Görsel Odaklı:** Araç resimlerinin ve temel bilgilerin şık sunumu.
    * **Sadece Okunabilir (Read-Only):** Güvenli gezinme modu.

### 🚀 Teknolojiler
* **Altyapı:** SAP CAP (Node.js)
* **Protokol:** OData V4
* **Veritabanı:** SQLite (Geliştirme) / HANA (Canlı)
* **Önyüz:** SAP Fiori Elements
* **Diller:** CDS (Core Data Services), JavaScript

### 💻 Kurulum ve Çalıştırma

1.  **Projeyi indirin:**
    ```bash
    git clone [https://github.com/ProFSEVEN/motorcycle-rental.git](https://github.com/ProFSEVEN/motorcycle-rental.git)
    cd motorcycle-rental
    ```

2.  **Paketleri yükleyin:**
    ```bash
    npm install
    ```

3.  **Veritabanını Kurun:**
    ```bash
    cds deploy --to sqlite
    ```

4.  **Projeyi Başlatın:**
    ```bash
    cds watch
    ```
    *Tarayıcınızda `http://localhost:4004` adresine gidin.*

---
**Developer:** Abdullah Alıcı