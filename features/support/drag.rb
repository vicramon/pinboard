%w[card text image].each do |item|
  define_method "drag_new_#{item}" do
    find(".board_tools .new_#{item}").drag_to(find("section#board"))
  end
end
