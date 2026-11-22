# Akıllı Belge Tarayıcı
## 7. Hafta — 16–22 Kasım 2026
### Manuel Belge Kırpma

**Rapor dönemi sonu:** 22 Kasım 2026  
**Rapor sorumlusu:** Yusuf Emre Gözcü — Kamera ve görüntü işleme  
**Haftalık durum:** Manuel kırpma, sonuç önizlemesi ve yerel PNG taslak akışı geliştirildi.

[← 6. Hafta Raporu](Hafta_06.md) | [Ana İş Planı](../Proje_Kapsami_ve_Is_Plani.md) | [7. Hafta İş Planı](../is-planlari/Hafta_07.md) | [8. Hafta İş Planı](../is-planlari/Hafta_08.md)

---

#### 7.1. Haftanın Amacı

Kamerayla alınan fotoğraf üzerinde kullanıcı tarafından dört köşe seçilmesini, bu seçimin görüntüye uygulanmasını ve elde edilen PNG taslağının cihaz üzerinde saklanarak tekrar açılmasını sağlamak. Bu aşama manuel dörtgen maskelemeyi kapsar; otomatik belge tespiti ve perspektif dönüşümü sonraki haftanın konularıdır.

#### 7.2. Tamamlanan Geliştirmeler

**Rojhat Çetin — Flutter arayüzü ve ekran akışı**

- Fotoğraf önizlemesinden manuel kırpma ekranına geçiş, iptal ve sıfırlama seçenekleri düzenlendi.
- Dört köşeli seçim tutamaçlarının görüntüye göre oransal hareketi korundu; geçersiz konumlara sürükleme sınırlandırıldı.
- Kırpma işlemi sırasında butonların durumu ve işlem bilgisi güncellendi.
- Görüntünün açılamaması veya taslak dosyasının bulunamaması durumları için arayüzde açıklayıcı mesajlar eklendi.
- Kırpma sonucu ve ana ekrandaki yerel taslaklar arasındaki gezinme iyileştirildi.

**Yusuf Emre Gözcü — Görüntü işleme**

- `scan/manual_crop.dart` modülündeki dörtgen maskeleme işlemi geliştirildi.
- Seçim koordinatları normalize edilerek görüntünün gerçek piksel boyutlarına dönüştürüldü.
- Görüntü sınırları dışındaki, içbükey, kesişen ve alanı çok küçük dörtgen seçimleri için kontrol eklendi.
- Maskeleme sonucunda dörtgen dışını saydam bırakan PNG üretimi korundu; görüntü çözümleme nesnelerinin kaynak yönetimi düzenlendi.
- Dörtgen geometrisini sınayan test senaryoları `test/crop_geometry_test.dart` dosyasına eklendi.

**Bayram Külter — Dosya yönetimi ve proje iletişimi**

- Kırpılmış görüntülerin uygulamanın belge dizinindeki `scan_drafts` klasörüne PNG olarak kaydedilmesi geliştirildi.
- Geçersiz PNG verilerinin kaydını engelleyen imza kontrolü eklendi.
- Dosyalar önce geçici bir yazma dosyasına alınıp kayıt tamamlandığında PNG adına taşınacak şekilde düzenlendi.
- Çekilen ham fotoğrafların geçici klasörde tutulması ve yedi günden eski geçici çekim kopyalarının temizlenmesi sağlandı.
- PNG içerik kontrolü için test senaryoları eklendi; haftanın teknik blog yazısı güncellendi.

#### 7.3. Hafta Sonunda Ortaya Çıkan Akış

1. Kullanıcı ana ekrandan **Yeni tarama** işlemini başlatır.
2. Kamera fotoğrafı çeker; kullanıcı önizlemede fotoğrafı kabul eder veya yeniden çeker.
3. Manuel kırpma ekranında dört köşe ayarlanır; seçilen alanın dışında kalan bölge saydamlaştırılır.
4. Sonuç PNG olarak uygulamanın yerel belge dizinine kaydedilir ve önizlenir.
5. Ana ekrandaki **Kırpma taslakları** bölümünden kayıtlı sonuç tekrar açılabilir.

#### 7.4. Kontroller ve Takip Edilecek Noktalar

- Dörtgenin geçerli ve geçersiz konumları için geometri testleri hazırlandı.
- PNG dosya imzası kontrolü için otomatik test senaryoları eklendi.
- Farklı telefon ekranları, fotoğraf yönleri ve çözünürlüklerinde cihaz üzerindeki kullanıcı akışının ayrıca sınanması gerekiyor.
- Bu haftanın PNG maskelemesi, geometrik perspektif düzeltme yerine geçmez.

#### 7.5. Sonraki Hafta — 23–29 Kasım 2026

8. haftada otomatik belge kenarı algılama, OpenCV ile perspektif düzeltme ve manuel köşe düzenleme yönteminin korunması hedeflenecek. Düzeltilmiş çıktı da mevcut yerel taslak akışına bağlanacak.

---

### Proje tanıtımı

**Tanıtım sorumlusu:** Bayram Külter  
**Teknik blog yazısı:** [Dört noktadan bir belge seçmek: manuel kırpmanın ilk adımı](https://rjhtctn.github.io/scan_app-mobile-programming-project/blog/hafta-07.html)  
**İlgili dönem:** 16–22 Kasım 2026
