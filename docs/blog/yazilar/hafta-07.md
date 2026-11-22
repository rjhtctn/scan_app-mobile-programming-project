# Dört noktadan bir belge seçmek: manuel kırpmanın ilk adımı

**Kapsanan hafta:** 16–22 Kasım 2026  
**Yazar:** Bayram Külter

Belge fotoğrafını çekmek ile belgeyi taranabilir hâle getirmek arasında en görünür adımlardan biri kırpmadır. Yedinci haftada dört köşesi elle ayarlanabilen bir seçim alanı ve sonucu yerel bir görüntü taslağı olarak saklayan ilk akışı geliştirmeye başladık. Bu yazı, **16–22 Kasım dönemindeki manuel kırpma geliştirmelerini** ele alıyor.

## Dört köşeyi ekranda taşımak ne kadar basit?

Kullanıcı görüntünün üzerinde dört tutamacı sürüklediğinde ilk bakışta yalnızca birkaç noktanın yer değiştirdiği görülür. Fakat telefon ekranındaki çizim alanı ile fotoğrafın gerçek piksel boyutları farklıdır. Ekrandaki koordinatı doğrudan görüntü pikseli olarak kullanmak, farklı çözünürlüklerde yanlış kırpma alanlarına yol açabilir.

Bu nedenle ilk uygulamada köşeleri görüntünün genişlik ve yüksekliğine göre **0 ile 1 arasında normalize edilmiş koordinatlar** olarak tutuyoruz. Ekrandaki gösterim boyutu değişse de seçilen noktalar oransal olarak aynı konumu temsil edebiliyor.

## Görüntü işleme nerede başlıyor?

Kırpma ekranında seçilen dört köşe `ManualCrop` işlemine aktarılıyor. Kod, fotoğrafı çözümlüyor; köşe noktalarını gerçek piksel koordinatlarına dönüştürüyor; seçili alanın sınırlarını hesaplıyor ve dörtgenin dışında kalan bölümü şeffaf bırakan bir PNG oluşturuyor.

Bu, sıradan dikdörtgen bir kırpmadan daha esnek bir maskeleme adımı; fakat önemli bir sınırlaması var.

> **Dörtgen maske, perspektif düzeltmesi değildir.** Eğik çekilmiş bir sayfanın kenarlarını seçmek mümkündür; ancak sayfayı ön cepheden çekilmiş gibi dikdörtgene dönüştürmek için ayrıca perspektif dönüşümü gerekir. OpenCV ile bu işlemi geliştirmek sonraki aşamanın hedefi.

## Oluşturulan görüntü kaybolmamalı

Bayram'ın yerel dosya tarafındaki geliştirmesi, kırpma sonucunu uygulama belgeleri alanında PNG olarak saklıyor. Ayrıca ana ekran bu taslakları listeleyip yeniden açabiliyor. Böylece manuel kırpma yalnızca anlık bir görsel işlem olarak kalmıyor; kullanıcıya tekrar ulaşabileceği bir ara sonuç sunuyor.

Dosya yolu ve arayüzün birbirinden ayrılması, ileride PDF oluşturma aşaması eklendiğinde de işimize yarayacak. Şimdilik PNG taslağı, nihai PDF belgesiyle aynı şey değil.

## Sırada hangi sorular var?

Haftanın ilk bölümünde farklı fotoğraf boyutlarında köşe davranışı, geçersiz dörtgen seçimleri ve dosya kaydı öncelikli geliştirme başlıklarıydı. Hafta sonuna doğru bu konularda ek kontroller geliştirdik. Bu yazı, manuel kırpmanın **tasarım kararlarına ve uygulama mimarisine** odaklanıyor.

Kamera ile başlayan akışın kullanıcı tarafından kontrol edilebilir hâle gelmesi, Scan App için önemli bir kilometre taşı. Sonraki teknik hedef ise otomatik kenar algılama ve perspektif düzeltme.

## Hafta sonunda neleri iyileştirdik?

Kullanıcının dört köşeyi sürüklemesi sırasında seçim şeklinin kendi üzerine kapanmaması önemliydi. Seçim alanına eklenen geometrik kontroller; görüntü dışına taşan, içbükey, kesişen veya çok küçük dörtgenleri engellemek üzere düzenlendi. Böylece maske üretilmeden önce koordinatların geçerliliği denetleniyor.

Dosya yönetimi tarafında da çıktı PNG'sinin önce geçici bir dosyaya yazılıp ardından kalıcı adına taşınması sağlandı. Bu yaklaşım, yarım kalmış bir yazma işleminin belge listesinde tamamlanmış sonuç gibi görünmesini önlemeyi amaçlıyor. Geçici kamera kopyalarının zamanla birikmemesi için eski çekimler de temizleniyor.

Ana ekranda kayıp taslak dosyası ve görüntü açma hataları için açıklayıcı durum mesajları eklendi. Dörtgen geometrisi ve PNG verisinin temel biçim kontrolü için otomatik test senaryoları hazırlandı. Sonraki aşamada cihaz üzerinde farklı fotoğraf ve ekran boyutlarıyla akış doğrulanacak.

## Koordinatları oransal saklamanın faydası

Örneğin görüntünün sağ üst köşesine yakın bir nokta, ekranda `(0.9, 0.1)` olarak temsil edilebilir. Görüntü 400 piksel genişlikte de olsa 1600 piksel genişlikte de olsa bu noktanın *oransal konumu* değişmez. İşlem sırasında bu değerler görüntünün gerçek genişlik ve yüksekliğiyle çarpılarak piksel koordinatlarına dönüştürülür.

Bu yaklaşım kırpma işlemini her ekran boyutuna otomatik olarak kusursuz uyarlamaz; görüntünün ekrana sığdırılma biçimi yine hesaba katılmalıdır. Ancak farklı çözünürlüklerde aynı dört köşeyi anlamlı biçimde temsil etmek için sağlam bir başlangıç sunar.

