# STAJ22001
# Klinik Değerlendirme, Skorlama ve Karar Destek Modülleri
**Yaz Stajı Mühendislik Projesi / Hastane Bilgi Yönetim Sistemi (HBYS - MedCard) Entegrasyonu**

---

## 1. Proje Özeti ve Kapsamı

Bu mühendislik projesi; sağlık bilişimi alanında faaliyet gösteren kurumsal bir Hastane Bilgi Yönetim Sistemi (HBYS / MedCard) altyapısına eklemlenen **3 kritik klinik karar destek ve değerlendirme formunun** uçtan uca mimari tasarımını, ilişkisel veritabanı kurgusunu ve kullanıcı arayüzü (VCL) implementasyonunu kapsamaktadır.

Geliştirilen sistem; hardcoded (kod içine gömülü) form yapıları yerine **meta-veri ve dinamik parametre odaklı** bir veri mimarisi üzerinde inşa edilmiştir. Sağlık personelinin hastaya dair klinik ve laboratuvar bulgularını sisteme girmesiyle birlikte, uluslararası standartlara sahip algoritmalar arka planda otomatik puanlama yapar, risk durumunu belirler ve bu verileri ilişkisel bir modelde arşivler.

---

## 2. Sistem Mimarisi ve Entegrasyon Süreci

### Ana Sistem Bağımlılığı ve Buton Entegrasyonu
Kurumsal sağlık bilgi sistemlerinde, hastaların takibi merkezi bir **"Patient List" (Hasta Takip Listesi)** arayüzü üzerinden yönetilmektedir. Bu ana ekran; hastanın kabulünden taburculuğuna kadar olan tüm medikal seyrini koordine eden omurgadır.

Staj kapsamında geliştirilen modüller, bu ana sisteme şu adımlarla entegre edilmiştir:
1. **Dinamik Hasta Bağlamı (Context Transfer):** Hasta listesi arayüzüne ilgili değerlendirme formlarını başlatan 3 adet tetikleyici buton entegre edilmiştir.
2. **Oturum ve Protokol Eşleşmesi:** Kullanıcı bir hastayı seçip ilgili butona bastığında, hastanın benzersiz kimlik bilgisi (Bağlantı ID / `com_id`) parametre olarak alınır ve oluşturulan form bu bağlam ile ayağa kalkar.
3. **Modüler Tasarım:** Formlar çekirdek sistemden bağımsız, yeniden kullanılabilir ve sistem güncellemelerinden etkilenmeyecek modüler VCL bileşenleri olarak geliştirilmiştir.

---

## 3. Geliştirilen Klinik Modüller ve İş Mantığı

### 3.1. Töllner Sepsis Değerlendirme Formu (Neonatal Sepsis Score)
* **Klinik Amacı:** Yenidoğan yoğun bakım ünitelerinde sepsis şüphesi bulunan bebeklerin klinik ve laboratuvar bulgularını standardize bir metotla skorlayarak erken tanı konulmasını sağlamak.
* **Değerlendirilen Parametreler:**
  * **Klinik Parametreler:** Cilt rengi değişimi, periferik dolaşım bozukluğu, hipotoni, bradikardi, apne, respiratuar distres, hepatomegali (>4 cm), gastrointestinal semptomlar.
  * **Laboratuvar Parametreleri:** Lökosit sayısı (lökositoz/lökopeni), nötrofil sola kayma, trombositopeni ve kan gazı metabolik asidoz düzeyi (pH sınırları).
* **Hesaplama Algoritması ve Karar Mantığı:**
  * Formdaki her parametre klinik ağırlığına göre puanlanır (0, 1, 2, 3 veya 4 puan).
  * Dinamik toplam skor hesaplanarak şu karar destek çıktıları üretilir:
    * **Skor < 5:** `Sepsis Yok`
    * **Skor 5 - 10:** `Sepsis Olasılığı` (Yakın takip ve ileri tetkik gereksinimi)
    * **Skor > 10:** `Sepsis Tanısı` (Acil klinik müdahale ve antibiyoterapi gereksinimi)

### 3.2. Modifiye Aldrete Skoru Formu (MAS)
* **Klinik Amacı:** Cerrahi operasyon veya anestezi sonrası hastaların derlenme odasındaki (PACU) fizyolojik fonksiyonlarını takip ederek servise nakil veya taburculuk uygunluğunu belirlemek.
* **Değerlendirilen Parametreler:**
  * Bilinç Düzeyi, Motor Aktivite, Solunum Kapasitesi, SpO2 (Oksijen Saturasyonu), Kan Basıncı Kararlılığı ve Nabız Değerleri.
* **Hesaplama Algoritması:**
  * Vital parametreler operasyon öncesi bazal değerlerle karşılaştırmalı olarak 0, 1 veya 2 puan üzerinden değerlendirilir.
  * Toplam skor hastanın derlenme durumunu belirler.

