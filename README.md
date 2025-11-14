# SifaBardakta

Bu proje Rasa ile oluşturulmuş bir sohbet botu projesidir.

İçerik:
- `config.yml`, `domain.yml`, `endpoints.yml`, `credentials.yml` - Rasa konfigürasyon dosyaları
- `data/` - nlu, stories ve rules verileri
- `actions/` - özel action'lar
- `models/` - eğitim modelleri

Başlarken

1. Sanal ortam oluşturun ve paketleri yükleyin (ör. Python 3.10+ gerektirir):

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt  # yoksa önce requirements.txt oluşturun
```

2. Rasa sunucusunu çalıştırın:

```powershell
rasa run actions &
rasa run --enable-api
```

## Railway ile Deployment

Bu proje **Railway.app** üzerinde kolayca deploy edilebilir. Yapılandırma dosyaları zaten yerinde:

- `Procfile` — Rasa model server (web) ve action server (actions) processlerini tanımlar
- `runtime.txt` — Python 3.10.10 versiyonunu belirtir
- `requirements.txt` — Tüm bağımlılıkları listeler
- `build.sh` — Build sırasında modeli eğitir (gerekirse)

### Railway Deployment Adımları:

1. **GitHub Repo**: Projeyi GitHub'a push et (✅ zaten yapıldı: https://github.com/oguzgk/SifaBardakta)

2. **Railway Hesabı**: https://railway.app/ adresine git ve GitHub ile oturum aç.

3. **Yeni Proje Oluştur**:
   - Railway dashboard'da "New Project" → "Deploy from GitHub repo" seçin
   - `oguzgk/SifaBardakta` reposunu seçin
   - Railway otomatik olarak `Procfile` ve `runtime.txt`'yi algılayacak

4. **Environment Variables (Opsiyonel)**:
   - Railway dashboard'da "Variables" bölümünde gerekli ortam değişkenlerini ekleyebilirsin (örn. API anahtarları, dış servis URL'leri)

5. **Deploy**: Railway deploy işlemi başlatacak — model training ve paket kurulumu otomatik yapılacak.

6. **URL**: Deploy tamamlandıktan sonra Railway sana bir public URL verecek (ör. `https://sifabardakta-production.up.railway.app`)

### Sorun Giderme:

- **Model eğitimi uzun sürerse**: `build.sh` timeout atabilir. Bu durumda modeli önceden eğit ve `models/` klasörünü depoya ekle (`git add models/` ve commit et).
- **Action server başlamıyorsa**: `endpoints.yml` içinde action_endpoint etkinleştirildiğinden emin ol (✅ zaten yapıldı).
- **Memory hatası**: Railway'in ücretsiz planında sınırlı kaynak vardır. `models/` klasörü büyükse azalt veya optimize et.

### API Kullanımı:

Deploy ettikten sonra sohbet API'sine şu şekilde istek gönderebilirsin:

```bash
curl -X POST https://sifabardakta-production.up.railway.app/webhooks/rest/webhook \
  -H "Content-Type: application/json" \
  -d '{"message": "hello"}'
```

---

## Remote GitHub repoya gönderme

Bu klasörü yeni bir GitHub reposuna (SifaBardakta) göndermek için iki seçenek vardır:

1) GitHub web arayüzünden manuel:
	- GitHub hesabınızda yeni bir repo oluşturun adı: SifaBardakta, "Initialize with a README" seçeneğini kapatın.
	- Aşağıdaki komutları proje kökünde çalıştırın (PowerShell):

```powershell
git remote add origin https://github.com/<KULLANICI_ADINIZ>/SifaBardakta.git
git branch -M main
git push -u origin main
```

2) `gh` CLI yüklü ve yetkilendirilmişse (isteğe bağlı):

```powershell
gh repo create SifaBardakta --public --source=. --remote=origin --push
```

Yerel repoyu zaten başlattım ve ilk commit'i yaptım. `gh` CLI sisteminizde bulunmuyordu, bu yüzden yukarıdaki manuel adımları takip etmenizi öneririm.
