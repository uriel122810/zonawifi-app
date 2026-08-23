# ============================================================
# generar_pin_real
# Se ejecuta automaticamente cuando alguien se loguea con
# un PIN publico de 8 digitos. Genera un PIN real oculto de
# 6 digitos, quema el PIN publico, y publica el PIN real en
# un archivo temporal (borrado en 9 segundos) para que la
# app lo recoja por HTTP normal, sin necesitar credenciales
# de la API del router.
#
# INSTALAR COMO: /system script add name=generar_pin_real source=...
# LLAMAR DESDE:  el campo "on-login" del perfil de usuario
# ============================================================

:local originalPin $user

# Evita que corra por error con un PIN real de 6 digitos
# (solo debe procesar los publicos de 8 digitos)
:if ([:len $originalPin] != 8) do={
    :error "no es un pin publico de 8 digitos, se ignora"
}

# Busca el perfil del PIN original (12-hora o 5-dia), para que
# el PIN real herede exactamente la misma duracion/reglas
:local prof [/ip hotspot user get [find name=$originalPin] profile]

# Genera un PIN real de 6 digitos que no choque con ninguno existente
:local realPin ""
:local intentos 0
:do {
    :set realPin ([:tostr [:rndnum from=100000 to=999999]])
    :set intentos ($intentos + 1)
} while ( ([:len [/ip hotspot user find name=$realPin]] > 0) and ($intentos < 20) )

# Crea el usuario oculto (PIN real) con el mismo perfil
/ip hotspot user add name=$realPin password=$realPin profile=$prof comment=("real-de-" . $originalPin)

# Quema el PIN publico original - ya nadie mas lo puede usar
/ip hotspot user remove [find name=$originalPin]

# Publica el PIN real en un archivo temporal dentro de la carpeta
# del hotspot, accesible por HTTP normal (igual que login.html)
:local archivo ("hotspot/pending_" . $originalPin)
/file print file=$archivo
/file set ($archivo . ".txt") contents=("usuario=" . $realPin . "&clave=" . $realPin)

# Espera 9 segundos (tiempo de sobra para que la app lo recoja)
# y borra el archivo temporal, sin importar si lo alcanzaron a leer
:delay 9s
:if ([:len [/file find name=($archivo . ".txt")]] > 0) do={
    /file remove [find name=($archivo . ".txt")]
}
