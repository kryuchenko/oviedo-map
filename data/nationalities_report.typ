#set page(margin: 12mm, paper: "a4")
#set text(font: "Helvetica Neue", size: 8.5pt, lang: "ru")
#set par(leading: 0.5em)

#align(center)[#text(size: 16pt, weight: "bold")[Национальности по районам Овьедо]]
#v(4pt)

#text(size: 7.5pt, fill: luma(100))[
- *INE Censo Anual 2025* — tabla 66377 (данные по секциям censales, маппинг на районы через point-in-polygon)
- *INE 2022* — Padrón Continuo, tabla 3303.px (Россия по районам — точные данные за 2022)
- *Odina Sept 2025* — общегородские: RU 730, UA 1 136 (mioviedo.com)
- *Украина* — точные данные INE Censo 2025 по районам
- *Россия* — диапазон: мин (×2,5 от 2022) — макс (×6,0), при факте ×4,27 по городу (171→730)
]

#line(length: 100%, stroke: rgb(124, 58, 237))
#v(2pt)

#text(size: 12pt, weight: "bold", fill: rgb(91, 33, 182))[1. Постсоветские по районам (2025)]
#v(4pt)

#table(
  columns: (1fr, auto, auto, auto),
  align: (left, right, right, right),
  stroke: none,
  inset: (x: 5pt, y: 3pt),
  fill: (_, y) => if y == 0 { rgb(91, 33, 182) } else if calc.odd(y) { rgb(245, 243, 255) } else { white },
  table.header(
    text(fill: white, weight: "bold")[Район],
    text(fill: white, weight: "bold")[UA 2025],
    text(fill: white, weight: "bold")[RU (оценка)],
    text(fill: white, weight: "bold")[Всего (диап.)],
  ),
    [La Ciudá Naranco], [66], [52—90], [118—156],
  [El Cristo], [115], [18—42], [133—157],
  [Argañosa], [57], [48—81], [105—138],
  [Centro Norte], [58], [28—66], [86—124],
  [Ventanielles], [45], [29—55], [74—100],
  [Pumarín], [64], [18—42], [82—106],
  [La Corredoria], [41], [28—66], [69—107],
  [El Vallobín], [69], [8—18], [77—87],
  [Tenderina - Fozaneldi], [37], [25—43], [62—80],
  [Otero], [71], [0], [71],
  [Teatinos], [38], [15—36], [53—74],
  [Olivares], [42], [10—24], [52—66],
  [Monte Cerráu], [11], [28—50], [39—61],
  [La Florida], [25], [12—30], [37—55],
  [Centro Oeste], [15], [18—42], [33—57],
  [San Lázaro / San Llázaro], [15], [12—26], [27—41],
  [El Pontón de Vaqueros], [19], [10—24], [29—43],
  [Centro Este], [16], [10—24], [26—40],
  [Monxina - El Rancho], [16], [5—12], [21—28],
  [La Iría], [4], [8—20], [12—24],
  [Centro Sur], [15], [5—12], [20—27],
  [Buenavista], [17], [2—6], [19—23],
  [Antiguo], [6], [8—16], [14—22],
  [Parque de Invierno], [7], [5—12], [12—19],
  [Llatores], [13], [0], [13],
  [Les Campes], [0], [7—13], [7—13],
  [Pando], [1], [5—10], [6—11],
  [Veguín], [2], [2—4], [4—6],
  [Lloriana], [0], [2—6], [2—6],
  [La Manxoya], [0], [2—6], [2—6],
  [San Claudio / San Cloyo], [3], [0], [3],
  [Villaperi], [2], [0], [2],
  [Santa Mariña de Piedramuelle], [2], [0], [2],
  [Fitoria], [2], [0], [2],
  [Cerdeño], [2], [0], [2],
  [Colloto / Cualloto], [1], [0], [1],
  table.hline(stroke: 1.5pt + rgb(91, 33, 182)),
  [*ИТОГО*], [*897*], [*420—876*], [*1317—1773*],
)

#text(size: 7pt, fill: luma(100))[UA 2025 — точные данные INE Censo Anual. RU — оценка на основе INE 2022 (171 чел) × рост (Odina 2025: 730). Диапазон: ×2,5 (мин) — ×6,0 (макс), факт по городу ×4,27.]

