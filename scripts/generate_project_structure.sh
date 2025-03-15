#!/bin/bash

# Define the base package
BASE_PACKAGE="com.pdf"

# List of services
SERVICES=("pdf-encryption-service" "pdf-to-word-converter-service" "pdf-splitter-service" "notification-service")

# Function to create Java files
generate_java_files() {
    SERVICE_NAME=$1
    PACKAGE_PATH="src/main/java/${BASE_PACKAGE}/${SERVICE_NAME//-//}"

    # Convert service name to PascalCase for the class name
    CLASS_NAME=$(echo "$SERVICE_NAME" | sed -r 's/(^|-)([a-z])/\U\2/g')

    mkdir -p "$PACKAGE_PATH/controller"
    mkdir -p "$PACKAGE_PATH/service"
    mkdir -p "$PACKAGE_PATH/config"

    # Generate main application class
    cat <<EOF > "$PACKAGE_PATH/${CLASS_NAME}Application.java"
package ${BASE_PACKAGE}.${SERVICE_NAME//-/.};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ${CLASS_NAME}Application {
    public static void main(String[] args) {
        SpringApplication.run(${CLASS_NAME}Application.class, args);
    }
}
EOF

    # Generate controller class
    cat <<EOF > "$PACKAGE_PATH/controller/${CLASS_NAME}Controller.java"
package ${BASE_PACKAGE}.${SERVICE_NAME//-/.}.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/${SERVICE_NAME//-//}")
public class ${CLASS_NAME}Controller {

    @GetMapping("/test")
    public String test() {
        return "Hello from ${CLASS_NAME}!";
    }
}
EOF

    # Generate service class
    cat <<EOF > "$PACKAGE_PATH/service/${CLASS_NAME}Service.java"
package ${BASE_PACKAGE}.${SERVICE_NAME//-/.}.service;

import org.springframework.stereotype.Service;

@Service
public class ${CLASS_NAME}Service {

    public String process() {
        return "Processing in ${CLASS_NAME} Service";
    }
}
EOF
}

# Loop through each service and generate files
for SERVICE in "${SERVICES[@]}"; do
    echo "Generating structure for $SERVICE..."
    generate_java_files "$SERVICE"
done

echo "Project structure generated successfully!"
