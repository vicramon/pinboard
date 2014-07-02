def click_submit
  first("input[type=submit]").click
  wait_for_ajax
end
