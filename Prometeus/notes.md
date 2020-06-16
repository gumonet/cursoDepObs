#Instalar prometeus
wget https://github.com/prometheus/prometheus/releases/download/v2.8.0/prometheus-2.8.0.linux-amd64.tar.gz

#tar -xzf prometheus-2.8.0.linux-amd64.tar.gz
mv prometheus-2.8.0.linux-amd64.tar.gz prometheus
cd prometeus
nano prometeus.yml
./prometheus &

#Obtener


#Instalar node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz
tar -xzf node_exporter-0.17.0.linux-amd64.tar.gz
mv node_exporter-0.17.0.linux-amd64 node_exporter
./node_exporter &

#Instalar alerting
Ingresar a la maquina donde queremos agregar el mismo
wget https://github.com/prometheus/alertmanager/releases/download/v0.16.1/alertmanager-0.16.1.linux-amd64.tar.gz
tar -xzf alertmanager-0.16.1.linux-amd64.tar.gz
mv alertmanager-0.16.1.linux-amd64.tar.gz  alert_manager
cd alert_manager
modificar el yml

2. ajustar segun lo convenido
3. Ir a prometheus y modificar el nodo alerting
# Alertmanager configuration
alerting:
  alertmanagers:
  - static_configs:
    - targets:
       - 10.6.6.3:9093
4. Ejecutamos ./alert_manager &

5. Nos vamos a nuestra maquina principal de promettheus y editamos prometheus yamel.
# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files
   - "first_rules.yml"
  # - "second_rules.yml"

  4. se crea el archivo rules en nuestra maquina de prometeus
  groups:
    - name: my_first_rule
      rules:
      - alert: InstanceDown
        expr: up == 0
        for: 20s
