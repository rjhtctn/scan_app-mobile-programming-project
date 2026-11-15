# Kamera açıldıktan sonra iş neden bitmiyor?

**Kapsanan hafta:** 9–15 Kasım 2026  
**Yazar:** Bayram Külter

Bir kamera demosunda tek bir butonla fotoğraf çekmek etkileyicidir. Fakat gerçek bir belge tarama deneyimi, fotoğrafın kaybolmamasını, yanlış karede yeniden çekilebilmesini ve sonraki ekrana doğru aktarılmasını da gerektirir. Altıncı haftada kamera modülünün bu tamamlayıcı parçalarını geliştirdik.

## Kamera her zaman hazır değildir

Mobil cihazlarda kamera açma işlemi anlık değildir. Kullanılabilir kameraların sorgulanması ve kontrolcünün başlatılması zaman alır. Üstelik kamera izni, cihaz özellikleri veya donanıma erişim gibi nedenlerle hata oluşabilir.

Flutter tarafında `CameraController` ile başlatma ve çekim işlemleri yürütülürken kullanıcıya boş bir ekran bırakmak yerine yüklenme ve hata durumlarının ayrı ele alınması önemlidir. Uygulamanın bu aşamasında kamera açılışındaki ve çekim sırasındaki hataları yakalayan temel kontroller eklendi.

## Flaş neden ayrı bir kontrol?

Belge çekimi çoğu zaman yeterli ışığın olmadığı ortamlarda yapılır. Kamera ekranına flaş açma/kapama seçeneği ekleyerek kullanıcıya çekim koşullarında sınırlı da olsa kontrol sağladık. Burada donanım farklılıklarını unutmamak gerekir: Her cihaz aynı flaş davranışını sunmayabilir.

Bu nedenle flaş isteğinin başarısız olabileceği de kodda ele alınıyor. Böylece başarısız bir donanım çağrısının sessizce geçilmesi yerine kullanıcıya geri bildirim verilebiliyor.

## Çekimden sonra dosya nereye gider?

Fotoğraf çekildiğinde kamera paketi bir dosya yolu döndürür. Biz bu görüntüyü uygulamanın geçici alanındaki `scan_drafts` klasörüne kopyalayan bir yapı ekledik. Böylece kamera tarafından üretilen dosyanın yoluna doğrudan bağımlı kalmadan önizleme ekranına ilerlemek mümkün hâle geldi.

Burada *geçici* kelimesi önemli: Bu klasör, tamamlanmış belge arşivi değil; kullanıcının yeni bir çekim yaparken üzerinde çalıştığı görüntüler için bir ara alan.

## Yeniden çek mi, fotoğrafı kullan mı?

Önizleme ekranında bu iki seçeneğin bulunması küçük bir tasarım detayı gibi görünür. Oysa kullanıcıya sonucun sorumluluğunu geri verir. Kadraja el girmişse veya sayfanın bir bölümü dışarıda kalmışsa işlem zincirini sürdürmeden geri dönülebilir.

Altıncı haftanın sonunda uygulamanın kaynak kodunda **kamera, temel hata yönetimi, flaş kontrolü, geçici dosya ve yeniden çekme akışı** bir araya geldi. Bir sonraki eşik, fotoğraftaki gerçek belge alanını kullanıcıya seçtirmekti.

## Geçici dosya ile kalıcı belgeyi ayırmak

Kullanıcı fotoğrafı yeniden çekmeyi seçtiğinde, ilk görüntüyü nihai belge olarak arşivlemek istemeyiz. Bu yüzden kameradan alınan fotoğrafa bir çalışma dosyası gibi davranmak gerekiyor. Uygulama geçici dizininde `scan_drafts` klasörünün kullanılması, çekim sırasında üretilen dosya ile sonradan saklanacak belgeyi ayrı düşünmemizi sağladı.

Geçici dosyalar işletim sistemi tarafından temizlenebilir; bu nedenle belge arşivini yalnızca bu alana dayandırmak doğru değildir. Sonraki kırpma ve kayıt adımlarında uygulamanın belge dizinini kullanma planı bu ayrımdan doğuyor.

## Bir kullanıcı eyleminden birden fazla duruma

Çekim butonuna basıldığında süreç hemen bitmez: Kamera hazır mı, hâlihazırda bir fotoğraf çekiliyor mu, yeni dosya oluşturulabildi mi, önizleme ekranına gidilebilir mi? Bu soruların her biri arayüzün farklı davranmasını gerektirir.

Aynı fotoğrafın peş peşe çekilmesini önlemek için geçici bir "çekim sürüyor" durumu tutmak, yalnızca teknik bir güvence değildir. Kullanıcının ne olduğunu anlayabilmesi ve yanlışlıkla tekrar işlem başlatmaması için de önemlidir.