#v(4pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  [
    #text(size: 9pt, weight: "bold", fill: rgb(124, 58, 237))[Рост по городу]
    #v(2pt)
    #table(
      columns: (auto, auto, auto, 1fr),
      align: (left, right, right, left),
      stroke: none, inset: (x: 4pt, y: 2.5pt),
      fill: (_, y) => if y == 0 { rgb(91, 33, 182) } else if calc.odd(y) { rgb(245, 243, 255) } else { white },
      text(fill: white, weight: "bold", size: 7.5pt)[Год], text(fill: white, weight: "bold", size: 7.5pt)[RU], text(fill: white, weight: "bold", size: 7.5pt)[UA], text(fill: white, weight: "bold", size: 7.5pt)[Источник],
      [INE 2022], [171], [355], text(size: 7pt)[Padrón 3303.px],
      [Odina 2024], [338], [890], text(size: 7pt)[Ayuntamiento],
      [03.2025], [611], [1 016], text(size: 7pt)[La Nueva España],
      [09.2025], [*730*], [*1 136*], text(size: 7pt)[mioviedo.com],
      [INE 2025], [—], [*982*], text(size: 7pt)[Censo Anual 66377],
      table.hline(stroke: 1pt + rgb(91, 33, 182)),
      [*Рост*], [*×4,3*], [*×2,8*], [],
    )
  ],
  [
    #text(size: 9pt, weight: "bold", fill: rgb(124, 58, 237))[СНГ — пров. Астурия (03005.px)]
    #v(2pt)
    #table(
      columns: (1fr, auto),
      align: (left, right),
      stroke: none, inset: (x: 4pt, y: 2.5pt),
      fill: (_, y) => if y == 0 { rgb(91, 33, 182) } else if calc.odd(y) { rgb(245, 243, 255) } else { white },
      text(fill: white, weight: "bold", size: 7.5pt)[Страна], text(fill: white, weight: "bold", size: 7.5pt)[Чел.],
      [Украина], [877],
      [Россия], [527],
      [Молдавия], [191],
      [Армения], [62],
      [Грузия], [34],
      [Беларусь], [26],
    )
  ],
)

#line(length: 100%, stroke: rgb(124, 58, 237))
#v(2pt)

#text(size: 12pt, weight: "bold", fill: rgb(91, 33, 182))[2. Балканы по районам (без Румынии)]
#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  [
    #text(size: 9pt, weight: "bold", fill: rgb(124, 58, 237))[Болгария по районам (INE 2022)]
    #v(2pt)
    #table(
      columns: (1fr, auto),
      align: (left, right),
      stroke: none, inset: (x: 4pt, y: 2.5pt),
      fill: (_, y) => if y == 0 { rgb(91, 33, 182) } else if calc.odd(y) { rgb(245, 243, 255) } else { white },
      text(fill: white, weight: "bold", size: 7.5pt)[Район], text(fill: white, weight: "bold", size: 7.5pt)[Чел.],
      [Otero], [11],
      [Argañosa], [11],
      [Pumarín], [10],
      [La Ciudá Naranco], [10],
      [Ventanielles], [9],
      [Teatinos], [8],
      [Centro Sur], [7],
      [Centro Norte], [6],
      [Tenderina - Fozaneldi], [5],
      [Llimanes], [5],
      [La Corredoria], [4],
      [San Lázaro / San Llázaro], [3],
      [La Iría], [3],
      [La Florida], [3],
      [El Pontón de Vaqueros], [3],
      [Parque de Invierno], [2],
      [El Vallobín], [2],
      [Veguín], [1],
      [Santa Mariña de Piedramuelle], [1],
      [Monxina - El Rancho], [1],
      [Llatores], [1],
      [El Cristo], [1],
      [Centro Oeste], [1],
      [Centro Este], [1],
      table.hline(stroke: 1pt + rgb(91, 33, 182)),
      [*ИТОГО*], [*109*],
    )
  ],
  [
    #text(size: 9pt, weight: "bold", fill: rgb(124, 58, 237))[Прочие — пров. Астурия]
    #v(2pt)
    #table(
      columns: (1fr, auto, auto),
      align: (left, right, right),
      stroke: none, inset: (x: 4pt, y: 2.5pt),
      fill: (_, y) => if y == 0 { rgb(91, 33, 182) } else if calc.odd(y) { rgb(245, 243, 255) } else { white },
      text(fill: white, weight: "bold", size: 7.5pt)[Страна], text(fill: white, weight: "bold", size: 7.5pt)[Астурия], text(fill: white, weight: "bold", size: 7.5pt)[~Овьедо],
      [Хорватия], [23], [~7],
      [Босния и Герц.], [23], [~7],
      [Сербия], [15], [~5],
      [Албания], [12], [~4],
      [Сев. Македония], [6], [~2],
      table.hline(stroke: 1pt + rgb(91, 33, 182)),
      [*Итого*], [*79*], [*~25*],
    )
    #v(4pt)
    #text(size: 7pt, fill: luma(120))[INE не выделяет эти национальности по секциям — слишком мало людей.]
  ],
)

