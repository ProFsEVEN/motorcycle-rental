using { com.pala.motorental as my } from '../db/schema';

// Müşteriler için "Catalog" servisi (Sadece Okuma)
service CatalogService @(path:'/browse') {

    // Motorları listele (Sadece 'Available' olanları gösterelim istersek buraya sorgu ekleriz)
    @readonly entity Bikes as projection on my.Bikes {
        *,
        status.name as statusName,
        status.criticality as statusColor
    } excluding { createdBy, modifiedBy, createdAt, modifiedAt }; 
    // (Admin loglarını müşteriden gizledik 👆)

}