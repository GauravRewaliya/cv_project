//= require controllers/repeater_dependent_date 
//= require controllers/select_picker 
//= require controllers/ckeditor 
//= require controllers/repeater
//= require controllers/cv_ProjectSelect 
//= require rails-ujs

var storedcoreSkills =[];
var storedsupportiveSkills =[];
var storedDomains =[];

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
// storeSelectOption();
try{
    document.getElementById('project_repeater_add').addEventListener('click', function() { 
       repeater_refresh();
      });
}
catch(e)
{

}
});
// function storeSelectOption()
// {
//     var allOptions = $('.supportive_skill_selector')[0].options;
//     for (var i = 0; i < allOptions.length; i++) {
//         var skillId = allOptions[i].value;
//         var skillText = allOptions[i].text;
//         storedsupportiveSkills.push({ id: skillId, text: skillText });
//     }
    
//     var allOptions = $('.core_skill_selector')[0].options;
//     for (var i = 0; i < allOptions.length; i++) {
//     var skillId = allOptions[i].value;
//     var skillText = allOptions[i].text;
//     storedcoreSkills.push({ id: skillId, text: skillText });
//   }
  
//   var allOptions = $('.domain_selector')[0].options;
//   for (var i = 0; i < allOptions.length; i++) {
//     var skillId = allOptions[i].value;
//     var skillText = allOptions[i].text;
//     storedDomains.push({ id: skillId, text: skillText });
// }
// }