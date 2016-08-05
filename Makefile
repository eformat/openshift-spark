SPARK_IMAGE=docker-registry.apps.foo.com/spark-cluster/openshift-spark
SPARK_IMAGE_OS=172.30.119.127:5000/spark-cluster/openshift-spark

.PHONY: build clean push deploy destroy

build:
	docker build -t openshift-spark .

clean:
	docker rmi openshift-spark

push: build
	docker tag -f openshift-spark $(SPARK_IMAGE)
	docker push $(SPARK_IMAGE)

deploy: push template.yaml
	oc process -f template.yaml -v SPARK_IMAGE=$(SPARK_IMAGE_OS) > template.active
	oc create -f template.active

destroy: template.active
	oc delete -f template.active
	rm template.active
