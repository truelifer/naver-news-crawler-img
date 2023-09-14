node {
    stage ('git clones') {
        checkout scm
        GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
        VERSION = GIT_COMMIT_HASH.take(7)
    }
    stage('docker build') {
        app = docker.build("truelifer/naver-news-crawler-img")
    }
    stage('docker push') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-truelifer') {
        app.push("${VERSION}")
        app.push("latest")
        }
    }
}