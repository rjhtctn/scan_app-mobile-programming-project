# Akıllı Belge Tarayıcı — 7. hafta (16–22 Kasım 2026)

Bu klasör Flutter uygulamasıdır. Üst dizindeki `docs/is-planlari` içinde 12 haftalık takvim bulunur.

## Uygulanan özellikler (22 Kasım itibarıyla)
- Flutter ana ekranı, gezinme ve örnek belge kartları
- Android cihaz kamerası, önizleme, manuel fotoğraf çekimi, flaş kontrolü
- Fotoğrafı yeniden çekme veya kullanma
- Dört köşesi sürüklenebilir manuel kırpma arayüzü
- Seçilen dörtgenin şeffaf PNG maskesiyle kırpılması ve önizlenmesi
- Cihazda taslakların saklanması ve tekrar açılması
- Geçersiz dörtgen seçimlerinin kontrolü, PNG dosya imzası denetimi ve hata durumlarının ele alınması

**Henüz yok:** otomatik sınır algılama, OpenCV ile perspektif düzeltme, filtreler,
OCR, PDF oluşturma, SQLite, paylaşma ve gelişmiş belge yönetimi. Bunlar sonraki
haftaların iş planlarında yer alıyor. Kırpma sonucu perspektif düzeltilmiş bir
sayfa değil; dörtgen dışı pikseller şeffaftır.

## Çalıştırma

Flutter SDK 3.14 veya üzeri Dart sürümünü destekleyen uygun bir Flutter kurulumu
ile bu `src` dizininde:

```powershell
flutter pub get
flutter analyze
flutter test
flutter run
```

Fiziksel Android cihazda kamera erişimini test edin. Kamera özelliği masaüstü
ortamında veya yalnızca Flutter widget testiyle doğrulanamaz.
