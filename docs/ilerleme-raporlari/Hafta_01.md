# Akıllı Belge Tarayıcı
## 1. Hafta — 5–11 Ekim 2026
### Proje Fikrinin Belirlenmesi

[← Ana İş Planı](../Proje_Kapsami_ve_Is_Plani.md) | [1. Hafta İş Planı](../is-planlari/Hafta_01.md) | [2. Hafta Raporu →](Hafta_02.md)

---

#### 1.1. Proje Konusu ve Yönetimi

İlk hafta mobil programlama dersi için geliştirebileceğimiz proje konularını değerlendirdik ve Adobe Scan benzeri bir belge tarama uygulaması geliştirmeye karar verdik. Üç kişilik ekibimizi oluşturarak proje yöneticisini (**Rojhat Çetin**) belirledik ve proje kapsamı ile genel iş planımızı hazırladık.

Uygulamanın temel amacını, telefon kamerasıyla çekilen belge fotoğraflarını düzenleyerek PDF formatına dönüştürmek ve bu belgeleri uygulama içerisinde yönetebilmek olarak belirledik.

#### 1.2. Çözmek İstediğimiz Problemler

Normal kamera uygulamasıyla belge fotoğrafı çekildiğinde ortaya çıkabilecek sorunları değerlendirdik:

- Belgenin etrafında masa veya zemin gibi gereksiz alanların kalması
- Açılı çekilen belgelerin yamuk görünmesi
- Işık ve gölgeler nedeniyle yazıların zor okunması
- Birden fazla sayfanın tek PDF olarak kaydedilmesi ihtiyacı
- Belgelerin telefon galerisindeki diğer fotoğraflarla karışması

Bu sorunları tek bir mobil uygulama üzerinden çözmeyi hedefledik.

Veri mahremiyetini de ek bir avantaj olarak ele aldık. Bazı belge tarama uygulamalarında bulut özellikleri nedeniyle belgeler uzak sunuculara aktarılabiliyor.

Geliştireceğimiz uygulamada görüntü işleme, PDF oluşturma ve dosya kaydetme işlemlerini cihaz üzerinde gerçekleştirmeyi planladık.

#### 1.3. Uygulamanın Temel Özellikleri

Uygulamada bulunmasını istediğimiz özellikleri belirledik:

1. Kamera ile belge fotoğrafı çekme
2. Belge sınırlarını belirleme
3. Belge kırpma ve perspektif düzeltme
4. Görüntü filtreleri uygulama
5. Belgelere filigran (watermark) ekleme
6. Tek ve çok sayfalı PDF oluşturma
7. Belgeleri cihazda kaydetme
8. Kaydedilen belgeleri listeleme ve yönetme
9. PDF dosyalarını paylaşma

OCR ile metin çıkarma ve metin arama özelliklerini temel kapsam dışında bıraktık. Zaman kalması durumunda değerlendirmeye karar verdik.

#### 1.4. Uygulamanın Çalışma Mantığı

Kullanıcının uygulama içerisinde izleyeceği temel işlem sırasını oluşturduk:

Kamera → Fotoğraf Çekme → Belge Sınırlarını Belirleme → Kırpma → Görüntü Düzenleme → PDF Oluşturma → Kaydetme

Belge sınırlarının otomatik belirlenemediği durumlarda manuel köşe düzenleme özelliğinin bulunmasını da planladık.

#### 1.5. Haftanın Sonucu

Proje konusunu, proje yöneticisini, temel amacımızı, çözmek istediğimiz problemleri, uygulamanın ana özelliklerini ve genel iş planını belirledik.

Henüz yazılım geliştirmeye başlamadık.

Sonraki hafta uygulamanın hangi teknolojilerle geliştirileceğini ve ekip içerisindeki görev dağılımını belirleyeceğiz.
