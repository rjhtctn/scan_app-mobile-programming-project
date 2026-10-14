# Bir belgeyi fotoğraflamak neden onu taramak değildir?

**Kapsanan hafta:** 5–11 Ekim 2026  
**Yazar:** Bayram Külter

Bir faturayı veya ders notunu telefonla fotoğraflamak kolay. Ancak fotoğrafı daha sonra yeniden kullanmak istediğimizde sorunlar başlıyor: masanın kenarı kadrajda kalıyor, sayfa yamuk duruyor, gölge metnin üzerine düşüyor ve birkaç sayfayı birlikte göndermek için dosyaları tek tek seçmek gerekiyor. **Scan App** fikri tam olarak bu küçük ama tekrarlanan sürtünmelerden çıktı.

## Fotoğraf ile belge arasındaki fark

Telefon kamerası, bir sahnenin görüntüsünü kaydeder. Belge tarama deneyimi ise fotoğrafı *belge olarak kullanılabilir* hâle getirmeyi hedefler. Bu ayrım, görüntüdeki gereksiz alanları ayıklamak, sayfanın geometrisini düzenlemek, okunabilirliği yükseltmek ve dosyayı anlamlı bir isimle saklamak gibi işlemleri beraberinde getirir.

Bir belge tarayıcıda kullanıcı için en kritik an, deklanşöre basılan an değildir. **Çekimden sonraki kararların kolaylığıdır:** Çekilen fotoğraf doğru mu? Sayfa sınırları belirgin mi? Bir sayfa daha eklenecek mi? Sonuç nerede saklanacak?

Bu soruları tek akışta çözmek için başlangıçta şu yolculuğu tasarladık:

**Belgeyi yakala → sınırlarını belirle → görüntüyü düzenle → dosyayı oluştur → daha sonra eriş.**

## Yerel çalışma neden bir ürün kararı?

Ders notu gibi sıradan bir kâğıt da, kişisel bilgi içeren bir evrak da taranabilir. Bu nedenle ilk günden itibaren temel işlemlerin cihaz üzerinde yapılmasını hedefledik. Amaç, belgenin işlenmesi için zorunlu olarak bir uzak sunucuya gönderilmesine ihtiyaç duymamak.

Bu yaklaşımın mühendislik açısından bir karşılığı var: Görüntüyü cihazda işleyecek yöntemleri seçmek, dosyaları uygulama alanında tutmak ve belge bilgilerini yerel olarak yönetmek gerekiyor. Bulut senkronizasyonunu temel kapsam dışında tutmamızın nedeni yalnızca sadelik değil; ürünün mahremiyet vaadini tasarımın merkezine yerleştirmek.

## Kapsamı bilinçli belirlemek

İlk kapsamda kamera, manuel ve otomatik belge sınırı belirleme, görüntü düzenleme, tek/çok sayfalı PDF ve dosya yönetimini hedef olarak yazdık. OCR ile metin tanımayı ise isteğe bağlı tuttuk. Çünkü iyi bir tarama deneyiminin temelini oluşturan kamera–kırpma–kaydetme hattını sağlamlaştırmadan yeni özellikler eklemek kullanıcı deneyimini iyileştirmiyor.

Bu haftanın ürünü çalışan bir uygulama değil, **ne yapacağımızı ve neyi henüz yapmayacağımızı netleştiren bir ürün tanımı** oldu. Sonraki kararlar için önemli olan da buydu.

## İlk sorudan ilk ekrana

Bir sonraki adım, bu ürün fikrini gerçek bir mobil uygulamaya dönüştürecek teknoloji yığınını seçmek. Arayüz ve görüntü işlemenin farklı sorumluluklar olduğunu baştan kabul etmek, ekip iş bölümümüzü de şekillendirdi.

## Gerçek kullanım senaryolarıyla düşünmek

Bir öğrencinin ders notu, evde saklanan bir garanti belgesi ve masraf fişi aynı tür kâğıt değildir. Bazıları ince ve kıvrılmış, bazıları parlak, bazıları ise A4 sayfadan çok daha küçüktür. Tarayıcıyı yalnızca iyi ışık altındaki tek bir sayfaya göre tasarlamak, günlük kullanımın önemli bir bölümünü gözden kaçırmak demektir.

Ürün hedefini belirlerken bu farklılıkları hesaba kattık. Kullanıcı her seferinde aynı açıda fotoğraf çekmeyecek; bazen belgenin arka planı koyu, bazen de kenarlar arka planla aynı renkte olacak. Otomatik işlemlerin yanında manuel düzenleme seçeneğini tutmamızın gerekçesi, başarısız olabilecek durumlarda kullanıcıyı çıkmaza sokmamak.

Bir diğer karar da belgenin kaydedildikten sonra görünür kalmasıydı. Tarama işleminden sonra dosyanın nereye gittiği anlaşılmıyorsa kullanıcı açısından işlem tamamlanmamıştır. Bu nedenle belge arşivini baştan itibaren ürünün ana parçalarından biri olarak ele aldık.

