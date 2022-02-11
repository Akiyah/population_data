# frozen_string_literal: true

PARAMS = [
  {
    name: '男女別人口（各年10月1日現在）- 総人口，日本人人口（平成12年～27年）',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000013168604&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00200524&tstat=000000090001&cycle=0&tclass1=000000090004&tclass2=000001051180&stat_infid=000013168604&cycle_facet=tclass1%3Acycle&tclass3val=0',
    sheets: {}
  }, {
    name: '年齢（各歳），男女別人口（各年10月1日現在）－総人口（大正9年～平成12年）',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000000090264&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00200524&tstat=000000090001&cycle=0&tclass1=000000090004&tclass2=000000090005&stat_infid=000000090264&cycle_facet=tclass1%3Acycle&tclass3val=0',
    sheets: {
      '大正9年～昭和15年' => [
        { year: 1920, rows: 13..98, columns: %w[D E] },
        { year: 1921, rows: 13..98, columns: %w[G H] },
        { year: 1922, rows: 13..98, columns: %w[J K] },
        { year: 1923, rows: 13..98, columns: %w[M N] },
        { year: 1924, rows: 13..98, columns: %w[P Q] },
        { year: 1925, rows: 13..98, columns: %w[S T] },
        { year: 1926, rows: 13..98, columns: %w[V W] },
        { year: 1927, rows: 13..98, columns: %w[Y Z] },
        { year: 1928, rows: 13..98, columns: %w[AB AC] },
        { year: 1929, rows: 13..98, columns: %w[AE AF] },
        { year: 1930, rows: 13..98, columns: %w[AH AI] },
        { year: 1931, rows: 13..98, columns: %w[AK AL] },
        { year: 1932, rows: 13..98, columns: %w[AN AO] },
        { year: 1933, rows: 13..98, columns: %w[AQ AR] },
        { year: 1934, rows: 13..98, columns: %w[AT AU] },
        { year: 1935, rows: 13..98, columns: %w[AW AX] },
        { year: 1936, rows: 13..98, columns: %w[AZ BA] },
        { year: 1937, rows: 13..98, columns: %w[BC BD] },
        { year: 1938, rows: 13..98, columns: %w[BF BG] },
        { year: 1939, rows: 13..98, columns: %w[BI BJ] },
        { year: 1940, rows: 13..98, columns: %w[BL BM] }
      ],
      '昭和19年～29年' => [
        { year: 1944, rows: 13..98, columns: %w[D E] },
        { year: 1945, rows: 13..99, columns: %w[I J] },
        { year: 1946, rows: 13..99, columns: %w[L M] },
        { year: 1947, rows: 13..98, columns: %w[Q R] },
        { year: 1948, rows: 13..98, columns: %w[T U] },
        { year: 1949, rows: 13..98, columns: %w[W X] },
        { year: 1950, rows: 13..98, columns: %w[Z AA] },
        { year: 1951, rows: 13..93, columns: %w[AE AF] },
        { year: 1952, rows: 13..92, columns: %w[AJ AK] },
        { year: 1953, rows: 13..93, columns: %w[AO AP] },
        { year: 1954, rows: 13..93, columns: %w[AR AS] }
      ],
      '昭和30年～46年' => [
        { year: 1955, rows: 13..98, columns: %w[D E] },
        { year: 1956, rows: 13..98, columns: %w[G H] },
        { year: 1957, rows: 13..98, columns: %w[J K] },
        { year: 1958, rows: 13..98, columns: %w[M N] },
        { year: 1959, rows: 13..98, columns: %w[P Q] },
        { year: 1960, rows: 13..98, columns: %w[S T] },
        { year: 1961, rows: 13..98, columns: %w[V W] },
        { year: 1962, rows: 13..98, columns: %w[Y Z] },
        { year: 1963, rows: 13..98, columns: %w[AB AC] },
        { year: 1964, rows: 13..98, columns: %w[AE AF] },
        { year: 1965, rows: 13..98, columns: %w[AH AI] },
        { year: 1966, rows: 13..98, columns: %w[AK AL] },
        { year: 1967, rows: 13..98, columns: %w[AN AO] },
        { year: 1968, rows: 13..98, columns: %w[AQ AR] },
        { year: 1969, rows: 13..98, columns: %w[AT AU] },
        { year: 1970, rows: 13..98, columns: %w[AW AX] },
        { year: 1971, rows: 13..98, columns: %w[AZ BA] }
      ],
      '昭和47年～54年' => [],
      '昭和55年～平成12年' => []
    }
  }
].freeze
