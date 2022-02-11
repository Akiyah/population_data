# frozen_string_literal: true

PARAMS = [
  {
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
      '昭和47年～54年' => [
        { year: 1972, rows: 13..98, columns: %w[D E] },
        { year: 1973, rows: 13..98, columns: %w[G H] },
        { year: 1974, rows: 13..98, columns: %w[J K] },
        { year: 1975, rows: 13..98, columns: %w[M N] },
        { year: 1976, rows: 13..98, columns: %w[P Q] },
        { year: 1977, rows: 13..98, columns: %w[S T] },
        { year: 1978, rows: 13..98, columns: %w[V W] },
        { year: 1979, rows: 13..98, columns: %w[Y Z] }
      ],
      '昭和55年～平成12年' => [
        { year: 1980, rows: 13..103, columns: %w[D E] },
        { year: 1981, rows: 13..103, columns: %w[G H] },
        { year: 1982, rows: 13..103, columns: %w[J K] },
        { year: 1983, rows: 13..103, columns: %w[M N] },
        { year: 1984, rows: 13..103, columns: %w[P Q] },
        { year: 1985, rows: 13..103, columns: %w[S T] },
        { year: 1986, rows: 13..103, columns: %w[V W] },
        { year: 1987, rows: 13..103, columns: %w[Y Z] },
        { year: 1988, rows: 13..103, columns: %w[AB AC] },
        { year: 1989, rows: 13..103, columns: %w[AE AF] },
        { year: 1990, rows: 13..103, columns: %w[AH AI] },
        { year: 1991, rows: 13..103, columns: %w[AK AL] },
        { year: 1992, rows: 13..103, columns: %w[AN AO] },
        { year: 1993, rows: 13..103, columns: %w[AQ AR] },
        { year: 1994, rows: 13..103, columns: %w[AT AU] },
        { year: 1995, rows: 13..103, columns: %w[AW AX] },
        { year: 1996, rows: 13..103, columns: %w[AZ BA] },
        { year: 1997, rows: 13..103, columns: %w[BC BD] },
        { year: 1998, rows: 13..103, columns: %w[BF BG] },
        { year: 1999, rows: 13..103, columns: %w[BI BJ] },
        { year: 2000, rows: 13..103, columns: %w[BL BM] }
      ]
    }
  }, {
    name: '男女別人口（各年10月1日現在）- 総人口，日本人人口（平成12年～27年）',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000013168604&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00200524&tstat=000000090001&cycle=0&tclass1=000000090004&tclass2=000001051180&stat_infid=000013168604&cycle_facet=tclass1%3Acycle&tclass3val=0',
    sheets: {
      '第4表　総人口' => [
        { year: 2000, rows: (14..103).to_a + [109], columns: %w[D E] },
        { year: 2001, rows: (14..103).to_a + [109], columns: %w[G H] },
        { year: 2002, rows: (14..103).to_a + [109], columns: %w[J K] },
        { year: 2003, rows: (14..103).to_a + [109], columns: %w[M N] },
        { year: 2004, rows: (14..103).to_a + [109], columns: %w[P Q] },
        { year: 2005, rows: 14..114, columns: %w[S T] },
        { year: 2006, rows: 14..114, columns: %w[V W] },
        { year: 2007, rows: 14..114, columns: %w[Y Z] },
        { year: 2008, rows: 14..114, columns: %w[AB AC] },
        { year: 2009, rows: 14..114, columns: %w[AE AF] },
        { year: 2010, rows: 14..114, columns: %w[AH AI] },
        { year: 2011, rows: 14..114, columns: %w[AK AL] },
        { year: 2012, rows: 14..114, columns: %w[AN AO] },
        { year: 2013, rows: 14..114, columns: %w[AQ AR] },
        { year: 2014, rows: 14..114, columns: %w[AT AU] },
        { year: 2015, rows: 14..114, columns: %w[AW AX] }
      ]
    }
  }, {
    name: '年齢（各歳），男女別人口及び人口性比－総人口，日本人人口(平成28年10月1日現在)',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000031560310&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&query=%E5%B9%B4%E9%BD%A2%EF%BC%88%E5%90%84%E6%AD%B3%EF%BC%89%EF%BC%8C%E7%94%B7%E5%A5%B3%E5%88%A5%E4%BA%BA%E5%8F%A3&sort=year_month%20asc&layout=dataset&bunya_l=02&cycle=7&stat_infid=000031560310&metadata=1&data=1',
    sheets: {
      '第１表' => [
        { year: 2016, rows: (20..69).to_a + (92..142).to_a, columns: %w[K L] }
      ]
    }
  }, {
    name: '年齢（各歳），男女別人口及び人口性比－総人口，日本人人口(平成29年10月1日現在)',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000031690314&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&query=%E5%B9%B4%E9%BD%A2%EF%BC%88%E5%90%84%E6%AD%B3%EF%BC%89%EF%BC%8C%E7%94%B7%E5%A5%B3%E5%88%A5%E4%BA%BA%E5%8F%A3&sort=year_month%20asc&layout=dataset&bunya_l=02&cycle=7&stat_infid=000031690314&metadata=1&data=1',
    sheets: {
      '第１表' => [
        { year: 2017, rows: (20..69).to_a + (92..142).to_a, columns: %w[K L] }
      ]
    }
  }, {
    name: '年齢（各歳），男女別人口及び人口性比－総人口，日本人人口(平成30年10月1日現在)',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000031807138&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&query=%E5%B9%B4%E9%BD%A2%EF%BC%88%E5%90%84%E6%AD%B3%EF%BC%89%EF%BC%8C%E7%94%B7%E5%A5%B3%E5%88%A5%E4%BA%BA%E5%8F%A3&sort=year_month%20asc&layout=dataset&bunya_l=02&cycle=7&stat_infid=000031807138&metadata=1&data=1',
    sheets: {
      '第１表' => [
        { year: 2018, rows: (20..69).to_a + (92..142).to_a, columns: %w[K L] }
      ]
    }
  }, {
    name: '年齢（各歳），男女別人口及び人口性比－総人口，日本人人口(2019年10月1日現在)',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000031921670&fileKind=0',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&query=%E5%B9%B4%E9%BD%A2%EF%BC%88%E5%90%84%E6%AD%B3%EF%BC%89%EF%BC%8C%E7%94%B7%E5%A5%B3%E5%88%A5%E4%BA%BA%E5%8F%A3&sort=year_month%20asc&layout=dataset&bunya_l=02&cycle=7&stat_infid=000031921670&metadata=1&data=1',
    sheets: {
      '第１表' => [
        { year: 2019, rows: (20..69).to_a + (92..142).to_a, columns: %w[K L] }
      ]
    }
  }, {
    name: '年齢（各歳），男女別人口－総人口，日本人人口(2020年10月1日現在)',
    excel_url: 'https://www.e-stat.go.jp/stat-search/file-download?statInfId=000032153669&fileKind=4',
    stat_url: 'https://www.e-stat.go.jp/stat-search/files?page=1&query=%E5%B9%B4%E9%BD%A2%EF%BC%88%E5%90%84%E6%AD%B3%EF%BC%89%EF%BC%8C%E7%94%B7%E5%A5%B3%E5%88%A5%E4%BA%BA%E5%8F%A3&sort=year_month%20asc&layout=dataset&bunya_l=02&cycle=7&stat_infid=000032153669&metadata=1&data=1',
    sheets: {
      '第１表' => [
        { year: 2020, rows: (18..67).to_a + (90..140).to_a, columns: [5, 6] }
      ]
    }
  }
].freeze
