IMAGE=docker-registry.apps.foo.com/spark-cluster/zeppelin
IMAGE_OS=172.30.119.127:5000/spark-cluster/zeppelin

.PHONY: build clean push deploy destroy

build:
	docker build -t openshift-zeppelin .

clean:
	docker rmi openshift-zeppelin

push: build
	docker tag -f openshift-zeppelin $(IMAGE)
	docker push $(IMAGE)

deploy: push template.yaml
	oc process -f template.yaml -v IMAGE=$(IMAGE_OS) > template.active
	oc create -f template.active

destroy: template.active
	oc delete -f template.active
	rm template.active
