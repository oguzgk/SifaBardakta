# Şifa Bardakta

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
---

## Tüm Hakları Şifa Bardakta Uygulamasına Aittir


