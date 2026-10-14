# AKILLI BELGE TARAYICI
## Proje Başlığı, Kapsam ve İş Planı

**Ders:** Mobile Programming  
**Dönem:** 2026–2027 Güz  
**Ekip:** 3 Kişi  
**Proje Başlangıcı:** 5 Ekim 2026  
**Vize Prototipi:** 2 Kasım 2026 öncesi  
**Final Hedefi:** 21 Aralık 2026  

---

## 1. Projenin Amacı

Flutter kullanarak telefon kamerasıyla belge tarayabilen, çekilen görüntüleri düzenleyebilen, PDF oluşturabilen ve belgeleri cihaz üzerinde saklayabilen bir mobil uygulama geliştirmek.

Uygulama, Adobe Scan benzeri temel belge tarama işlevlerini tek bir arayüz üzerinden sunacaktır.

Kullanıcı; çektiği belge fotoğrafını kırpabilecek, perspektifini düzeltebilecek, görüntü filtreleri ve filigran (watermark) uygulayabilecek, ardından bir veya birden fazla sayfayı PDF olarak kaydedebilecektir.

### 1.1. Çözülmek İstenen Problemler

- Belge fotoğraflarında masa, zemin gibi gereksiz arka planların bulunması
- Açılı çekilen belgelerin yamuk görünmesi
- Işık ve gölge nedeniyle yazıların okunabilirliğinin azalması
- Birden fazla belge sayfasının tek PDF olarak kaydedilememesi
- Belgelerin telefon galerisinde normal fotoğraflarla karışması
- Kaydedilen belgelere sonradan erişmenin ve bunları düzenlemenin zorlaşması

### 1.2. Veri Mahremiyeti

Projenin ek hedeflerinden biri, belge tarama ve işleme işlemlerinin tamamen cihaz üzerinde gerçekleştirilebilmesidir.

Bazı belge tarama uygulamalarında sunulan bulut tabanlı özellikler, dosyaların uzak sunuculara aktarılmasını gerektirebilmektedir.

Geliştireceğimiz uygulamada:

- Belge fotoğrafları cihaz üzerinde işlenecektir.
- Görüntü düzenleme işlemleri yerel olarak yapılacaktır.
- PDF dosyaları cihaz üzerinde oluşturulacaktır.
- Belgeler uzak sunucuya yüklenmeden yerel veritabanı (SQLite) ve dosya sisteminde saklanabilecektir.
- Kullanıcı yalnızca kendisi istediğinde belgeleri başka uygulamalarla paylaşabilecektir.
- Temel tarama işlevleri internet bağlantısı olmadan (çevrimdışı) çalışabilecektir.

Bu özellikler geliştirme sürecinde test edilecektir.

---

## 2. Proje Kapsamı

### 2.1. Temel Özellikler

1. Kamera ile belge fotoğrafı çekme
2. Belge sınırlarını belirleme
3. Manuel belge kırpma
4. Otomatik belge algılama
5. Perspektif düzeltme
6. Gri tonlama ve siyah-beyaz filtreler
7. Kontrast düzenleme
8. Belgelere filigran (watermark) ekleme
9. Tek sayfalı PDF oluşturma
10. Çok sayfalı PDF oluşturma
11. Belgeleri yerel depolama alanına ve SQLite veritabanına kaydetme
12. Belgeleri uygulama içerisinde listeleme
13. Belge yeniden adlandırma ve silme
14. PDF dosyalarını görüntüleme ve paylaşma

### 2.2. İsteğe Bağlı Özellikler

Temel özellikler tamamlandıktan sonra zaman kalırsa:

- OCR ile görüntüden metin çıkarma
- Belgelerde metin arama

Bu özellikler zorunlu geliştirme kapsamına dahil edilmeyecektir.

---

## 3. Kullanılacak Teknolojiler

