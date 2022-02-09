# frozen_string_literal: true

PARAMS = [
  {
    name: '男女別人口（各年10月1日現在）- 総人口，日本人人口（平成12年～27年）',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000013168604&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00200524&tstat=000000090001&cycle=0&tclass1=000000090004&tclass2=000001051180&stat_infid=000013168604&cycle_facet=tclass1%3Acycle&tclass3val=0',
    ranges: []
  }, {
    name: '年齢（各歳），男女別人口（各年10月1日現在）－総人口（大正9年～平成12年）',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000000090264&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00200524&tstat=000000090001&cycle=0&tclass1=000000090004&tclass2=000000090005&stat_infid=000000090264&cycle_facet=tclass1%3Acycle&tclass3val=0',
    ranges: [
      { sheet: '大正9年～昭和15年', year: 1920, rows: 13..98, columns: %w[D E] },
      { sheet: '大正9年～昭和15年', year: 1921, rows: 13..98, columns: %w[G H] },
      { sheet: '大正9年～昭和15年', year: 1922, rows: 13..98, columns: %w[J K] },
      { sheet: '大正9年～昭和15年', year: 1923, rows: 13..98, columns: %w[M N] },
      { sheet: '大正9年～昭和15年', year: 1924, rows: 13..98, columns: %w[P Q] },
      { sheet: '大正9年～昭和15年', year: 1925, rows: 13..98, columns: %w[S T] },
      { sheet: '大正9年～昭和15年', year: 1926, rows: 13..98, columns: %w[V W] },
      { sheet: '大正9年～昭和15年', year: 1927, rows: 13..98, columns: %w[Y Z] },
      { sheet: '大正9年～昭和15年', year: 1928, rows: 13..98, columns: %w[AB AC] },
      { sheet: '大正9年～昭和15年', year: 1929, rows: 13..98, columns: %w[AE AF] },
      { sheet: '大正9年～昭和15年', year: 1930, rows: 13..98, columns: %w[AH AI] },
      { sheet: '大正9年～昭和15年', year: 1931, rows: 13..98, columns: %w[AK AL] },
      { sheet: '大正9年～昭和15年', year: 1932, rows: 13..98, columns: %w[AN AO] },
      { sheet: '大正9年～昭和15年', year: 1933, rows: 13..98, columns: %w[AQ AR] },
      { sheet: '大正9年～昭和15年', year: 1934, rows: 13..98, columns: %w[AT AU] },
      { sheet: '大正9年～昭和15年', year: 1935, rows: 13..98, columns: %w[AW AX] },
      { sheet: '大正9年～昭和15年', year: 1936, rows: 13..98, columns: %w[AZ BA] },
      { sheet: '大正9年～昭和15年', year: 1937, rows: 13..98, columns: %w[BC BD] },
      { sheet: '大正9年～昭和15年', year: 1938, rows: 13..98, columns: %w[BF BG] },
      { sheet: '大正9年～昭和15年', year: 1939, rows: 13..98, columns: %w[BI BJ] },
      { sheet: '大正9年～昭和15年', year: 1940, rows: 13..98, columns: %w[BL BM] }
    ]
  }
].freeze