### 3.3. Edinburgh Postpartum Depresyon Ölçeği (EPDS)
* **Klinik Amacı:** Doğum yapmış annelerde doğum sonrası depresyon riskini erken aşamada taramak.
* **Metodolojik Yaklaşım:**
  * 10 soruluk psikometrik ölçek arayüze aktarılmıştır.
  * **Ters ve Düz Puanlama:** Soruların doğası gereği bazı maddeler pozitiften negatife (0'dan 3'e), bazı maddeler ise doğrudan semptom sıklığına göre (3'ten 0'a) puanlanır. Bu mantık veritabanı parametre tablosundaki `VALUE` değerleri üzerinden dinamik olarak yönetilir.

---

## 4. Veritabanı Mimarisi (Oracle PL/SQL)

Veritabanı yapısı **3 Temel İlke** üzerine kurulmuştur:

### 1. Master-Detail İlişkisel Yapı
Her form için veriler iki seviyeli tablolar halinde tutulur:
* **Master Tablolar (`BD_MC_*`):** Formun hasta bağlantısını (`com_id`) ve genel oturumunu tutar.
* **Detail Tablolar (`BD_MC_*_DET`):** Her klinik ölçümün yapıldığı anı (`ctime`, `process_time`), işlemi yapan personeli (`cuser`, `nurse_id`), tekil kriter değerlerini ve hesaplanan nihai skoru tutar.
* **Referential Integrity:** Detail tablolar, Master tablolara `ON DELETE CASCADE` yabancı anahtarı (Foreign Key) ile bağlıdır; veri bütünlüğü garanti altına alınmıştır.

### 2. Dinamik Parametre Yönetimi (Metadata-Driven UI)
Form seçenekleri kod içine sabitlenmemiş (hardcoded yazılmamış), kurumsal `MC_PARAMETERS` ve `MC_PARAMETERS_DETAIL` tablolarına bağlanmıştır:
* Master parametre tablosunda ölçek başlıkları ve soru metinleri yer alır.
* Detail tablosunda ise her soruya ait yanıt alternatifleri, aktiflik durumu (`IS_ACTIVE`) ve sayısal puan karşılıkları (`VALUE`) saklanır.
* Bu sayede klinik ölçeklerin puanlama kuralı değiştiğinde Delphi kodunu yeniden derlemeye gerek kalmadan sadece veritabanı satırı güncellenerek sistem uyarlanabilir.

### 3. Sequence ve Anahtar Yönetimi
Tüm Master ve Detail tabloları için Oracle Sequence nesneleri (`BD_MC_*_SEQ`) tanımlanmış; birincil anahtar üretimleri otomatikleştirilmiştir.

---

## 5. Dizin Yapısı

```text
├── database/
│   ├── 01_schema.sql             # Tablolar, birincil anahtarlar, yabancı anahtarlar ve kısıtlar
│   ├── 02_parameters_seed.sql    # Dinamik form soruları, seçenekleri ve puan matrisi
│   └── 03_sequences.sql          # Tablo bazlı Oracle Sequence tanımları
├── src/                          # Delphi RAD Studio form kaynak kodları
│   ├── BDMCTollnerSepsis.pas     # Töllner Sepsis iş mantığı ve hesaplama algoritmaları
│   ├── BDMCTollnerSepsis.dfm     # Töllner Sepsis VCL görsel arayüz tanımı
│   ├── BDMCModifiedScore.pas     # Modifiye Skor iş mantığı
│   ├── BDMCModifiedScore.dfm     # Modifiye Skor görsel arayüz tanımı
│   ├── BDMCEdinburghDepScale.pas # Edinburgh Ölçeği iş mantığı ve veri eşleme
│   └── BDMCEdinburghDepScale.dfm # Edinburgh Ölçeği görsel arayüz tanımı
├── .gitignore                    # Delphi geçici derleme artıklarını filtreleyen kural seti
└── README.md                     # Ana proje sunum ve dokümantasyon belgesi
```

---

## 6. Projenin Çalışma Mantığı ve Yaşam Döngüsü

Modüller, bağımsız çalışan tekil pencereler yerine **kurumsal bir ana omurgaya (Patient List) bağlı çalışan modüler bir mimari** ile kurgulanmıştır:

```text
[ Hasta Takip Listesi Ekranı (Patient List) ]
       │
       │  (Kullanıcı aktif hastayı seçer ve butona tıklar)
       ▼
[ Form Tetikleme & Context Transfer ] ──> Aktarılan Parametre: ActivePatientID (com_id)
       │
       ├──> 1. Veritabanından Dinamik Parametrelerin Yüklenmesi (MC_PARAMETERS)
       ├──> 2. Varsa Hastanın Geçmiş Değerlendirmelerinin TDBGrid'e Getirilmesi
       │
       ▼
[ Klinik Değerlendirme & Hesaplama ]
       │
       ├──> Sağlık personeli kriterleri işaretler (ComboBox / RadioGroup)
       ├──> Arka plandaki Pascal skorlama algoritması eşzamanlı tetiklenir
       └──> Toplam puan ve risk seviyesi (ör. "Sepsis Olasılığı") ekranda anlık güncellenir
       │
       ▼
[ Kayıt ve Arşivleme ]
       │
       ├──> Sequence üzerinden benzersiz ID üretimi (NEXTVAL)
       └──> Master ve Detail tablolarına eşzamanlı kayıt (Transaction / Commit)
```

