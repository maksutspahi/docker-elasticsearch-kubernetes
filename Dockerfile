FROM quay.io/pires/docker-elasticsearch:2.3.1

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
#RUN /elasticsearch/bin/plugin remove cloud-kubernetes --verbose
#RUN /elasticsearch/bin/plugin remove kopf --verbose

RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.3.1 --verbose
RUN /elasticsearch/bin/plugin install mobz/elasticsearch-head --verbose
#RUN /elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/v2.1.1 --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Copy run script
COPY run.sh /
