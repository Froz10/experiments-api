# frozen_string_literal: true

json.experiments([{ value: @experiment.pluck(:button_color)[0], key: 'button_color' },
                  { value: @experiment.pluck(:price)[0], key: 'price' }])
