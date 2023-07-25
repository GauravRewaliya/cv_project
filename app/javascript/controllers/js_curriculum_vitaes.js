//= require controllers/repeater_dependent_date 
//= require controllers/select_picker 
//= require controllers/ckeditor 
//= require controllers/repeater
//= require controllers/cv_ProjectSelect 

$(document).ready(function() {
    supportive_skills_fix();  
    $('.repeater_experience').repeater();
    $('.repeater_proj').repeater();
    select_picker_refresh();
    ckeditor_load();
    
    new DataTable('#example',{
    columnDefs: [ {target: 0,visible: false}],
    order: [[0, 'desc']]
});

});