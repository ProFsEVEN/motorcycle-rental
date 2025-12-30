using CatalogService from '../../srv/cat-service';

// --- VİTRİN GÖRÜNÜMÜ ---
annotate CatalogService.Bikes with @(
    UI: {
        // Müşteri 'Sil' veya 'Düzenle' butonu görmeyecek (Service @readonly olduğu için)
        
        // Vitrin Başlığı
        HeaderInfo: {
            TypeName: 'Kiralık Motor',
            TypeNamePlural: 'Kiralık Motorlar',
            Title: { Value: make },
            Description: { Value: model },
            ImageUrl: imageUrl
        },

        // Müşteri için basitleştirilmiş liste (Sadece resim ve fiyat önemli)
        LineItem: [
            { Value: imageUrl, Label: 'Görsel', width: '120px' }, // Resmi biraz daha büyüttük
            { Value: make, Label: 'Marka' },
            { Value: model, Label: 'Model' },
            { Value: dailyRate, Label: 'Günlük Fiyat' },
            { Value: currency_code, Label: '' }, // TL simgesi
            { Value: statusName, Label: 'Durum', Criticality: statusColor }
        ],

        // Müşteri motorun detayına girerse göreceği ekran
        HeaderFacets: [
            { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Price' }
        ],
        
        Facets: [
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Motor Özellikleri',
                Target: '@UI.FieldGroup#Specs'
            }
        ],

        FieldGroup#Price: {
            Data: [
                { Value: dailyRate, Label: 'Şok Fiyat' }
            ]
        },

        FieldGroup#Specs: {
            Data: [
                { Value: plateNumber, Label: 'Araç Plakası' },
                { Value: make },
                { Value: model }
            ]
        }
    }
);