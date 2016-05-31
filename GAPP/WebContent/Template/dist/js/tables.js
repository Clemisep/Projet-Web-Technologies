var filtersConfig = {
  base_path: '',
  col_1: 'select',
  col_2: 'select',
  col_3: 'select',
  alternate_rows: true,
  rows_counter: true,
  btn_reset: true,
  loader: true,
  mark_active_columns: true,
  highlight_keywords: true,
  col_number_format: [
    null, null, 'US',
    'US', 'US', 'US',
    'US', 'US', 'US'
  ],
  custom_options: {
    cols: [3],
    texts: [
      [
        '0 - 25 000',
        '100 000 - 1 500 000'
      ]
    ],
    values: [
      [
        '>0 && <=25000',
        '>100000 && <=1500000'
      ]
    ],
    sorts: [false]
  },
  col_widths: [
    '150px', '100px', '100px',
    '70px', '70px', '70px',
    '70px', '60px', '60px'
  ],
  extensions: [{
    name: 'sort',
    images_path: 'https://koalyptus.github.io/TableFilter/tablefilter/style/themes/'
  }]
};

var tf = new TableFilter('demo', filtersConfig);
tf.init();