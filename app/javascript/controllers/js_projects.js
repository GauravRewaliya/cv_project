
function updateEndDate()
{ 
  if(inprogress_id.checked != true)
  end_date_id.value = end_date_id.min = start_date_id.value
}
 //  check box disabled , blank
 function endDateDisable()
 {
   if( inprogress_id.checked == true)
   {
    end_date_id.value = ""
   }
   else
   {
     updateEndDate()
   }
 } 
 function checkboxTogle()
 {
   inprogress_id.checked = false;
 }

 $(document).ready(function() {
    if(end_date_id.value =='')
        inprogress_id.checked = true;
    endDateDisable();
    
    new DataTable('.data_table_gr',{
      columnDefs: [
        // {target: 2,visible: false}, // domain visible
        {target: 3,visible: false},
        // {target: 4,visible: false}, // core_skill visible
        {target: 5,visible: false}
      ]
    });
  });