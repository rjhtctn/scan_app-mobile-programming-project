# Akıllı Belge Tarayıcı
## 7. Hafta — 16–22 Kasım 2026
### Manuel Belge Kırpma

**Rapor türü:** Ara ilerleme raporu — haftanın tamamlanmış hâli değildir  
**Durum tarihi:** 17 Kasım 2026, Salı  
**Rapor sorumlusu:** Rojhat Çetin — Proje yöneticisi ve arayüz geliştirme

[← 6. Hafta Raporu](Hafta_06.md) | [Ana İş Planı](../Proje_Kapsami_ve_Is_Plani.md) | [7. Hafta İş Planı](../is-planlari/Hafta_07.md)

---

#### 7.1. 17 Kasım İtibarıyla Genel Durum

Bu haftanın hedefi, çekilmiş bir fotoğraf üzerinde dört köşeyi elle belirleyerek belgeyi kırpmak ve sonucu cihazda saklamaktır. 16–17 Kasım'da kaynak kodda manuel kırpma için ilk işlevler eklendi. Hafta devam ettiği için **geliştirme ve doğrulama çalışmaları sürmektedir**.

#### 7.2. Ekip Çalışmaları — Şimdiye Kadar

**Rojhat Çetin — Proje yönetimi ve arayüz geliştirme**

- `crop_screen.dart` ile fotoğraf üzerinde sürüklenebilir dört köşe ve seçim alanı oluşturuldu.
- İptal, sıfırla ve kırpmayı uygula seçenekleri arayüze eklendi.
- Ana akış, kamera/fotoğraf önizlemesinden kırpma ekranına bağlandı.

**Yusuf Emre Gözcü — Kamera ve görüntü işleme**

- Köşe noktaları görüntüye göre oransal koordinatlar şeklinde tutuluyor.
- Seçilen dörtgenin dışında kalan pikselleri saydamlaştıran PNG maskeleme işleminin ilk sürümü eklendi (`manual_crop.dart`).
- Kırpma sonucunun önizleme ekranında gösterilmesi sağlandı.
- Bu sürüm **perspektif düzeltme değildir**; o işlem 8. haftanın kapsamındadır.

**Bayram Külter — Veri yönetimi, PDF ve tanıtım**

- Kırpılmış PNG dosyaları için yerel taslak kaydetme akışı eklendi (`draft_store.dart`).
- Kaydedilen taslakları ana ekranda listeleme ve yeniden açma desteği eklendi.
- PDF ve SQLite modülleri bu haftanın kapsamına alınmadı. Medium paylaşımının yayımlandığı bu kaynaklardan doğrulanamadı.

#### 7.3. Henüz Tamamlanmayan / Doğrulanması Gereken İşler

- Farklı en-boy oranlarına, görüntü yönlerine ve kamera çözünürlüklerine sahip fotoğraflarda köşe koordinatlarını kontrol etmek.
- Dar veya kesişen dörtgen seçimlerinde kırpma davranışını ve kullanıcıya verilen hata mesajlarını iyileştirmek.
- Kırpılan görüntünün önizlemesini, dosyanın yeniden açılmasını ve saklama sürekliliğini **gerçek Android cihazda test etmek**.
- Geçici fotoğrafların ve taslakların dosya yaşam döngüsünü, olası kaydetme hatalarını kontrol etmek.
- Kullanıcı akışını görsel olarak gözden geçirmek ve gerekli küçük arayüz düzeltmelerini tamamlamak.
- Tanıtım ve Medium güncellemesini planla karşılaştırmak; yayımlandığı doğrulanmadan tamamlandı işaretlememek.


#### 7.4. Haftanın Geri Kalanında Yapılacaklar (18–22 Kasım)

**Rojhat Çetin**
- Manuel kırpma arayüzünün kullanımını, geri dönüşleri ve onay/iptal akışını gözden geçirmek.
- Ekranların farklı telefon boyutlarındaki görünümünü kontrol etmek.
- Çalışmaların takibini yapıp hafta sonu kapanış raporunu hazırlamak.

**Yusuf Emre Gözcü**
- Gerçek fotoğraflarla koordinat ve dörtgen kırpma testlerini yapmak.
- Hatalı köşe seçimleri ve farklı görüntü boyutlarında oluşabilecek sorunları gidermek.
- Perspektif düzeltme ile manuel maskeli kırpmanın farklı işler olduğunu kontrol etmek.

**Bayram Külter**
- Kaydedilen PNG taslaklarını yeniden açma ve dosya hatası senaryolarını denemek.
- Geçici ve kalıcı dosyaların saklama düzenini gözden geçirmek.
- Medium tanıtım güncellemesini hazırlamak veya yayımlanma durumunu raporlamak.

#### 7.5. Ara Değerlendirme ve Sonraki Kayıt

Manuel kırpmanın arayüzü, ilk görüntü işleme adımı ve yerel taslak kaydı **kaynak kod düzeyinde mevcut**. Test, hata düzeltme ve dokümantasyon işleri devam ediyor. Bu belge 17 Kasım tarihli ara rapordur; **22 Kasım hafta sonu kapanış raporunun yerine geçmez**. O tarihte gerçekleşen çalışmalara göre güncellenecektir.

---

### Proje tanıtımı

**Tanıtım sorumlusu:** Bayram Külter  
**Geliştirme blogu:** [Dört noktadan bir belge seçmek: manuel kırpmanın ilk adımı](https://rjhtctn.github.io/scan_app-mobile-programming-project/blog/hafta-07.html)  
**İlgili çalışma dönemi:** 16–22 Kasım 2026

Bu çalışmayı ele alan teknik blog yazısı proje iletişim faaliyetleri kapsamında hazırlanmıştır.
