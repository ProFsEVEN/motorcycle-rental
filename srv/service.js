const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {

    // Veritabanı tablolarına erişim için tanımlar
    const { Bikes, Rentals } = this.entities;

    this.before('CREATE', 'Rentals', async (req) => {
        const { startDate, endDate, bike_ID } = req.data;
        
   
        if (startDate && endDate) {
            const start = new Date(startDate);
            const end = new Date(endDate);

            if (end < start) {
                req.error(400, 'HATA: Bitiş tarihi, başlangıç tarihinden önce olamaz!');
            }


            if (bike_ID) {
                const bike = await SELECT.one.from(Bikes).where({ ID: bike_ID });

                if (bike) {
                    const diffTime = Math.abs(end - start);
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
                    
                    const rentalDays = diffDays === 0 ? 1 : diffDays;

                    req.data.totalPrice = rentalDays * bike.dailyRate;
                    req.data.currency_code = bike.currency_code;
                }
            }
        }
    });

    this.after('CREATE', 'Rentals', async (result, req) => {
        const bike_ID = result.bike_ID;

        if (bike_ID) {
            await UPDATE(Bikes)
                .set({ status_code: 'RENTED' })
                .where({ ID: bike_ID });
            
            console.log(`>> Motor durumu güncellendi: ${bike_ID} -> RENTED`);
        }
    });

    this.after('UPDATE', 'Rentals', async (result, req) => {
        // Eğer işlem başarılıysa ve durum 'Completed' olduysa
        if (result.status === 'Completed') {
            
            // 1. bike_ID elimizde var mı bakalım (PATCH işleminde genelde olmaz)
            let bike_ID = result.bike_ID;

            // 2. Eğer yoksa, veritabanından bu kiralama kaydını bulup içinden alalım
            if (!bike_ID) {
                // req.data.ID, güncellenen kaydın ID'sidir.
                const rental = await SELECT.one.from(Rentals).where({ ID: req.data.ID });
                if (rental) {
                    bike_ID = rental.bike_ID;
                }
            }

            // 3. ID'yi bulduysak motoru güncelle
            if (bike_ID) {
                await UPDATE(Bikes)
                    .set({ status_code: 'AVAILABLE' })
                    .where({ ID: bike_ID });
                
                console.log(`>> Operasyon Başarılı! Motor (ID: ${bike_ID}) tekrar MÜSAİT yapıldı.`);
            }
        }
    });
});