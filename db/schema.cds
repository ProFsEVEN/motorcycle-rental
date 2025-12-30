namespace com.pala.motorental;

using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

// --- ENTITY: MOTORLAR ---
entity Bikes : managed, cuid {
    make         : String(50);
    model        : String(50);
    plateNumber  : String(20);
    dailyRate    : Decimal(10, 2);
    currency     : Currency;
    imageUrl     : String;
    
    // İlişkiyi aşağıda tanımladığımız kendi tablomuzla kuruyoruz
    status       : Association to BikeStatus; 
    
    rentals      : Association to many Rentals on rentals.bike = $self;
    maintenances : Association to many Maintenances on maintenances.bike = $self;
}

// --- ENTITY: MÜŞTERİLER ---
entity Customers : managed, cuid {
    firstName   : String(50);
    lastName    : String(50);
    email       : String(100);
    phoneNumber : String(20);
    driverLicenseType : String(10);
    
    rentals     : Association to many Rentals on rentals.customer = $self;
}

// --- ENTITY: KİRALAMALAR ---
entity Rentals : managed, cuid {
    bike        : Association to Bikes;
    customer    : Association to Customers;
    startDate   : Date;
    endDate     : Date;
    totalPrice  : Decimal(10, 2);
    currency    : Currency;
    status      : String(20) default 'Active';
    comments    : String(500);
}

// --- ENTITY: BAKIM GEÇMİŞİ ---
entity Maintenances : managed, cuid {
    bike        : Association to Bikes;
    description : String(200);
    cost        : Decimal(10, 2);
    date        : Date;
}

// --- CODELIST (MANUEL TANIM) ---
entity BikeStatus {
    key code : String(20);
    name     : String(50);
    descr    : String(200);
    // Yeni eklenen alan: Renk Kodu (0:Gri, 1:Kırmızı, 2:Sarı, 3:Yeşil)
    criticality : Integer; 
}