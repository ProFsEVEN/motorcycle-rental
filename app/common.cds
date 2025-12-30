using { com.pala.motorental as my } from '../db/schema';

// --- BIKES (Motorlar) İÇİN ARAYÜZ KURALLARI ---
annotate my.Bikes with {
    // 1. Alanların Ekranda Nasıl Görüneceği (Etiketler)
    
    // 👇 DEĞİŞİKLİK 1: Hidden'ı sildik, yerine "Bu bir Resimdir" dedik!
    imageUrl        @UI.IsImageURL : true;
    
    make            @title: 'Marka';
    model           @title: 'Model';
    plateNumber     @title: 'Plaka';
    dailyRate       @title: 'Günlük Ücret';
    currency        @title: 'Para Birimi';
    status          @title: 'Durum' @Common.Text: status.name @Common.TextArrangement: #TextOnly;
};

annotate my.Bikes with @(
    UI: {
        // 2. Tablo Başlığı ve Açıklaması
        HeaderInfo: {
            TypeName: 'Motosiklet',
            TypeNamePlural: 'Motosikletler',
            Title: { Value: make },       // Başlıkta Marka yazsın
            Description: { Value: model }, // Altında Model yazsın
            ImageUrl: imageUrl             // 👇 Başlığa da küçük logo olarak resim ekledik
        },

        // 3. Filtreleme Alanları (Üstteki Arama Çubuğu)
        SelectionFields: [ make, status_code ],

        // 4. Liste Görünümü (Tablo Sütunları)
        LineItem: [
            // 👇 DEĞİŞİKLİK 2: Yorum satırını kaldırdık ve en başa koyduk
            { Value: imageUrl, Label: 'Görsel', width: '90px' },
            
            { Value: make },
            { Value: model },
            { Value: plateNumber },
            { Value: dailyRate },
            { Value: currency_code }, 
            
            // 👇 Renklendirme için status.criticality kullandık (Schema'ya uygunsa)
            { Value: status_code, Criticality: status.criticality } 
        ],

        // 5. Detay Sayfası Görünümü
        Facets: [
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Motor Bilgileri', 
                Target: '@UI.FieldGroup#Main'
            },
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Geçmiş Kiralamalar', 
                Target: 'rentals/@UI.LineItem'
            }
        ],

        // Detay Sayfasındaki Form Alanları
        FieldGroup#Main: {
            Data: [
                // Detay sayfasına da büyük resim koyalım
                { Value: imageUrl, Label: 'Motor Görseli' }, 
                { Value: make },
                { Value: model },
                { Value: plateNumber },
                { Value: dailyRate },
                { Value: status_code }
            ]
        }
    }
);

// --- RENTALS (Kiralamalar) İÇİN LİSTE GÖRÜNÜMÜ ---
annotate my.Rentals with @(
    UI.LineItem: [
        { Value: startDate, Label: 'Başlangıç' },
        { Value: endDate, Label: 'Bitiş' },
        { Value: totalPrice, Label: 'Tutar' },
        { Value: status, Label: 'Durum' }
    ]
);