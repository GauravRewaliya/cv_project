$(document).ready(function() {
  new DataTable('.data_table_gr',{
    columnDefs: [
      {target: 0,visible: false}, // update_at
      {target: 2,visible: false},
      // {target: 6,visible: false}, // coreskill
      // {target: 7,visible: false}
    ],
    order: [[0, 'desc']]
  });
});