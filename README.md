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

Remote GitHub repoya gönderme

Bu klasörü yeni bir GitHub reposuna (SifaBardakta) göndermek için proje kökünde git başlatılmalı ve uzak repo eklenmelidir. Eğer `gh` CLI kullanıma hazırsa otomatik oluşturma yapılabilir. Aksi halde size gerekli push komutlarını vereceğim.
