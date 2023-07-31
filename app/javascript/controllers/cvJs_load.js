
$(document).ready(function() {
    supportive_skills_fix();  
    $('.repeater_experience').repeater();
    $('.repeater_proj').repeater();
    // $('.selectpick').selectpicker(
    //     { liveSearch: true}
    //   );
    select_picker_refresh();
    ckeditor_load();
});