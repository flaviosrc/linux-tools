# Sonarqube scratchbook

this may prevent some issues:
sysctl -w vm.max_map_count=524288

Token: 230d28f70897c379f71ce56583027c1ce89d2f7b
Token: b944e1ffae4dc56c62b110839e92e0f505de3d5f

mvn clean verify sonar:sonar \
  -Dsonar.projectKey=Econt-Agro \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=b944e1ffae4dc56c62b110839e92e0f505de3d5f \
  -Dsonar.coverage.jacoco.xmlReportPaths=/home/flavio/econt-agro-service/target/site/jacoco/jacoco.xml
