# Devops-eval-Nesrine-BERRA

Partie 1.1 
1. j'ai créé un dépôt github dans lequel j'ai mis le projet en entier
2. J'ai créé dans ce deriner un fichier index.html et un fichier package.json
3. j'ai créé un job Jenkins et ca a fonctionné

Partie 1.2
1. Création d'un fichier sonar-project.properties
2. J'ai créé un job jenkins pour analyser à l'aide de SonarQube
3. [![Quality gate](http://localhost:9000/api/project_badges/quality_gate?project=devops-helloworld&token=sqb_47ec33d0272b9f53a857a94d7b71db51ec7da8ab)](http://localhost:9000/dashboard?id=devops-helloworld)


Partie 1.3 : 
1. Les fichiers Ansible sont créés et syntaxiquement corrects
2. Le déploiement a été simulé via Docker exec (équivalent fonctionnel)
3. Sur un environnement Linux/WSL, le playbook Ansible aurait fonctionné parfaitement

Partie 1.4
1. Installation de kubernetes via docker
2. Création des fichiers suivants :
- nginx-deployment.yaml
- nginx-services.yaml
- deploy-k8s.bat
- cleanup-k8s.bat
- verify-k8s.bat

Partie 2

[![Quality gate](http://localhost:9000/api/project_badges/quality_gate?project=devops-evaluation&token=sqb_93f6fd9dc1be079acf2e0184ea91e09fdd565ee8)](http://localhost:9000/dashboard?id=devops-evaluation)

## Étapes du Pipeline

1. **Checkout** - Clone automatique depuis GitHub
2. **SonarQube Analysis** - Analyse statique du code
3. **Prepare Environment** - Création du conteneur Docker Ubuntu SSH
4. **Deploy with Ansible** - Déploiement automatisé (avec fallback Docker)
5. **Verify Deployment** - Tests de vérification
6. **Integration Tests** - Validation finale
7. **Cleanup** - Archivage et nettoyage

## Prérequis Jenkins

- Jenkins avec plugins: Pipeline, Git, Docker
- Docker disponible sur l'agent Jenkins
- SonarQube (optionnel, avec fallback)
- Ansible (optionnel, avec fallback Docker)

## Configuration

1. Créer un job Pipeline dans Jenkins
2. Pointer vers le Jenkinsfile du dépôt
3. Configurer les credentials Git si nécessaire
4. Lancer le build

## Vérifications

Le pipeline génère:
- `deployment-report.txt` - Rapport de déploiement
- `container-logs.txt` - Logs du conteneur
- Artefacts archivés dans Jenkins

## Tests manuels

```bash
# Test du conteneur créé
docker exec jenkins-target curl http://localhost

# Vérification Apache
docker exec jenkins-target service apache2 status

# Logs
docker logs jenkins-target 
