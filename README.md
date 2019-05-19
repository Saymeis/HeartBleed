### HeartBleed уязвимость в docker 
==================================

1. git clone https://github.com/Saymeis/HeartBleed.git
2. cd HeartBleed
2. sudo docker build -t heartbleed -f Dockerfile .
3. sudo  docker run -p 80:80 -p 443:443 -d heartbleed

	
