### README: Despliegue de Infraestructura en AWS con Terraform

Este proyecto despliega una infraestructura segura de AWS, siguiendo las mejores prácticas. La infraestructura incluye una VPC con subredes públicas y privadas con internet gateway y , un bastion host y un servidor privado, un bucket S3 para almacenamiento y los roles IAM necesarios. 

***

### Requisitos Previos

* **Cuenta de AWS**: Necesitas una cuenta de AWS activa con credenciales de acceso configuradas localmente.
* **Terraform**: Debe estar instalado en tu máquina.
* * **Git**: Debe estar instalado en tu máquina.
* https://git-scm.com/downloads/win
* **Chocolatey**: Debe estar instalado en tu máquina.
* https://chocolatey.org/install
* **Archivos de configuración**: Los archivos `.tf` de este proyecto deben estar en un directorio local.

***

### Pasos para Levantar la Infraestructura

1.  **Inicializar Terraform**: Abre una terminal en el directorio del proyecto y ejecuta el siguiente comando para inicializar el backend y los proveedores de Terraform:
    ```sh
    terraform init
    ```
2.  **Planificar el despliegue**: Ejecuta `terraform plan` para ver un resumen de los recursos que se crearán.
3.  **Aplicar la configuración**: Si el plan es correcto, aplica la configuración para desplegar la infraestructura en tu cuenta de AWS. Escribe `yes` cuando se te solicite confirmación.
    ```sh
    terraform apply
    ```
4.  **Obtener la IP pública del Bastion Host**: Una vez que el despliegue se complete, Terraform mostrará la dirección IP pública del bastion host, que se define como un output. Utiliza esta IP para acceder a la red privada de forma segura.
    ```sh
    bastion_public_ip = "X.X.X.X"
    ```
5.  **Obtener la IP privada del Servidor privado**: Una vez que el despliegue se complete, Terraform mostrará la dirección IP privada del servidor privado, que se define como un output. Utiliza esta IP para realizar la conexión desde el bastion host.
    ```sh
    bastion_public_ip = "X.X.X.X"
    ```
***

### Cómo Acceder a los Servicios Desplegados

* **Acceso al Bastion Host mediante SSH**: Para conectarte al bastion host, usa SSH con la clave privada asociada y la IP pública obtenida en el paso anterior. La instancia del bastion host se encuentra en una subred pública.
    ```sh
    ssh -i "tu_clave.pem" ubuntu@<bastion_public_ip>
    ```
* **Acceso al Bastion Host mediante SSM**: Para conectarte al bastion host, usa el agente de Session Manager en tu cuenta de AWS.
    ```sh
    Conectarte por SSM
    ```
* **Acceso a la Instancia Privada**: El acceso a la instancia EC2 en la subred privada se realiza a través del bastion host usando el keypair.pem generado durante el despliegue de la infraestructura, se le brinda permiso previamente:
    ```sh
    chmod 400 keypair_privado.pem
    ssh -i "keypair_privado.pem" ec2-user@<private_ec2_ip>
    ```

* **Acceso al Bucket S3**: El bucket S3 se ha creado para almacenamiento general de artefactos. Puedes gestionarlo a través de la consola de AWS o utilizando la AWS CLI.

***

### Limpieza de la Infraestructura

Para eliminar todos los recursos creados por Terraform, ejecuta el siguiente comando. Escribe `yes` cuando se te solicite confirmación para evitar costos no deseados.
```sh
terraform destroy

