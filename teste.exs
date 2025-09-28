defmodule MyModule do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]

    alias MyModule.Math, as: MyMath

    require Integer
    
    def gabiru do
        inspect(MyMath.sum(1,2))
    end

    def is_even(number) do
        puts("The number #{number} is even? #{Integer.is_even(number)}")
    end

    def inspect(parametro) do
        puts("Inspecionando o código...")
        puts(parametro)
        puts("Inspeção finalizada.")
    end
end