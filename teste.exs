defmodule MyModule do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]

    alias MyModule.Math, as: MyMath
    
    def gabiru do
        inspect(MyMath.sum(1,2))
    end

    def inspect(parametro) do
        puts("Inspecionando o código...")
        puts(parametro)
        puts("Inspeção finalizada.")
    end
end