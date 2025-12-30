using { com.pala.motorental as my } from '../db/schema';

// --- BIKES (Motorlar) İÇİN ARAYÜZ KURALLARI ---
annotate my.Bikes with {
    // 1. Alanların Ekranda Nasıl Görüneceği (Etiketler)
    imageUrl    @UI.Hidden; // Resim URL'sini metin olarak gösterme, aşağıda özel kullanacağız
    make        @title: 'Marka';
    model       @title: 'Model';
    plateNumber @title: 'Plaka';
    dailyRate   @title: 'Günlük Ücret';
    currency    @title: 'Para Birimi';
    status      @title: 'Durum' @Common.Text: status.name @Common.TextArrangement: #TextOnly;
};

annotate my.Bikes with @(
    UI: {
        // 2. Tablo Başlığı ve Açıklaması
        HeaderInfo: {
            TypeName: 'Motosiklet',
            TypeNamePlural: 'Motosikletler',
            Title: { Value: make }, // Başlıkta Marka yazsın
            Description: { Value: model } // Altında Model yazsın
        },

        // 3. Filtreleme Alanları (Üstteki Arama Çubuğu)
        SelectionFields: [ make, status_code ],

        // 4. Liste Görünümü (Tablo Sütunları)
        LineItem: [
            // { Value: imageUrl, Label: 'Resim' }, // Resim URL'si yerine resmi göstermek için Fiori ayarı gerekebilir, şimdilik kapalı
            { Value: make },
            { Value: model },
            { Value: plateNumber },
            { Value: dailyRate },
            { Value: currency_code }, // Para birimi kodu
            { Value: status_code, Criticality: status.code } // Duruma göre renk (Yeşil/Kırmızı)
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
// Detay sayfasında "Geçmiş Kiralamalar" tablosu için
annotate my.Rentals with @(
    UI.LineItem: [
        { Value: startDate, Label: 'Başlangıç' },
        { Value: endDate, Label: 'Bitiş' },
        { Value: totalPrice, Label: 'Tutar' },
        { Value: status, Label: 'Durum' }
    ]
);