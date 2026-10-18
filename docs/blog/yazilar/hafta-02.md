# Bir mobil tarayıcının mimarisini nasıl kurguladık?

**Kapsanan hafta:** 12–18 Ekim 2026  
**Yazar:** Bayram Külter

Belge tarama uygulaması dışarıdan tek bir iş yapıyormuş gibi görünür: Fotoğraf çekmek. Oysa kullanıcı kamerayı açtığı andan kaydedilmiş dosyayı yeniden görüntülediği ana kadar farklı sorumluluklar devreye girer. İkinci haftada asıl sorumuz, **bu sorumlulukların birbirine karışmadan nasıl yönetileceğiydi**.

## Flutter'ı hangi problem için seçtik?

Flutter ve Dart'ı arayüzün kurulması, ekranlar arası geçişler ve kullanıcı etkileşimlerinin geliştirilmesi için seçtik. Kamera, görüntü işleme ve dosya saklama gibi işlevlerin hepsini tek bir ekranda gerçekleştirmek yerine uygulamanın bunları bir arada sunmasını istiyoruz.

Flutter tarafında temel hedef, farklı ekranlarda aynı davranış dilini korumak: Kamera ekranında yapılan çekim, önizlemede onaylanmalı; ardından kırpma ekranına aktarılmalı ve sonucun nerede saklandığı kullanıcı için açık olmalı.

## Kamera, görüntü işleme ve arayüz aynı şey değil

`camera` paketi, Android kameraya erişimi ve fotoğraf yakalamayı sağlayacak katman olarak belirlendi. Görüntünün dört köşesini otomatik bulma ve perspektifini düzeltme gibi daha ileri işlemler için OpenCV değerlendirmeye alındı.

Buradaki önemli ayrım, **kenar bulmak** ile **görüntü yakalamak** arasındadır. Kamera fotoğrafı üretir; görüntü işleme bu fotoğraftaki belge alanını tanımaya ve dönüştürmeye çalışır. Kullanıcı arayüzü ise son kararın kullanıcıda kalmasını sağlar.

İlk aşama için manuel köşe seçimini de planda tutmamızın nedeni bu. Otomatik algılama her ışık ve zemin koşulunda doğru sonuç veremeyebilir. Kullanıcıya elle düzeltme seçeneği bırakmak ürünün dayanıklılığını artırır.

## Dosyanın kendisi ile dosyanın bilgisi

Yerel saklama için iki ayrı veri türü öngördük. Birincisi gerçek görsel veya PDF dosyaları; ikincisi belgenin adı, oluşturulma tarihi, yolu ve sayfa sayısı gibi bilgiler. Bir dosyanın içeriği ile onun *metadata*'sını aynı yerde ve aynı yöntemle saklamak zorunda değiliz.

Bu nedenle dosyaların cihazın uygulama alanında, belge üst verilerinin ise ilerleyen aşamada SQLite ile yönetilmesini planladık. Bu yapı arama, listeleme, yeniden adlandırma ve silme gibi işlemler için temel oluşturacak.

## Sorumlulukları modüllere çevirmek

Mimari tercihlerin ekip organizasyonuna da yansıması gerekiyordu. Rojhat arayüz ve koordinasyona; Yusuf kamera ve görüntü işlemeye; Bayram yerel veri, PDF ve proje tanıtımına odaklanacak şekilde görevler ayrıldı.

Bu aşamada paketleri üretim ortamında çalıştırdığımızı iddia etmiyoruz: İkinci hafta, **mimari seçeneklerin araştırıldığı ve kararların belgelendiği** dönemdi. Tasarımın sonraki adımı ise bu teknik ayrımı kullanıcının anlayacağı ekranlara dönüştürmekti.

## Görüntüyü işlerken performans neden önemli?

Telefonun üzerinde işleme yapmayı hedeflemek, cihazın belleğine ve işlem gücüne ilişkin sınırları da beraberinde getiriyor. Yüksek çözünürlüklü bir görüntünün arayüzde gösterilmesi ile işlenmesi aynı maliyete sahip değil. Kullanıcı kaydedilecek belgeyi işlerken arayüzün yanıt vermeye devam etmesi, ileride ele alınacak önemli bir tasarım ölçütü.

Bu nedenle ilk teknik planı tüm özellikleri aynı anda geliştirecek şekilde hazırlamadık. Önce kameradan görüntüyü almak, ardından dört nokta seçimini kurmak, sonra otomatik algılama ve PDF gibi işlemleri eklemek daha anlaşılır bir geliştirme sırası sunuyor. Bu sıra aynı zamanda hataların hangi modülden kaynaklandığını ayırt etmeyi kolaylaştırıyor.

