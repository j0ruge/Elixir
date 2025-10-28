defmodule MyModule.Enum do
  def first_element(list) do
    if length(list) == 0 do
      nil
    else
      hd(list)
    end
  end

  def other_elements(list) do
    unless length(list) == 0 do
      tl(list)
    end
  end
end
