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

function pdf_download(load_button)
{
  var download_container = $(load_button).closest('.pdf-button-container');
  var processLink = download_container.find('.cv-ajax-button');
  var cvId = $(load_button).data('cv-id');
  $.ajax({
    url: '/pdf_download_req/' + cvId,
    method: 'POST',
      xhrFields: {
            responseType: 'blob'
          },
          success: function(blob) {
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            // link.text='download Now';
            link.innerHTML = '<span class="cv-ajax-button material-symbols-outlined" style="color: rebeccapurple;">picture_as_pdf</span>';
            link.download = 'downloadCv.pdf';
            $(download_container).append(link);
            download_container.removeClass('loader');
          }
  });
}
function pdf_preload(load_button){
  var download_container = $(load_button).closest('.pdf-button-container');
  var processLink = download_container.find('.cv-ajax-button');
  var cvId = $(load_button).data('cv-id');

  processLink.addClass('hidden');
  download_container.addClass('loader');
  $.ajax({
    url: '/pdf_html_req/' + cvId,
    method: 'POST',
    success: function(response) {
      console.log("in process");
      pollForPDFStatus(cvId , load_button );
    }
  });
}
function pollForPDFStatus(cvId , load_button ) {
  const interval = setInterval(function() {
    $.post(`/pdf_status/${cvId}`, function(response) {
      if (response.status === 'ready') {
        clearInterval(interval);
        pdf_download(load_button);
        console.log("printed");
      }
    });
  }, 3000); // Poll every 3 seconds
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