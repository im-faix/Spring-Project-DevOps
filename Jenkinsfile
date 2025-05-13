pipeline
{
    agent any
    
    stages
    {
        stage('clean-workspace')
        {
            steps
            {
                cleanWs()
            }
        }
        stage('cloning')
        {
            steps
            {
                sh 'git clone https://github.com/im-faix/Spring-Project-DevOps.git .'
                echo 'clone completed'
            }
        }
        stage('docker-image')
        {
            steps
            {
                sh 'docker build -t webapp:$BUILD_ID .'
                echo "image created "
            }
        }
        stage('docker-container')
        {
            steps
            {
                sh 'docker run -d -p 9090:9090 webapp:$BUILD_ID'
            }
        }
        stage('listing')
        {
            steps
            {
                sh 'docker images'
                echo ""
                sh 'docker ps '
            }
        }
    }
}
