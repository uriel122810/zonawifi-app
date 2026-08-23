/system script add name=login_12hora source={
:do {
    /system script run generar_pin_real
} on-error={
    :log warning "generar_pin_real fallo en login_12hora"
}
:do {
    /system script run notificacion5pesos
} on-error={
    :log warning "notificacion5pesos fallo en login_12hora"
}
}
