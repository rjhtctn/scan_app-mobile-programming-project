# Akıllı Belge Tarayıcı
## 3. Hafta — 19–25 Ekim 2026
### Taslak Arayüz Tasarımı ve Prototip Hazırlıkları

[← 2. Hafta Raporu](Hafta_02.md) | [Ana İş Planı](../Proje_Kapsami_ve_Is_Plani.md) | [3. Hafta İş Planı](../is-planlari/Hafta_03.md) | [4. Hafta Raporu →](Hafta_04.md)

---

#### 3.1. Mevcut Durum (20 Ekim İtibarıyla)

Üçüncü haftaya kadar projenin genel kapsamını, iş planını, kullanılacak teknolojileri ve ekip organizasyonunu belirledik.

Şu ana kadar:

- Proje konusunu belirledik.
- Üç kişilik ekibi oluşturduk ve proje yöneticisini belirledik.
- Proje kapsamı ve haftalık iş planı dokümanlarını hazırladık.
- Ekip içerisindeki görevleri dağıttık.
- Flutter ve Dart ile geliştirme kararı aldık ve kullanılacak temel teknolojileri belirledik.
- GitHub deposunu oluşturduk.
- Uygulamanın taslak arayüz tasarımını hazırladık.

Henüz Flutter projesini oluşturmadık ve uygulamanın kodlanmasına başlamadık.

#### 3.2. Taslak Arayüz Tasarımı

Figma veya benzeri bir tasarım aracıyla uygulamanın ilk arayüz taslağını oluşturduk.

Taslak tasarımda uygulamanın genel görünümünü, ekranların yerleşimini ve kullanıcıların gerçekleştireceği temel işlemleri ele aldık.

Uygulamada bulunması planlanan ekranlar:

**1. Ana Ekran**

- Kaydedilmiş belgelerin listeleneceği alan
- Yeni belge tarama butonu
- Belge kartlarının genel görünümü

**2. Kamera Ekranı**

- Kamera önizleme alanı
- Fotoğraf çekme butonu
- Fotoğraf çekildikten sonraki işlem akışı

**3. Belge Düzenleme Ekranı**

- Çekilen fotoğrafın önizlemesi
- Belge kırpma alanı
- Görüntü filtreleri
- Düzenlemeyi onaylama seçeneği

**4. Belge Detay Ekranı**

- Kaydedilen belgenin görüntülenmesi
- Belge adının düzenlenmesi
- PDF paylaşma
- Belge silme

Bu ekranları Flutter geliştirmesi sırasında kullanacağımız görsel referanslar olarak hazırladık.

Taslaklar henüz çalışan uygulama ekranlarına dönüştürülmedi.

#### 3.3. Henüz Tamamlanmayan Çalışmalar

- Flutter projesinin oluşturulması
- Taslak ekranların Flutter ile geliştirilmesi
- Kamera entegrasyonu
- Görüntü işleme
- PDF oluşturma
- SQLite veritabanı
- Medium tanıtım blogunun oluşturulması ve ilk yazıların yayınlanması

Bu özellikleri geliştirme takvimindeki ilerleyen haftalara dağıttık.

#### 3.4. Haftanın Geri Kalanında Yapılacaklar

**Rojhat Çetin — Proje Yöneticisi (Yürütücü) ve Arayüz Geliştirme**

- Taslak arayüzlere göre ekran geçiş yapısını ve Flutter mimarisini planlamak
- Haftalık görev dağılımını takip etmek
- GitHub deposunun ekip erişimlerini ve dokümantasyon yapısını kontrol etmek

**Yusuf Emre Gözcü — Kamera ve Görüntü İşleme**

- Hazırlanan taslak arayüzü gözden geçirmek
- Flutter'da kullanılacak temel arayüz bileşenlerini belirlemek
- Kamera erişimi için kullanılabilecek paketleri incelemek

**Bayram Külter — Veri Yönetimi, PDF ve Halkla İlişkiler (Tanıtım)**

- Belge bilgilerinin nasıl saklanacağını planlamak
- PDF oluşturma için kullanılabilecek Flutter paketlerini incelemek
- Yerel dosya saklama yapısını değerlendirmek

