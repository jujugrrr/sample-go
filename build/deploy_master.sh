for host in `aws ec2 describe-instances --filters "Name=tag:app,Values=samplego" --query 'Reservations[0:].Instances[0].PublicIpAddress' --output text`
do 
  echo "Deploying code to $host"
  scp -o StrictHostKeyChecking=no sample-go $host:sample-go
  ssh -o StrictHostKeyChecking=no -t samplego@$host "sudo /usr/local/bin/supervisorctl restart sample-go"
done
