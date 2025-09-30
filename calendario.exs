defmodule MeuModulo.Calendario do
    def data_atual do
        Date.utc_today()
    end

    def abreviacao_dia_semana2(dia_semana) do
        case dia_semana do
            :Domingo -> "Dom"
            :Segunda -> "Seg"
            :Terca -> "Ter"
            :Quarta -> "Qua"
            :Quinta -> "Qui"
            :Sexta -> "Sex"
            :Sabado -> "Sab"
            _ -> "Dia inválido"
        end
    end

    def abreviacao_dia_semana3(dia_semana) do
        cond do
            dia_semana == :Domingo -> "Dom"
            dia_semana == :Segunda -> "Seg"
            dia_semana == :Terca -> "Ter"
            dia_semana == :Quarta -> "Qua"
            dia_semana == :Quinta -> "Qui"
            dia_semana == :Sexta -> "Sex"
            dia_semana == :Sabado -> "Sab"
            true -> "Dia inválido"
        end
    end


    def abreviacao_dia_semana4(:Segunda), do: "Seg"
    def abreviacao_dia_semana4(:Terca), do: "Ter"
    def abreviacao_dia_semana4(:Quarta), do: "Qua"
    def abreviacao_dia_semana4(:Quinta), do: "Qui"
    def abreviacao_dia_semana4(:Sexta), do: "Sex"
    def abreviacao_dia_semana4(:Sabado), do: "Sab"
    def abreviacao_dia_semana4(_), do: "Dia inválido"
end
