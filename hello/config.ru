# frozen_string_literal: true

run ->(_env) { [200, { 'Content-Type' => 'text/plain' }, StringIO.new("Hello World!\n")] }

require './hello'
run Sinatra::Application
