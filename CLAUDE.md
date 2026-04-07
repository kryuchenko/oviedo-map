# Oviedo Map — Правила проекта

## Язык и стиль статей

- Статьи пишутся на **русском языке**
- Стиль: **Wikipedia GA (Good Article)** + **вайб Lurkmore** — энциклопедическая точность с живым, саркастичным языком
- Каждое фактическое утверждение **ОБЯЗАТЕЛЬНО** подкреплено ссылкой `<sup><a href="#refN">[N]</a></sup>`
- Мнения/оценки/сарказм — без ссылок (это авторская позиция)
- В конце каждой статьи — блок `<div class="references">` с пронумерованным списком источников
- Слово «рента» НЕ ИСПОЛЬЗОВАТЬ для доходов — русскоязычный читатель поймёт как «стоимость аренды». Писать: **«средний доход»**, **«доход домохозяйства»**

## Геокодирование и координаты

- Координаты достопримечательностей берутся ТОЛЬКО через геокодирование (Nominatim, Google, OSM) или из достоверных источников (Wikipedia, официальные сайты)
- **НИКОГДА** не вводить координаты вручную «от балды»
- После получения координат — ОБЯЗАТЕЛЬНО проверить принадлежность к району через `geo_helpers.py: find_district_for_point()`
- Если Nominatim не находит объект — искать координаты в Wikipedia (часто есть в инфобоксе) или через Perplexity
- Если объект не попадает в ожидаемый район — НЕ подгонять координаты, а перенести POI в правильный район (displaced_pois.json)

## Привязка POI к районам

- У нас есть шейпы (полигоны) всех 57 районов в `data/districts_polygons.json`
- Любой POI привязывается к району через point-in-polygon проверку
- Если POI на границе или Nominatim даёт координаты «рядом но не внутри» — проверяем по Wikipedia/картам, в каком районе объект реально находится
- Консолидированная база всех POI: `data/all_pois_verified.json`

## Источники данных

### Демография (население, иностранцы по континентам)
- **Padrón Municipal 2024** — Odina/Ayuntamiento de Oviedo
- Файл: `data/demographics_barrios.json`
- Первоисточник: `data/odina_extranjeros_2024.xlsx`

### Доходы
- **Agencia Tributaria, IRPF** — данные по почтовым индексам
- Файл: `data/income_data.json`
- Источник: La Voz de Asturias (статьи 2023, 2025)

### Достопримечательности
- Perplexity Research → геокодирование → проверка в полигоне
- Файлы: `data/research_*.json`

### Secciones censales (INE)
- **187 секций** по всему Овьедо с полными шейпами (полигонами)
- Источник: INE API Features (`Secciones_2024`)
- Файл: `data/secciones_censales_oviedo.geojson`
- Код секции (CUSEC) привязывается к данным по доходам из INE Atlas de distribución de renta
- Подрайоны (Prado de la Vega, La Carisa и др.) **НЕ ИМЕЮТ шейпов** в публичных источниках — только точки в OSM
- Ayuntamiento de Oviedo **не публикует** open data по границам barrios

## Процесс обработки каждого района

Для каждого района выполняется полный цикл:

1. **Perplexity поиск на испанском** — `barrio [NAME] Oviedo historia monumentos lugares interés`
2. **Сбор POI** — достопримечательности, церкви, парки, школы, проблемные точки
3. **Геокодирование** — Nominatim или Wikipedia координаты (НИКОГДА вручную)
4. **Проверка в полигоне** — `find_district_for_point()`, если не попал — displaced
5. **Написание/дополнение статьи** — стиль Wiki GA + Lurkmore
6. **Сноски** — каждое фактическое утверждение `<sup><a href="#refN">[N]</a></sup>`
7. **Блок источников** — `<div class="references">` с пронумерованным списком
8. **Оценка района** — вердикт с рейтингом из 10

## Структура HTML-файлов районов

Каждый файл `districts/*.html`:
1. Самодостаточный HTML с встроенными CSS-стилями
2. У каждого района — уникальная цветовая тема
3. Структура:
   - `.header` — название, подзаголовок (ёмкий и с юмором), badge типа района
   - `.content` — основной текст с h2/h3, списками, info-боксами
   - `.stats-grid` — демографические данные в сетке
   - `.verdict` — вердикт с рейтингом из 10
   - `.references` — список источников с URL

## Система оценок районов (из 10)

- **9-10** — топ: жить отлично, всё на месте (Antiguo, исторический центр)
- **8-8.5** — очень хорошо: парки, инфра, безопасно, дороговато (Centro Oeste, Centro Norte)
- **7-7.5** — хорошо: есть плюсы, есть минусы, в целом норм (Centro Sur, Centro Este, El Cristo, La Florida)
- **6-6.5** — средне: жить можно, но есть заметные проблемы (Buenavista, San Lázaro)
- **5-5.5** — ниже среднего: дёшево, но репутация и среда так себе (Pumarín, Ventanielles, La Corredoria)
- **4 и ниже** — хардкор: специфическое место, не для всех (Tenderina)

Оценка — субъективная, авторская позиция, без ссылки.

### Снипет rating-grid (обязателен в каждой статье перед вердиктом)

```html
<div class="rating-grid">
    <div class="rating-item"><span>Жильё</span><span class="rating-score">...</span></div>
    <div class="rating-item"><span>Безопасность</span><span class="rating-score">...</span></div>
    <div class="rating-item"><span>Транспорт</span><span class="rating-score">...</span></div>
    <div class="rating-item"><span>Инфраструктура</span><span class="rating-score">...</span></div>
    <div class="rating-item"><span>Атмосфера</span><span class="rating-score">...</span></div>
    <div class="rating-item"><span>Для семей</span><span class="rating-score">...</span></div>
</div>
```

CSS для rating-grid (включить в `<style>` каждого файла):
```css
.rating-grid {
    display: grid; grid-template-columns: 1fr 1fr;
    gap: 10px; margin: 15px 0;
}
.rating-item {
    display: flex; justify-content: space-between;
    padding: 8px 12px; background: #333; border-radius: 4px;
}
.rating-score { font-weight: bold; color: [theme-accent]; }
@media (max-width: 600px) { .rating-grid { grid-template-columns: 1fr; } }
```

Значения — короткие ёмкие фразы: «Дёшево», «Норм», «Ад», «Топ», «Тихо», «Пустыня», «Постапок лайт» и т.п.

## Работа с существующими статьями

- **НЕ ПЕРЕЗАПИСЫВАТЬ** богатые статьи (Ventanielles, Tenderina, La Ciuda Naranco, Teatinos, La Corredoria) — только **дополнять**
- Перед записью — проверить `git show HEAD:districts/FILE.html | wc -l` — если >100 строк, значит это не стаб
- Стабы (~84 строки) можно перезаписывать полностью

## Файловая структура

```
data/
  districts_polygons.json    — полигоны 57 районов
  demographics_barrios.json  — демография всех районов
  income_data.json           — доходы по почтовым индексам
  all_pois_verified.json     — консолидированная база POI
  displaced_pois.json        — POI, вытесненные в правильные районы
  research_*.json            — данные исследования по районам
  geo_helpers.py             — утилиты: point-in-polygon, geocoding
  sources_index.json         — индекс всех источников
districts/
  *.html                     — статьи по районам (57 файлов)
index.html                   — главная карта (Leaflet)
```
