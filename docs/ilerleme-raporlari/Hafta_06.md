# Akıllı Belge Tarayıcı
## 6. Hafta — 9–15 Kasım 2026
### Kamera Modülünün Geliştirilmesi

**Rapor dönemi sonu:** 15 Kasım 2026  
**Rapor sorumlusu:** Rojhat Çetin — Proje yönetimi ve Flutter arayüzü

[← 5. Hafta Raporu](Hafta_05.md) | [6. Hafta İş Planı](../is-planlari/Hafta_06.md) | [7. Hafta Raporu →](Hafta_07.md)

---

#### 6.1. Haftanın Özeti

Bu hafta, ilk prototipteki kamera ve fotoğraf çekme akışı geliştirildi. Kaynak kod değişiklikleri; çekim hatalarının ele alınması, flaş kontrolü, fotoğrafın geçici dosyada tutulması ve kullanıcının fotoğrafı yeniden çekebilmesi ya da kullanabilmesi üzerinde yoğunlaştı.

#### 6.2. Ekip Çalışmaları

**Rojhat Çetin — Proje yönetimi ve arayüz geliştirme**
- Fotoğraf önizleme ekranındaki kullanıcı akışı geliştirildi.
- Yeniden çekme ve fotoğrafı kullanma seçenekleri eklendi.
- Bir sonraki haftadaki kırpma ekranına temel oluşturacak geçiş düzenlendi.

**Yusuf Emre Gözcü — Kamera ve görüntü işleme**
- Kamera açılışı ve çekim sırasında oluşabilecek hata durumları için kontroller eklendi.
- Flaş kontrolü geliştirildi.
- Kamera ekranı ve çekim akışındaki hata yönetimi iyileştirildi.

**Bayram Külter — Veri yönetimi ve PDF**
- Çekilen fotoğrafın uygulama içinde geçici olarak saklanmasına yönelik dosya işlemleri eklendi.
- Geçici görsellerin uygulama ekranları arasında kullanılabilmesi için dosya yolu akışı hazırlandı.

#### 6.3. Hafta Sonundaki Durum

Uygulama, kaynak kod düzeyinde kamera açma, fotoğraf çekme, fotoğrafı önizleme, yeniden çekme ve geçici dosya saklama akışına sahiptir. Manuel kırpma, PDF üretimi ve SQLite entegrasyonu henüz bu haftanın teslim kapsamına dahil değildir.


#### 6.4. Sonraki Hafta

Kullanıcının belge üzerinde dört köşe belirleyebileceği manuel kırpma ekranı ve kırpılan fotoğrafın yerel olarak saklanması geliştirilecektir.

---

### Proje tanıtımı

**Tanıtım sorumlusu:** Bayram Külter  
**Geliştirme blogu:** [Kamera açıldıktan sonra iş neden bitmiyor?](https://rjhtctn.github.io/scan_app-mobile-programming-project/blog/hafta-06.html)  
**İlgili çalışma dönemi:** 9–15 Kasım 2026

Bu çalışmayı ele alan teknik blog yazısı proje iletişim faaliyetleri kapsamında hazırlanmıştır.
