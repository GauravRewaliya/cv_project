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

function pdf_download(load_button){
  var download_container = $(load_button).closest('.pdf-button-container');
  var processLink = download_container.find('.cv-ajax-button');
  var cvId = $(load_button).data('cv-id');

  processLink.addClass('hidden');
  download_container.addClass('loader');

  $.ajax({
    url: '/pdf_html_req/' + cvId,
    method: 'POST',
    xhrFields: {
      responseType: 'blob'
    },
    success: function(blob) {
      var link = document.createElement('a');
      link.href = window.URL.createObjectURL(blob);
      link.text='download Now';
      link.download = 'downloadCv.pdf';
      $(download_container).append(link);
      download_container.removeClass('loader');
    }
  });
}
function doc_download(load_button){
  var download_container = $(load_button).closest('.doc-button-container');
  var processLink = download_container.find('.cv-ajax-button');
  var cvId = $(load_button).data('cv-id');

  processLink.addClass('hidden');
  download_container.addClass('loader');
  
  $.ajax({
    url: '/docx_html_req/' + cvId,
    method: 'POST',
    xhrFields: {
      responseType: 'blob'
    },
    success: function(blob) {
      var link = document.createElement('a');
      link.href = window.URL.createObjectURL(blob);
      link.text='download Now';
      link.download = 'downloadCv.doc';
      $(download_container).append(link);
      download_container.removeClass('loader');
    }
  });
}