defmodule MyModule do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]

    alias MyModule.Math, as: MyMath

    require Integer
    
    def gabiru(parameter1, parameter2) do
        inspect(MyMath.sum(parameter1, parameter2))
    end

    def is_even(number) do
        puts("The number #{number} is even? #{Integer.is_even(number)}")
    end

    defp inspect(parametro) do
        puts("Inspecionando o código...")
        puts(parametro)
        puts("Inspeção finalizada.")
    end
end