| Teknoloji | Kullanım Amacı |
|---|---|
| **Flutter** | Mobil uygulama geliştirme ve kullanıcı arayüzü |
| **Dart** | Programlama dili |
| **Android Studio / VS Code** | Geliştirme ortamı |
| **camera** | Kamera erişimi ve fotoğraf çekme |
| **OpenCV entegrasyonu** | Belge sınırı tespiti ve perspektif düzeltme |
| **SQLite / sqflite** | Belge üst verilerinin yerel veritabanında saklanması |
| **PDF kütüphanesi** | Tek ve çok sayfalı PDF dosyalarının oluşturulması |
| **Git / GitHub** | Sürüm kontrolü ve ekip çalışması |
| **Figma veya benzeri araç** | Arayüz tasarımı ve prototipleme |

Görüntü işleme ve PDF işlemleri için kullanılacak Flutter paketleri, geliştirme sırasında uyumluluk ve işlevsellik açısından test edilecektir.

---

## 4. Uygulamanın Çalışma Akışı

1. Kullanıcı uygulamayı açar.
2. Yeni belge tarama işlemini başlatır.
3. Telefon kamerasıyla belge fotoğrafını çeker.
4. Uygulama belge sınırlarını otomatik olarak belirlemeye çalışır.
5. Kullanıcı gerekirse belge köşelerini elle düzenler.
6. Belge kırpılır ve perspektifi düzeltilir.
7. Kullanıcı görüntü filtresini (orijinal, gri tonlama, siyah-beyaz, kontrast) seçer ve isteğe bağlı olarak filigran (watermark) ekler.
8. Gerekirse yeni sayfalar ekler ve sıralar.
9. PDF oluşturur ve belgeye isim verir.
10. Oluşturulan belge cihazda saklanır ve bilgileri SQLite veritabanına kaydedilir.
11. Kullanıcı kayıtlı belgeleri görüntüleyebilir, yeniden adlandırabilir, silebilir veya paylaşabilir.

---

## 5. Ekip Organizasyonu

### 5.1. Ekip Üyeleri