#### 3.5. Haftanın Hedefi

Bu haftanın sonunda:

- Taslak arayüz tasarımını geliştirmeye hazır hâle getirmeyi
- Ekip görevlerini ve modül yapısını netleştirmeyi
- Flutter geliştirme sürecine başlamak için gerekli hazırlıkları tamamlamayı

hedefliyoruz.

Vize öncesindeki sonraki haftada Flutter projesini oluşturup ana ekran, kamera ekranı ve temel navigasyon özelliklerini içeren ilk prototipi geliştirmeye başlayacağız.

---

#### 3.6. Hafta Sonu Kapanışı (25 Ekim 2026)

**Rapor durumu:** Hafta sonu güncellemesi  
**Rapor sorumlusu:** Rojhat Çetin — Proje yöneticisi ve arayüz geliştirme

> Hafta sonu yapılan çalışmalar aşağıda özetlenmiştir.

**Hafta sonunda tamamlanan hazırlıklar**

- Ana ekran, kamera, belge düzenleme ve belge detay ekranları için hazırlanan taslaklar, `tasarimlar/` klasöründe geliştirme referansı olarak düzenlendi.
- Taslaklar üzerinden temel ekranlar ve kullanıcı akışı belirlendi. Flutter'daki gerçek navigasyon kodlaması 4. haftaya bırakıldı.
- Ekipte arayüz ve koordinasyon (Rojhat), kamera/görüntü işleme (Yusuf) ve yerel veri/PDF/tanıtım (Bayram) sorumlulukları iş planında netleştirildi.
- Repo içerisinde iş planları, tasarım dosyaları ve temel dokümantasyon yapısı oluşturularak 4. haftadaki kod geliştirme aşamasına hazırlık yapıldı.
- `camera`, yerel dosya saklama, SQLite ve PDF için kullanılabilecek teknoloji ve görev alanları proje kapsam dokümanında belirlendi. Paketlerin çalışırlık testleri bu haftada tamamlanmış olarak değerlendirilmedi.

**Üyelere göre kapanış durumu**

| Sorumlu | 25 Ekim itibarıyla sonuç |
|---|---|
| Rojhat Çetin | Ekran/navigasyon kapsamı, ekip sorumlulukları ve GitHub dokümantasyonu başlangıç düzeyinde hazırlandı. |
| Yusuf Emre Gözcü | Kamera ve ekran tasarımlarına ilişkin beklentiler, taslaklar ve geliştirme görevleri belirginleştirildi; kamera entegrasyonu henüz başlamadı. |
| Bayram Külter | Belge saklama, PDF ve tanıtım modüllerinin kapsamı planlandı; çalışan yerel veritabanı, PDF veya yayımlanmış Medium yazısı bu aşamada doğrulanmadı. |

**Tamamlanmayan / sonraki haftalara devredilen işler**

- Flutter projesinin oluşturulması, ana ekran kodları ve sayfalar arası geçiş: **4. hafta**.
- Kamera erişiminin uygulamaya bağlanması, görüntü işleme, PDF ve SQLite: ilgili ileriki haftalar.
- Fiziksel cihaz testi ve geliştirme paketlerinin uygulama içinde doğrulanması: kod geliştirildikçe yapılacak.

**Kapanış değerlendirmesi:** 3. haftanın **tasarım ve planlama hedefleri** tamamlandı; henüz çalışan Flutter uygulaması oluşturulmadı. Böylece 20 Ekim'de açık bırakılan hazırlık işleri için hafta sonu durumu ayrıca kaydedilmiş oldu.

---

### Proje tanıtımı

**Tanıtım sorumlusu:** Bayram Külter  
**Geliştirme blogu:** [Kameradan arşive: dokuz ekranla bir kullanıcı yolculuğu](https://rjhtctn.github.io/scan_app-mobile-programming-project/blog/hafta-03.html)  
**İlgili çalışma dönemi:** 19–25 Ekim 2026

Bu çalışmayı ele alan teknik blog yazısı proje iletişim faaliyetleri kapsamında hazırlanmıştır.
