# CI/CD Templates

Bienvenidos al repositorio base para pipelines reutilizables de CI/CD. Este proyecto centraliza y estandariza los flujos de trabajo para aplicaciones frontend y backend, eliminando redundancia y simplificando el mantenimiento de *n* pipelines.

## Estructura
- `.github/workflows/`:
  - `ci-cd-frontend.yml`: Pipeline reutilizable para aplicaciones frontend (Node.js).
  - `ci-cd-backend.yml`: Pipeline reutilizable para aplicaciones backend (Java/Maven).
- `.github/actions/`:
  - `setup-node/`: Acción para configurar Node.js.
  - `setup-back/`: Acción para configurar back (Java/Maven).
  - `deploy-app/`: Acción común para despliegue.
- `templates/`:
  - `env-template.yml`: Plantilla de variables comunes (referencia para la UI de GitHub).
- `deploy.sh`: Script simulado de despliegue.

## Variables globales
Las siguientes variables están definidas en la UI de GitHub (Settings > Variables):

Ejemplo:
- `DEFAULT_REGION`: Región por defecto (ej. `us-east-1`).
- `DEFAULT_ENV`: Entorno por defecto (ej. `production`).
- `BUILD_TIMEOUT`: Tiempo máximo de construcción (ej. `3600` segundos).
- `RETRY_ATTEMPTS`: Número de reintentos (ej. `3`).

Se puede incluir cualquier variable que se vaya a utilizar en muchas pipeline (Eliminar redundancia)

## Cómo usarlo
En cualquier repositorio de aplicación:
1. Crea un archivo `.github/workflows/main.yml`.
2. Llama al workflow adecuado con parámetros personalizados. Ejemplo para frontend:
   ```yaml
   name: Backend Pipeline
   on:
     push:
       branches: [main]
   jobs:
     build-and-deploy:
       uses: ismaelGTI/microHackaton-CleanCode2/ .github/workflows/ci-cd-backend.yml@main
       with:
         java-version: '17'
         deploy-target: 'prod-backend1'