| Ad Soyad | Öğrenci No | Görev / Rol | GitHub |
| :--- | :---: | :--- | :--- |
| **Rojhat Çetin** | 1306220111 | Proje Yöneticisi (Yürütücü) ve Arayüz Geliştirme | [github.com/rjhtctn](https://github.com/rjhtctn) |
| **Yusuf Emre Gözcü** | 1306220090 | Kamera ve Görüntü İşleme | [github.com/yusufemreai51](https://github.com/yusufemreai51) |
| **Bayram Külter** | 1306220123 | Veri Yönetimi, PDF ve Halkla İlişkiler (Tanıtım) | [github.com/Bayraminadresi](https://github.com/Bayraminadresi) |

### 5.2. Görev ve Sorumluluk Dağılımı

#### Rojhat Çetin (1306220111) — Proje Yöneticisi (Yürütücü) ve Arayüz Geliştirme
- **GitHub:** [github.com/rjhtctn](https://github.com/rjhtctn)
- Projenin genel planlaması, koordinasyonu ve insan kaynağı yönetimi
- Haftalık işlerin ve ekip performansının takibi, kayıt altına alınması
- Flutter uygulamasının temel mimarisi ve yapısı
- Ana ekran ve diğer kullanıcı arayüzlerinin geliştirilmesi
- Ekranlar arası navigasyon
- Modüllerin ana projede birleştirilmesi (entegrasyon)
- Haftalık ilerleme raporlarının ve final raporunun koordinasyonu

#### Yusuf Emre Gözcü (1306220090) — Kamera ve Görüntü İşleme
- **GitHub:** [github.com/yusufemreai51](https://github.com/yusufemreai51)
- Kamera paketinin entegrasyonu ve izin yönetimi
- Fotoğraf çekme ve kamera önizleme işlemleri
- Taslak ekran akışları ve belge sınırlarını belirleme
- Manuel dört köşe kırpma işlemleri
- OpenCV ile otomatik belge algılama
- Perspektif düzeltme algoritmaları
- Görüntü filtreleri (gri tonlama, siyah-beyaz, kontrast)

#### Bayram Külter (1306220123) — Veri Yönetimi, PDF ve Halkla İlişkiler (Tanıtım)
- **GitHub:** [github.com/Bayraminadresi](https://github.com/Bayraminadresi)
- Yerel dosya sistemi yönetimi
- SQLite (`sqflite`) veritabanı tasarımı ve entegrasyonu
- Tek ve çok sayfalı PDF oluşturma ile filigran (watermark) ekleme işlemleri
- Belge kaydetme, listeleme, yeniden adlandırma, silme ve paylaşma
- Projenin halkla ilişkiler (PR) ve tanıtım faaliyetlerinin (**Medium** üzerinden blog yazıları ve süreç paylaşımları) yürütülmesi ve haftalık raporlara işlenmesi

Her ekip üyesi uygulamanın kod geliştirme sürecine doğrudan katılacaktır. GitHub üzerindeki kodlama katkılarının her üye için en az %5 olması sağlanacaktır.

---

## 6. Geliştirme Aşamaları

### Aşama 1 — Proje Hazırlığı
- Proje konusunun ve kapsamının belirlenmesi
- Teknolojilerin seçilmesi
- Ekip organizasyonunun oluşturulması
- GitHub deposunun hazırlanması
- Taslak arayüzlerin oluşturulması
- Proje ve iş planı dokümanlarının hazırlanması

### Aşama 2 — Vize Öncesi Prototip
- Flutter projesinin oluşturulması
- Temel ekranların hazırlanması
- Ekranlar arası geçişlerin oluşturulması
- Kamera önizlemesi
- Basit fotoğraf çekme ve görüntüleme

### Aşama 3 — Kamera ve Belge Düzenleme
- Kamera işlemlerinin geliştirilmesi
- Manuel kırpma
- Belge köşelerinin düzenlenmesi
- Otomatik belge algılama
- Perspektif düzeltme

### Aşama 4 — Görüntü İşleme ve PDF
- Görüntü filtreleri
- Belgelere filigran ekleme
- Tek sayfalı PDF
- Çok sayfalı PDF
- PDF dosyalarının cihazda saklanması

### Aşama 5 — Veri Yönetimi
- SQLite entegrasyonu
- Belge kayıtlarının oluşturulması
- Belge listeleme
- Yeniden adlandırma ve silme
- PDF paylaşma

### Aşama 6 — Entegrasyon ve Test
- Modüllerin birleştirilmesi
- Farklı belgelerle testler
- Görüntü işleme hatalarının giderilmesi
- Dosya ve veritabanı kontrolleri
- Çevrimdışı çalışma testleri

### Aşama 7 — Final Hazırlığı
- Uygulamanın son sürümü
- Proje raporu ve ekip performans değerlendirmesi
- GitHub katkı kontrolü
- Tanıtım ve final videosu
- Final sunumu ve teslim

---

## 7. Vize ve Final Hedefleri

### Vize Prototipi

Vize öncesinde Flutter ile geliştirilmiş basit bir uygulama prototipi hazırlanacaktır.

Hedeflenen işlevler:
- Açılabilen Flutter uygulaması
- Ana ekran
- Kamera ekranı
- Ekranlar arası geçiş
- Kamera önizlemesi
- Mümkünse fotoğraf çekme ve önizleme

Otomatik belge tespiti, PDF oluşturma ve SQLite bu aşamada zorunlu olmayacaktır.

### Final Uygulaması

Finale kadar:
- Belge fotoğrafı çekme
- Kırpma ve perspektif düzeltme
- Görüntü filtreleri ve filigran ekleme
- Tek ve çok sayfalı PDF oluşturma
- SQLite ile yerel kayıt
- Belge yönetimi (listeleme, yeniden adlandırma, silme)
- Dosya paylaşma

özellikleri bir arada çalışacak şekilde tamamlanacaktır.

---

## 8. GitHub ve Proje Takibi

- Proje GitHub üzerinde **Public** olarak tutulacaktır.
- Tüm ekip üyeleri depoya katkıda bulunan (contributor) konumunda olacaktır.
- Her ekip üyesinin kod katkısının en az %5 olması sağlanacaktır.
- Geliştirmeler ayrı branch'ler üzerinden yürütülecek ve tamamlanan çalışmalar ana projeye birleştirilecektir.
- Her hafta düzenli olarak haftalık ilerleme raporu hazırlanacaktır.
- Karşılaşılan hatalar ve çözüm yolları raporlarda belirtilecektir.
- Proje yöneticisi tarafından her ekip üyesinin görev tamamlama ve performans durumu kayıt altında tutulup proje sonunda raporlanacaktır.

---

## 9. Halkla İlişkiler ve Tanıtım Faaliyetleri

Projenin halkla ilişkiler ve tanıtım faaliyetleri **Medium** platformu üzerinden blog yazıları paylaşılarak yürütülecektir.

Bu kapsamda:
- Projenin amacı ve çözdüğü problemler Medium yazılarıyla tanıtılacak,
- Uygulamanın ekran görüntüleri ve geliştirme aşamaları paylaşılacak,
- Geliştirme sürecinden düzenli blog içerikleri ve teknik güncellemeler yayınlanacak,
- Yapılan Medium paylaşımları haftalık ilerleme raporlarına işlenecek,
- Finalde uygulamanın tüm işlevlerini anlatan video hazırlanacaktır.

Tanıtım faaliyetlerinin koordinasyonu **Bayram Külter (1306220123)** sorumluluğunda olacaktır.

---

## 10. Proje Takvimi ve Haftalık İş Planları

Her haftanın detaylı görev dağılımına ve hedeflerine aşağıdaki bağlantılardan ulaşılabilir:

| Hafta | Tarih | Ana Çalışma | Detaylı İş Planı | İlerleme Raporu |
| :---: | :--- | :--- | :--- | :--- |
| **1** | 5–11 Ekim 2026 | Proje fikri, kapsam ve iş planı | [1. Hafta İş Planı](is-planlari/Hafta_01.md) | [1. Hafta Raporu](ilerleme-raporlari/Hafta_01.md) |
| **2** | 12–18 Ekim 2026 | Teknoloji ve ekip organizasyonu | [2. Hafta İş Planı](is-planlari/Hafta_02.md) | [2. Hafta Raporu](ilerleme-raporlari/Hafta_02.md) |
| **3** | 19–25 Ekim 2026 | Taslak arayüz tasarımı ve prototip hazırlıkları | [3. Hafta İş Planı](is-planlari/Hafta_03.md) | [3. Hafta Raporu](ilerleme-raporlari/Hafta_03.md) |
| **4** | 26 Ekim–1 Kasım 2026 | İlk Flutter prototipi | [4. Hafta İş Planı](is-planlari/Hafta_04.md) | - |
| **5** | 2–8 Kasım 2026 | Vize ve prototip değerlendirmesi | [5. Hafta İş Planı](is-planlari/Hafta_05.md) | - |
| **6** | 9–15 Kasım 2026 | Kamera modülü | [6. Hafta İş Planı](is-planlari/Hafta_06.md) | - |
| **7** | 16–22 Kasım 2026 | Manuel belge kırpma | [7. Hafta İş Planı](is-planlari/Hafta_07.md) | - |
| **8** | 23–29 Kasım 2026 | Otomatik algılama ve perspektif | [8. Hafta İş Planı](is-planlari/Hafta_08.md) | - |
| **9** | 30 Kasım–6 Aralık 2026 | Filtreler ve ilk PDF | [9. Hafta İş Planı](is-planlari/Hafta_09.md) | - |
| **10** | 7–13 Aralık 2026 | Çok sayfalı PDF ve SQLite | [10. Hafta İş Planı](is-planlari/Hafta_10.md) | - |
| **11** | 14–20 Aralık 2026 | Belge yönetimi, test ve entegrasyon | [11. Hafta İş Planı](is-planlari/Hafta_11.md) | - |
| **12** | 21 Aralık 2026 | Final kontrolü ve teslim | [12. Hafta İş Planı](is-planlari/Hafta_12.md) | - |
