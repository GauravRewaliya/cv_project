function select_picker_refresh()
{
    setTimeout(() =>{ 
                $('.selectpick').selectpicker({ liveSearch: true});
                $('.selectpick').selectpicker('render');
                $('.selectpick').selectpicker('refresh');
                    }, "100");
}
  