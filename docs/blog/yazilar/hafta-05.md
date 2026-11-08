# İlk prototipte doğru görsel hiyerarşiyi aramak

**Kapsanan hafta:** 2–8 Kasım 2026  
**Yazar:** Bayram Külter

İlk çalışan prototipte geliştirme bazen yeni bir özellik eklemek değil, mevcut ekranı daha anlaşılır hâle getirmektir. Beşinci haftada temel ekran akışını koruyarak **ana ekranın görsel düzenine ve prototipin kapsamına** odaklandık.

## Kullanıcının bakışı nereye gitmeli?

Ana ekranın birden fazla görevi var: Uygulamanın ne işe yaradığını anlatmak, tarama işlemini başlatmak ve daha önce oluşturulmuş içeriklere erişim sağlamak. Bunların aynı anda vurgulanması, kullanıcının ilk adımı seçmesini zorlaştırabilir.

Bu yüzden ana ekran üzerinde yaptığımız düzenlemelerde "Yeni tarama" eyleminin belirgin olması, belge kartlarının ise ikincil bilgi olarak okunabilmesi üzerinde durduk. Başlığın, logo kullanımının ve boşlukların tutarlılığı sonraki haftalarda ekran sayısı artarken de işe yarayacak.

## Prototip ile bitmiş ürün arasında görünür bir sınır

Bu aşamada ana ekran ve kamera modülü kaynak kodda bulunuyordu; belge kartları hâlâ örnek içerikle gösteriliyordu. Henüz PDF üretimi veya yerel veritabanı yoktu. Taslak tasarımda gördüğümüz bütün düğmelerin çalışır hâle gelmesini beklemek, geliştirme sırasını yanlış okumak olur.

Önce kullanıcıya hangi eylemleri sunacağımızı, sonra bu eylemlerin hangi teknik modüllere bağlanacağını ele almak daha kontrollü bir yol sağladı.

## Neden bu hafta yeni bir ağır modül eklemedik?

Kameradan gelen fotoğrafı güvenilir biçimde yönetmeden görüntü filtreleri veya PDF ekranları eklemek, birbiriyle bağlantısı eksik özelliklerin çoğalmasına yol açar. Bu yüzden sıradaki teknik hedef olarak kamera hataları, çekim sonrası önizleme ve geçici fotoğraf saklama akışını belirledik.

Bu haftanın çıktısı büyük bir özellik listesi değil; **ilk prototipin hangi parçalarının mevcut olduğunun, hangilerinin geliştirme sırasını beklediğinin netleşmesi** oldu.

## Örnek veriler, gerçek arayüz kararlarını nasıl etkiler?

İlk prototipte belge kartları örnek verilerle gösteriliyordu. Bu yöntem, henüz SQLite veya PDF işlevi tamamlanmamışken liste satırlarının ne kadar yer kapladığını, metinlerin nasıl hizalandığını ve “Yeni tarama” eyleminin nerede konumlanacağını görmemizi sağladı. Ancak örnek içerik üzerinden verilen kararların sınırlı olduğunu da unutmamak gerekir.

Gerçek belgelerin adları çok daha uzun olabilir. Bazı belgelerin sayfa sayısı birden fazladır; bazı dosyalarda görsel önizleme üretilemeyebilir. İleride veriler gerçek dosyalardan geldiğinde bu durumlara uygun kart tasarımına ihtiyaç duyulacak. Yani bugünkü kartların amacı son veritabanı modelini kanıtlamak değil, olası kullanıcı deneyimini erken aşamada değerlendirmek.

## Arayüz kararlarını takip eden teknik borç

Bir butonun ekrana yerleşmesi, butona bağlanacak işlevin tamamlandığı anlamına gelmez. Fotoğraf çekme, saklama, kırpma ve paylaşma gibi işler zaman içinde farklı modüllere taşınacak. Bunların hepsinin tek widget içinde büyümesine izin vermemek için ekranların görevini sınırlı tutmak istiyoruz.

Beşinci hafta bu nedenle yalnızca görünümün iyileştirilmesiyle ilgili değildi; tasarım kararlarının gerçek özelliklere dönüşürken sürdürülebilir kalmasına da odaklandık.

