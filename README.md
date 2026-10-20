# Akıllı Belge Tarayıcı (Smart Document Scanner)

**Ders:** Mobile Programming (2026–2027 Güz)  
**Ekip:** 3 Kişi  
**Proje Başlangıcı:** 5 Ekim 2026  
**Vize Prototipi:** 2 Kasım 2026 öncesi  
**Final Teslimi:** 21 Aralık 2026  

---

## Proje Hakkında

**Akıllı Belge Tarayıcı**, telefon kamerasıyla belge tarayabilen, çekilen görüntüleri kırpıp perspektifini düzeltebilen, okunabilirliği artırmak için görüntü filtreleri uygulayabilen ve tek veya çok sayfalı PDF dosyaları oluşturup cihaz üzerinde (SQLite ve yerel depolama ile) saklayabilen **Flutter** tabanlı bir mobil uygulamadır.

Uygulama, **veri mahremiyeti (privacy-first)** odaklı tasarlanmıştır; belge tarama, görüntü işleme (OpenCV), PDF oluşturma ve saklama işlemlerinin tamamı internet bağlantısına veya uzak sunucuya ihtiyaç duymadan doğrudan cihaz üzerinde gerçekleştirilir.

---

## Proje Ekibi ve Organizasyon

| Ad Soyad | Öğrenci No | Görev / Rol | GitHub |
| :--- | :---: | :--- | :--- |
| **Rojhat Çetin** | 1306220111 | Proje Yöneticisi (Yürütücü) ve Arayüz Geliştirme | [github.com/rjhtctn](https://github.com/rjhtctn) |
| **Yusuf Emre Gözcü** | 1306220090 | Kamera ve Görüntü İşleme | [github.com/yusufemreai51](https://github.com/yusufemreai51) |
| **Bayram Külter** | 1306220123 | Veri Yönetimi, PDF ve Halkla İlişkiler (Tanıtım) | [github.com/Bayraminadresi](https://github.com/Bayraminadresi) |

---

## Proje Klasör Yapısı

```text
Akilli-Belge-Tarayici/
│
├── README.md
│
├── docs/
│   ├── Proje_Kapsami_ve_Is_Plani.md
│   │
│   ├── is-planlari/
│   │   ├── Hafta_01.md
│   │   ├── Hafta_02.md
│   │   ├── Hafta_03.md
│   │   ├── Hafta_04.md
│   │   ├── Hafta_05.md
│   │   ├── Hafta_06.md
│   │   ├── Hafta_07.md
│   │   ├── Hafta_08.md
│   │   ├── Hafta_09.md
│   │   ├── Hafta_10.md
│   │   ├── Hafta_11.md
│   │   └── Hafta_12.md
│   │
│   └── ilerleme-raporlari/
│       ├── Hafta_01.md
│       ├── Hafta_02.md
│       └── Hafta_03.md
│
└── tasarimlar/
    └── README.md
```

---

## Dokümantasyon Bağlantıları

### Ana Proje Dokümanı
- [**Proje Başlığı, Kapsam ve İş Planı Dokümanı**](docs/Proje_Kapsami_ve_Is_Plani.md)

### Haftalık İş Planları
| Hafta | Tarih Aralığı | Konu Başlığı | İş Planı |
| :---: | :--- | :--- | :--- |
| **1. Hafta** | 5–11 Ekim 2026 | Proje Fikrinin ve Kapsamın Belirlenmesi | [Hafta_01.md](docs/is-planlari/Hafta_01.md) |
| **2. Hafta** | 12–18 Ekim 2026 | Teknoloji Seçimi ve Ekip Organizasyonu | [Hafta_02.md](docs/is-planlari/Hafta_02.md) |
| **3. Hafta** | 19–25 Ekim 2026 | Taslak Arayüz Tasarımı ve Prototip Hazırlıkları | [Hafta_03.md](docs/is-planlari/Hafta_03.md) |
| **4. Hafta** | 26 Ekim–1 Kasım 2026 | İlk Flutter Prototipinin Oluşturulması | [Hafta_04.md](docs/is-planlari/Hafta_04.md) |
| **5. Hafta** | 2–8 Kasım 2026 | Vize Prototipi ve Değerlendirme | [Hafta_05.md](docs/is-planlari/Hafta_05.md) |
| **6. Hafta** | 9–15 Kasım 2026 | Kamera Modülünün Geliştirilmesi | [Hafta_06.md](docs/is-planlari/Hafta_06.md) |
| **7. Hafta** | 16–22 Kasım 2026 | Manuel Belge Kırpma | [Hafta_07.md](docs/is-planlari/Hafta_07.md) |
| **8. Hafta** | 23–29 Kasım 2026 | Otomatik Belge Algılama ve Perspektif Düzeltme | [Hafta_08.md](docs/is-planlari/Hafta_08.md) |
| **9. Hafta** | 30 Kasım–6 Aralık 2026 | Görüntü Filtreleri ve Tek Sayfalı PDF | [Hafta_09.md](docs/is-planlari/Hafta_09.md) |
| **10. Hafta** | 7–13 Aralık 2026 | Çok Sayfalı PDF ve SQLite | [Hafta_10.md](docs/is-planlari/Hafta_10.md) |
| **11. Hafta** | 14–20 Aralık 2026 | Belge Yönetimi, Entegrasyon ve Test | [Hafta_11.md](docs/is-planlari/Hafta_11.md) |
| **12. Hafta** | 21 Aralık 2026 | Final Kontrolü, Sunum ve Teslim | [Hafta_12.md](docs/is-planlari/Hafta_12.md) |

### Haftalık İlerleme Raporları
| Hafta | Tarih Aralığı | Konu Başlığı | İlerleme Raporu |
| :---: | :--- | :--- | :--- |
| **1. Hafta** | 5–11 Ekim 2026 | Proje Fikrinin Belirlenmesi | [Hafta_01.md](docs/ilerleme-raporlari/Hafta_01.md) |
| **2. Hafta** | 12–18 Ekim 2026 | Teknoloji Seçimi ve Ekip Organizasyonu | [Hafta_02.md](docs/ilerleme-raporlari/Hafta_02.md) |
| **3. Hafta** | 19–25 Ekim 2026 | Taslak Arayüz Tasarımı ve Prototip Hazırlıkları | [Hafta_03.md](docs/ilerleme-raporlari/Hafta_03.md) |

---

## Kullanılan Teknolojiler

- **Geliştirme Çatısı & Dil:** Flutter & Dart
- **Kamera:** `camera` paketi
- **Görüntü İşleme:** OpenCV entegrasyonu (Belge kenarı algılama, Canny, perspektif düzeltme, filtreler)
- **Yerel Veritabanı:** SQLite (`sqflite`)
- **Belge Üretimi:** PDF oluşturma kütüphanesi (`pdf` / `printing`)
- **Sürüm Kontrolü:** Git & GitHub
