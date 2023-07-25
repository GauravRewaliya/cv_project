
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
});
