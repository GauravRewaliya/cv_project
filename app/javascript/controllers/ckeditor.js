function ckeditor_load() {
  ckeditor_destroy();
  ckeditor_create();
}
function ckeditor_create(){
    document.querySelectorAll('.ckeditor_g').forEach(function(element) {

            CKEDITOR.replace(element,{removeButtons: '',
         toolbar:[ { name: 'document', items: ['Undo', 'Redo'] },
         { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat'] 
                },
                { name: 'paragraph', items: ['NumberedList', 'BulletedList'] },
                { name: 'tools', items: ['Maximize'] }
              ],uiColor: '#72caebb5;'});

            // CKEDITOR.replace(element);

          });
}
function ckeditor_destroy(){
    // destpoy instance
    for (const instanceName in CKEDITOR.instances) {
        const instance = CKEDITOR.instances[instanceName];
      instance.destroy()
  }
    // destroy remain element of same id
    document.querySelectorAll('.cke_chrome').forEach(function (e) {
        e.remove();
        });
}