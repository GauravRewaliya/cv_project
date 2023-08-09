function select_picker_refresh()
{
    setTimeout(() =>{ 
                $('.selectpick').selectpicker({ 
                    liveSearch: true,
                    size: 5
                });
                $('.selectpick').selectpicker('render');
                $('.selectpick').selectpicker('refresh');
                    }, "100");
}
  