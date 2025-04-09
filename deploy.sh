#!/bin/bash
TARGET=$1
echo "Desplegando a $TARGET..."
# Aquí iría la lógica real de despliegue, por ejemplo:
# aws s3 cp ./build s3://$TARGET
sleep 2  # Simulación de tiempo
echo "Despliegue a $TARGET completado!"