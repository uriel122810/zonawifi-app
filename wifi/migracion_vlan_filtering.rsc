# ============================================================
# MIGRACION A BRIDGE CON VLAN FILTERING + FIX DE vlan7
# Generado para Archuit - revisar cada fase antes de aplicar
# HACER RESPALDO ANTES: /export file=respaldo_previo_a_este_script
# APLICAR EN HORARIO DE BAJO TRAFICO
# ============================================================

# ------------------------------------------------------------
# FASE 0: Arreglar el hueco de vlan7 (10.10.180.0/24)
# Actualmente no tiene DHCP server ni hotspot server.
# Reutilizamos el perfil hsprof8 que ya existe (apunta a 10.10.180.1)
# ------------------------------------------------------------
/ip pool add name=hs-pool-16 ranges=10.10.180.2-10.10.180.254
/ip dhcp-server add address-pool=hs-pool-16 interface=vlan7 name=dhcp16
/ip hotspot add address-pool=hs-pool-16 disabled=no interface=vlan7 name=hotspot-vlan7 profile=hsprof8

# ------------------------------------------------------------
# FASE 1: Agregar los puertos troncales (los que llevan las
# antenas) al bridge1, donde ya viven LAN y ANTENA
# ------------------------------------------------------------
/interface bridge port add bridge=bridge1 interface=VLAN1 hw=yes
/interface bridge port add bridge=bridge1 interface=VLANS2 hw=yes

# ------------------------------------------------------------
# FASE 2: Activar el filtrado de VLANs por hardware
# (esto es lo que hace que el chip del switch SI respete el
# aislamiento entre antenas, en vez de mezclarlas como ahora)
# ------------------------------------------------------------
/interface bridge set bridge1 vlan-filtering=yes

# ------------------------------------------------------------
# FASE 3: Definir la red nativa (LAN + ANTENA, sin etiqueta,
# la que ya conoces como 10.10.100.0/24) para que solo esos
# dos puertos la vean - los troncales quedan fuera a propósito
# ------------------------------------------------------------
/interface bridge vlan add bridge=bridge1 vlan-ids=1 tagged=bridge1 untagged=LAN,ANTENA

# ------------------------------------------------------------
# FASE 4: Registrar cada VLAN en la tabla del bridge,
# etiquetada SOLO en su puerto troncal correspondiente.
# Esto es lo que impide que una antena vea el trafico de otra.
# ------------------------------------------------------------
# Antenas del trunk VLAN1 (ether5) - vlan1 a vlan7
/interface bridge vlan add bridge=bridge1 vlan-ids=11 tagged=VLAN1,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=12 tagged=VLAN1,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=13 tagged=VLAN1,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=14 tagged=VLAN1,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=15 tagged=VLAN1,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=16 tagged=VLAN1,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=17 tagged=VLAN1,bridge1

# Antenas del trunk VLANS2 (sfp1) - 2vlan1 a 2vlan7
/interface bridge vlan add bridge=bridge1 vlan-ids=21 tagged=VLANS2,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=22 tagged=VLANS2,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=23 tagged=VLANS2,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=24 tagged=VLANS2,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=25 tagged=VLANS2,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=26 tagged=VLANS2,bridge1
/interface bridge vlan add bridge=bridge1 vlan-ids=27 tagged=VLANS2,bridge1

# ------------------------------------------------------------
# FASE 5: Repuntar cada interfaz VLAN L3 (las que usan tus
# hotspots) para que cuelguen del bridge, no del puerto suelto
# ------------------------------------------------------------
/interface vlan set [find name=vlan1] interface=bridge1
/interface vlan set [find name=vlan2] interface=bridge1
/interface vlan set [find name=vlan3] interface=bridge1
/interface vlan set [find name=vlan4] interface=bridge1
/interface vlan set [find name=vlan5] interface=bridge1
/interface vlan set [find name=vlan6] interface=bridge1
/interface vlan set [find name=vlan7] interface=bridge1
/interface vlan set [find name=2vlan1] interface=bridge1
/interface vlan set [find name=2vlan2] interface=bridge1
/interface vlan set [find name=2vlan3] interface=bridge1
/interface vlan set [find name=2vlan4] interface=bridge1
/interface vlan set [find name=2vlan5] interface=bridge1
/interface vlan set [find name=2vlan6] interface=bridge1
/interface vlan set [find name=2vlan7] interface=bridge1

# ------------------------------------------------------------
# FASE 6 (verificacion, no modifica nada):
# Corre esto despues y revisa que todo siga con IP y RUNNING
# ------------------------------------------------------------
# /interface vlan print detail
# /ip address print
# /interface bridge vlan print
