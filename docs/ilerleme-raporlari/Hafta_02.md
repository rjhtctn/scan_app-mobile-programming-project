# Akıllı Belge Tarayıcı
## 2. Hafta — 12–18 Ekim 2026
### Teknoloji Seçimi ve Ekip Organizasyonu

[← 1. Hafta Raporu](Hafta_01.md) | [Ana İş Planı](../Proje_Kapsami_ve_Is_Plani.md) | [2. Hafta İş Planı](../is-planlari/Hafta_02.md) | [3. Hafta Raporu →](Hafta_03.md)

---

#### 2.1. Teknoloji Seçimi

Mobil uygulamayı Flutter ve Dart kullanarak geliştirmeye karar verdik ve ikinci hafta kullanacağımız yardımcı paketleri ve teknik mimariyi detaylandırdık.

Flutter'ı uygulamanın arayüzlerini ve ekranlar arası geçişlerini geliştirmek için kullanacağız.

Planladığımız teknik yapı:

| Teknoloji | Kullanım Amacı |
|---|---|
| Flutter | Mobil uygulama geliştirme |
| Dart | Programlama dili |
| Android Studio / VS Code | Geliştirme ortamı |
| camera | Kamera erişimi |
| OpenCV | Belge algılama ve görüntü işleme |
| sqflite / SQLite | Yerel veritabanı |
| PDF kütüphanesi | PDF oluşturma |
| GitHub | Sürüm kontrolü ve ortak çalışma |

Kamera, görüntü işleme ve PDF işlemleri için kullanılacak paketlerin uyumluluğunu geliştirme aşamasında test etmeyi planladık.

#### 2.2. Görüntü İşleme Yaklaşımı

Belge fotoğraflarındaki sayfa sınırlarını bulmak ve perspektif düzeltmesi yapmak için OpenCV kullanmayı planladık.

Belge algılama işlemi için değerlendirdiğimiz aşamalar:

1. Fotoğrafı gri tonlamaya dönüştürme
2. Görüntüdeki gürültüyü azaltma
3. Kenar tespiti
4. Belgeyi temsil eden dörtgeni belirleme
5. Perspektif düzeltme
6. Düzeltilmiş görüntüyü kaydetme

Kenar tespiti için Canny algoritması ve kontur analizi gibi yöntemlerden yararlanılabileceğini belirledik.

Bu aşamada görüntü işleme algoritmasını henüz uygulamadık veya test etmedik.

#### 2.3. Yerel Veri Saklama

Taranan belgelerin dosyalarını ve bu dosyalara ait bilgileri ayrı saklamaya karar verdik.

PDF ve görsel dosyalarını telefonun yerel depolama alanında tutmayı, belge bilgilerini ise SQLite veritabanında saklamayı planladık.

Veritabanında bulunmasını istediğimiz alanlar:

- Belge kimliği
- Belge adı
- Oluşturulma tarihi
- Dosya yolu
- Sayfa sayısı

Bu yapı sayesinde kaydedilen belgelerin uygulama içerisinde listelenmesini ve yönetilmesini hedefledik.

#### 2.4. Ekip Organizasyonu

Üç kişilik ekipte görev dağılımını belirledik.

**Rojhat Çetin (1306220111) — Proje Yöneticisi (Yürütücü) ve Arayüz Geliştirme** ([github.com/rjhtctn](https://github.com/rjhtctn))
- Proje koordinasyonu
- Flutter proje yapısı
- Kullanıcı arayüzleri
- Ekranlar arası geçişler
- Haftalık raporların koordinasyonu

**Yusuf Emre Gözcü (1306220090) — Kamera ve Görüntü İşleme** ([github.com/yusufemreai51](https://github.com/yusufemreai51))
- Kamera entegrasyonu
- Fotoğraf çekme
- Belge sınırlarının belirlenmesi
- Manuel kırpma
- Perspektif düzeltme
- Görüntü filtreleri

**Bayram Külter (1306220123) — Veri Yönetimi, PDF ve Halkla İlişkiler (Tanıtım)** ([github.com/Bayraminadresi](https://github.com/Bayraminadresi))
- SQLite
- PDF oluşturma
- Belge yönetimi
- Dosya kaydetme ve paylaşma
- Tanıtım faaliyetleri (Medium blog paylaşımları)

Görev dağılımını her ekip üyesinin uygulamanın geliştirilmesine doğrudan katkı sağlayacağı şekilde düzenledik.

#### 2.5. GitHub

Proje için GitHub deposunu oluşturduk.

GitHub'ı uygulamanın kaynak kodlarını ortak bir yerde tutmak, yapılan değişiklikleri takip etmek ve ekip üyelerinin katkılarını görüntülemek amacıyla kullanacağız.

Flutter projesini henüz oluşturmadığımız için uygulamanın kaynak kodları üzerinde ortak geliştirme sürecine başlamadık.

#### 2.6. Haftanın Sonucu

Uygulamanın geliştirilmesinde kullanılacak teknolojileri ve temel teknik yaklaşımı belirledik.

Ekip görevlerini dağıttık ve GitHub deposunu oluşturduk.

Sonraki hafta uygulamanın taslak arayüzünü ve ekran akışlarını hazırlamaya odaklanacağız.
