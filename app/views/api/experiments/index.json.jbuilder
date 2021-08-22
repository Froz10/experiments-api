json.experiments([{value: @experiments.pluck(:button_color)[0], key: "button_color"}, 
                  {value: @experiments.pluck(:price)[0], key: "price"}])
