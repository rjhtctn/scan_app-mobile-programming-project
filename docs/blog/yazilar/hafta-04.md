# Çizimden Flutter ekranına: ilk çalışan parçalar

**Kapsanan hafta:** 26 Ekim–1 Kasım 2026  
**Yazar:** Bayram Külter

Tasarım dosyasındaki mavi bir butonun Flutter arayüzünde görünmesi ilerleme sayılabilir. Ancak butona basıldığında doğru ekranın açılması ve geri dönüşlerin tutarlı olması, prototipi gerçek bir uygulamaya yaklaştıran ilk eşiktir. Dördüncü hafta bu eşiğe odaklandık.

## Önce iskelet, sonra özellik

Bir Flutter uygulaması `main.dart` üzerinden başlar; arayüzün genel temasını, rotalarını ve ekran bileşenlerini ortak bir yapı içinde toplamak sonraki değişiklikleri kolaylaştırır. Bu nedenle ilk geliştirmeyi yalnızca görsel öğeler ekleyerek değil, projede ekranların nerede yaşayacağını belirleyerek yaptık.

Ana ekrandaki "Yeni tarama" eylemini kamera ekranına bağlamak, kullanıcı yolculuğunun ilk somut adımı oldu. Bu navigasyonun doğru kurulması, ileride fotoğrafı önizleme ve kırpmaya taşıyacak zincirin de temelini oluşturuyor.

## Kamera, sadece bir butondan ibaret değil

Yusuf'un kamera modülündeki ilk çalışma, cihazın kullanılabilir kameralarını sorgulayıp canlı önizlemeyi gösterebilen bir ekrandı. Çekim butonuna basıldığında fotoğraf alınabiliyordu. Bu, otomatik belge algılamayla aynı şey değil; yalnızca görüntünün uygulamaya giriş noktası.

Bir başka önemli karar da kamera işlemini arayüzden kavramsal olarak ayırmak. Kameranın hazır olmaması, kullanıcıdan izin beklemesi veya cihazda kamera bulunmaması gibi durumlar ileride ayrı ayrı ele alınmalı.

## Boş bir arşiv nasıl tasarlanır?

Bayram'ın veri yönetimi tarafındaki başlangıcı gerçek SQLite kayıtları değil, örnek belge kartlarıydı. Bu sayede arşiv ekranının düzeni, veri altyapısı tamamlanmadan görülebildi. Geliştirmede *örnek veri* kullanmak, kullanıcı arayüzünü arka plandaki kalıcı kayıt katmanından bağımsız ele almamızı sağladı.

Bu ayrımı korumak önemli: Ekranda belge kartı göstermek, dosyanın cihazda güvenli biçimde saklandığı anlamına gelmez. Kalıcı depolama ayrı bir geliştirme adımıdır.

## Bir sonraki tasarıma değil, bir sonraki karara

Dördüncü hafta sonunda elimizde Flutter iskeleti, ana ekran–kamera geçişi, temel kamera önizlemesi ve örnek belge kartları vardı. Kırpma, otomatik algılama ve PDF gibi ağır modüller henüz bu sürüme eklenmemişti.

İlk prototipin asıl değeri, çizimdeki bütün özellikleri sunması değil; **bir sonraki modülün yerleşeceği sağlam bir başlangıç noktası** sağlamasıydı.

## Ekranlar arasında veri taşımak

Bir belge tarayıcıda ekranlar yalnızca birbirine açılan sayfalardan ibaret değildir. Kamera fotoğrafı elde ettiğinde bu görüntünün yolu veya verisi önizlemeye, oradan da kırpma ekranına geçebilmelidir. İlk iskelette bu akışın tamamı henüz kurulmamış olsa da `Navigator` ile ekran geçişlerini baştan tasarlamak ileride eklenecek verilerin nasıl taşınacağına yönelik önemli bir başlangıçtı.

Bu yüzden ana ekran ile kamera ekranı arasındaki basit geçişi küçümsemiyoruz. Aynı uygulamanın içinde birkaç aşamanın peş peşe çalışabilmesi için ekrana ait durumun, dosya bilgisinin ve kullanıcı kararının doğru yerde yönetilmesi gerekir. Flutter'da `StatefulWidget` kullanımı, örneğin kameranın hazır olup olmadığı gibi zamanla değişen bilgilerin arayüze yansıtılması için gerekli bir mekanizma sunuyor.

Buradaki yaklaşım, her davranışı en baştan çözmeye çalışmak değil; sonraki geliştirmelerin ekleneceği sınırları görünür hâle getirmekti.