### Adım Adım İşleyiş Süreci:

1. **Dinamik Hasta Bağlamı (Context Transfer):** 
   * Kullanıcı ana ekrandaki listeden hastayı seçip ilgili buton aksiyonunu çalıştırdığında, hastanın benzersiz kimlik/protokol numarası (`com_id`) parametre olarak alınır.
2. **Metadata ile Arayüzün Beslenmesi:** 
   * Form ayağa kalkarken şıklar ve soru metinleri kod içerisine statik olarak yazılmaz; `MC_PARAMETERS` ve `MC_PARAMETERS_DETAIL` tablolarından dinamik okunarak bileşenlere doldurulur.
3. **Anlık Skorlama Algoritması:** 
   * Her seçim işleminde form üzerindeki olay dinleyiciler (`OnChange` / `OnClick`) tetiklenir; seçimlerin veritabanındaki sayısal `VALUE` karşılıkları toplanarak toplam skor hesaplanır.
4. **Veri Bütünlüğü ve Arşivleme:** 
   * Kaydet butonuna basıldığında ilgili Oracle Sequence nesnesi üzerinden yeni bir ID tahsis edilir; oturum açan personel (`cuser`) ve işlem tarihi (`process_time`) damgalanarak Master-Detail ilişkisi içinde güvenli biçimde kaydedilir.

---

## 7. Geliştirme ve Kurulum Rehberi

Projeyi yerel bir ortamda ayağa kaldırmak veya incelemek için izlenmesi gereken adımlar:

### 1. Veritabanı Kurulumu (Oracle PL/SQL)
Sırasıyla `database/` dizinindeki script'ler Oracle SQL Developer veya PL/SQL Developer üzerinde yetkili bir şema ile çalıştırılır:

```sql
@database/01_schema.sql
@database/02_parameters_seed.sql
@database/03_sequences.sql
```

### 2. Form Kodlarının Projeye Dahil Edilmesi (RAD Studio)
1. Embarcadero RAD Studio (Delphi) ortamında mevcut HBYS projesi veya yeni bir VCL Forms Application projesi açılır.
2. **Project Manager** üzerinden projeye sağ tıklanarak `Add...` seçeneğiyle `src/` klasöründeki `.pas` ve `.dfm` dosyaları projeye eklenir.
3. Formun çağrılacağı ana ünite (örneğin `frmPatientList`) üzerinde ilgili form referansları `uses` bloğuna eklenir:
   ```pascal
   uses BDMCTollnerSepsis, BDMCModifiedScore, BDMCEdinburghDepScale;
   ```
4. İlgili butonun `OnClick` olayında form hasta parametresiyle örneklendirilir:
   ```pascal
   procedure TfrmPatientList.btnTollnerSepsisClick(Sender: TObject);
   var
     frmSepsis: TfrmBDMCTollnerSepsis;
   begin
     frmSepsis := TfrmBDMCTollnerSepsis.Create(Self, SelectedPatientComId);
     try
       frmSepsis.ShowModal;
     finally
       frmSepsis.Free;
     end;
   end;
   ```

---

## 8. Mühendislik Çıktıları ve Yetkinlik Kazanımları

* **Büyük Ölçekli Kurumsal Kod Tabanı Adaptasyonu:** 
  * Mevcut bir kurumsal mimarinin dinamikleri analiz edilmiş, sisteme zarar vermeden modüler ve genişletilebilir (extensible) bileşenler eklemlenmiştir.
* **Sağlık Bilişimi ve Klinik Karar Destek:** 
  * Tıbbi değerlendirme kılavuzları (Töllner Sepsis, Aldrete, EPDS) yazılım ortamında matematiksel kurallara ve karar destek matrislerine dönüştürülmüştür.
* **İlişkisel Veritabanı Tasarımı:** 
  * Oracle PL/SQL ortamında Master-Detail, Sequence ve dinamik parametre tabloları ile normalizasyon kurallarına tam uyumlu bir şema kurgulanmıştır.
* **Modern Object Pascal & VCL:** 
  * RAD Studio ile olay yönelimli (event-driven) form geliştirme, kullanıcı doğrulama (validation) mekanizmaları ve form yaşam döngüsü yönetimi uygulanmıştır.

---

## 9. Proje ve Staj Bilgileri

* **Geliştirici:** Bennu Dal
* **Rol:** Yazılım Mühendisliği Stajyeri
* **Firma / Lokasyon:** Bizmed (Sinerji Bilişim) — YTÜ Yıldız Teknopark
* **Kullanılan Teknolojiler:** Embarcadero RAD Studio (Delphi), Oracle PL/SQL, VCL Form Mimarisi
