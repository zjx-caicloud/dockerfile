#!/bin/sh
template_url=http://localhost:9200/_template/template_k8s_logstash
response=$(curl --write-out %{http_code} --silent --output /dev/null $template_url)
template_path=/elasticsearch/config/templates/template-k8s-logstash.json
while [ "$?" = "7" ];
do
	echo "elasticsearch is not ready"
	sleep 1
	response=$(curl --write-out %{http_code} --silent --output /dev/null $template_url)
done
echo "elasticsearch is ready"
add_template_response=$(curl --write-out %{http_code} -XPUT $template_url -d @$template_path)
i=1
while [ $add_template_response -ne 200 -a $i -le 6 ];
do
	sleep $i
	add_template_response=$(curl --write-out %{http_code} -XPUT $template_url -d @$template_path)
	i=$(($i + 1))
done
echo "loaded template"