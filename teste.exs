defmodule Hello do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]
    def gabiru do
        inspect("Olá, GabirU!")
    end

    def inspect(parametro) do
        puts("Inspecionando o código...")
        puts(parametro)
        puts("Inspeção finalizada.")
    end
end