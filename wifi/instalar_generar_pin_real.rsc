/system script add name=generar_pin_real source={
:local originalPin $user
:if ([:len $originalPin] != 8) do={
    :error "no es un pin publico de 8 digitos, se ignora"
}
:local prof [/ip hotspot user get [find name=$originalPin] profile]
:local realPin ""
:local intentos 0
:do {
    :set realPin ([:tostr [:rndnum from=100000 to=999999]])
    :set intentos ($intentos + 1)
} while ( ([:len [/ip hotspot user find name=$realPin]] > 0) and ($intentos < 20) )
/ip hotspot user add name=$realPin password=$realPin profile=$prof comment=("real-de-" . $originalPin)
/ip hotspot user remove [find name=$originalPin]
:local archivo ("hotspot/pending_" . $originalPin)
/file print file=$archivo
/file set ($archivo . ".txt") contents=("usuario=" . $realPin . "&clave=" . $realPin)
:delay 9s
:if ([:len [/file find name=($archivo . ".txt")]] > 0) do={
    /file remove [find name=($archivo . ".txt")]
}
}
