//define class start_date , end_date ,inprogress_checkbox

///// update date
function updateEndDate(curr_obj)    //:start_date =>
{ 
  d = curr_obj.closest("[data-repeater-item]");
  inprogress_id = $(d).find('.inprogress_checkbox')[0];
  start_date_id = $(d).find('.start_date')[0];
  end_date_id = $(d).find('.end_date')[0];
  if(inprogress_id.checked != true)
  end_date_id.value = end_date_id.min = start_date_id.value
}
//  check box disabled , blank
function endDateDisable(curr_obj)
{
  d = curr_obj.closest("[data-repeater-item]");
  inprogress_id = $(d).find('.inprogress_checkbox')[0];
  start_date_id = $(d).find('.start_date')[0];
  end_date_id = $(d).find('.end_date')[0];
  if( inprogress_id.checked == true)
  {
    end_date_id.value = ""
  }
  else
  {
    updateEndDate(curr_obj)
  }
} 
function checkboxTogle(curr_obj)    //:end_date ==>
  {  
    d = curr_obj.closest("[data-repeater-item]");
    inprogress_id = $(d).find('.inprogress_checkbox')[0];
    inprogress_id.checked = false;
  }


    // loading
    $(document).ready(function() {
                
        // check the checkbox if end_date is null
        document.querySelectorAll('.end_date').forEach( e => { 
          if(e.value == '')
          {
              d = e.closest("[data-repeater-item]");
              inprogress_id = $(d).find('.inprogress_checkbox')[0];
              inprogress_id.checked = true;
          }
        });

      });

      