defmodule MyModule.Enum do
   def first_element([]), do: nil
   def first_element(list), do: hd(list)   
end