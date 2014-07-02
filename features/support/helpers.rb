def wait_for(&block)
  Timeout.timeout(Capybara.default_wait_time) do
    loop until yield
  end
end

def wait_for_javascript(expression)
  wait_for { page.evaluate_script(expression) }
end

def wait_for_ajax
  wait_for_javascript("window.jQuery ? jQuery.active == 0 : true")
end