#line(length: 100%, stroke: rgb(124, 58, 237))
#v(2pt)

#text(size: 12pt, weight: "bold", fill: rgb(91, 33, 182))[3. Румыния по районам (INE 2025)]
#v(4pt)

#table(
  columns: (1fr, auto),
  align: (left, right),
  stroke: none,
  inset: (x: 5pt, y: 2.5pt),
  fill: (_, y) => if y == 0 { rgb(91, 33, 182) } else if calc.odd(y) { rgb(245, 243, 255) } else { white },
  text(fill: white, weight: "bold")[Район], text(fill: white, weight: "bold")[Человек],
  [Argañosa], [205],
  [El Vallobín], [203],
  [Pumarín], [178],
  [La Ciudá Naranco], [157],
  [El Cristo], [126],
  [Teatinos], [121],
  [Centro Norte], [118],
  [Ventanielles], [102],
  [La Corredoria], [97],
  [Tenderina - Fozaneldi], [92],
  [Buenavista], [64],
  [Otero], [62],
  [Olivares], [55],
  [Centro Este], [50],
  [Monxina - El Rancho], [45],
  [Centro Sur], [42],
  [San Lázaro / San Llázaro], [40],
  [Monte Cerráu], [31],
  [El Pontón de Vaqueros], [28],
  [Centro Oeste], [26],
  [Santa Mariña de Piedramuelle], [25],
  [San Claudio / San Cloyo], [17],
  [Lloriana], [16],
  [Veguín], [15],
  [La Florida], [15],
  [Pando], [13],
  [Les Campes], [11],
  [Cerdeño], [11],
  [Antiguo], [10],
  [Villaperi], [8],
  [Parque de Invierno], [8],
  [La Iría], [8],
  [Fitoria], [8],
  [Llimanes], [6],
  [Colloto / Cualloto], [4],
  [Llatores], [3],
  [La Manxoya], [1],
  table.hline(stroke: 1.5pt + rgb(91, 33, 182)),
  [*ИТОГО (Овьедо)*], [*2021*],
)

#line(length: 100%, stroke: rgb(124, 58, 237))
#v(2pt)

#text(size: 12pt, weight: "bold", fill: rgb(91, 33, 182))[4. Топ-10 по скорости роста в Овьедо]
#text(size: 8pt)[ — оценка ~2018 → сентябрь 2025.]
#v(4pt)

#table(
  columns: (auto, 1fr, auto, auto, auto, auto),
  align: (center, left, right, right, right, right),
  stroke: none,
  inset: (x: 5pt, y: 3.5pt),
  fill: (_, y) => if y == 0 { rgb(91, 33, 182) } else if calc.odd(y) { rgb(245, 243, 255) } else { white },
  table.header(
    text(fill: white, weight: "bold")[\#],
    text(fill: white, weight: "bold")[Страна],
    text(fill: white, weight: "bold")[Ов ~2018],
    text(fill: white, weight: "bold")[Ов 2025],
    text(fill: white, weight: "bold")[Рост],
    text(fill: white, weight: "bold")[+чел.],
  ),
  [1], [*Россия*], [~116], [*730*], [*+529%*], [+614],
  [2], [Чили], [~103], [503], [+388%], [+400],
  [3], [*Колумбия*], [~948], [*3 915*], [*+313%*], [+2 967],
  [4], [*Украина*], [~323], [*1 136*], [*+252%*], [+813],
  [5], [Венесуэла], [~815], [2 471], [+203%], [+1 656],
  [6], [Аргентина], [~389], [583], [+50%], [+194],
  [7], [Куба], [~611], [883], [+45%], [+272],
  [8], [Италия], [~601], [833], [+39%], [+232],
  [9], [Парагвай], [~1 184], [1 425], [+20%], [+241],
  [10], [Сенегал], [~646], [757], [+17%], [+111],
)

#v(4pt)
#line(length: 100%, stroke: rgb(124, 58, 237))
#text(size: 9pt, weight: "bold", fill: rgb(124, 58, 237))[Методология]
#v(2pt)
#text(size: 7.5pt)[
1. *Украина* — точные данные INE Censo Anual 2025 (tabla 66377) по секциям censales → районы\
2. *Россия* — INE 2022 (точно: 171) → Odina 2025 (факт: 730). Диапазон по районам: ×2,5 — ×6,0\
3. *Румыния* — точные данные INE Censo 2025\
4. *«Otros Europa»* включает Италию (833), Россию (730), Португалию (432), Польшу (111), Болгарию и др.\
5. Секции censales (213 шт) маппированы на 37 районов через point-in-polygon\
6. Данные Овьедо 2025: INE Censo Anual + mioviedo.com / Odina (24 345 иностранцев, 106 стран)
]
