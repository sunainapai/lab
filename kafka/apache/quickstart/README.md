Kafka
=====
This document describes how to set up [Kafka][WEBSITE]
environment and get started with it.

Note that the steps below are written for Debian system. To perform the
setup on any other system, some of the steps below may have to be
modified.

[WEBSITE]: https://kafka.apache.org/


Contents
--------
* [Kafka Setup](#kafka-setup)
* [Single Broker Cluster](#single-broker-cluster)
* [Multi Broker Cluster](#multi-broker-cluster)
* [Troubleshooting Tips](#troubleshooting-tips)


Kafka Setup
-----------
Perform the following steps to setup Kakfa on local system.

 1. Install JDK 8.

    1. Download JDK 8 and untar it.

            mkdir -p ~/opt
            cd ~/opt
            wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.tar.gz
            tar -xzf jdk-8u152-linux-x64.tar.gz
            rm jdk-8u152-linux-x64.tar.gz

    2. Add Java to PATH.

            Edit ~/.bashrc and add:
                export JAVA_HOME=~/opt/jdk1.8.0_152

            Add :$JAVA_HOME/bin to the PATH

            . ~/.bashrc

    3. Check the Java installation by running the following commands.

            java -version
            javac -version
            which java

 2. Download 1.0.0 release of Kafka and untar it.

        mkdir -p ~/opt
        cd ~/opt
        wget http://www-eu.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz
        tar -xzf kafka_2.11-1.0.0.tgz
        rm -rf kafka_2.11-1.0.0.tgz
        cd kafka_2.11-1.0.0


Single Broker Cluster
---------------------
Perform the following steps to setup a Kafka Cluster with a single
broker. Run each step in seperate terminal.

 1. Start ZooKeeper. The below command brings up a single node ZooKeeper
    instance.

        bin/zookeeper-server-start.sh config/zookeeper.properties

    Note: Kafka uses ZooKeeper so you need to first start a ZooKeeper
    server if you don't already have one. 

 2. Start the Kafka server.

        bin/kafka-server-start.sh config/server.properties

 3. Create a topic. The first command below creates a topic named test
    with a single partition and only one replica. Use the list topic
    command to see the list of topics. Use the describe topics command
    to see the partition information.

        bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
        bin/kafka-topics.sh --list --zookeeper localhost:2181
        bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic test

    Example:

        bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic test
        Topic:test	PartitionCount:1	ReplicationFactor:1	Configs:
	        Topic: test	Partition: 0	Leader: 0	Replicas: 0	Isr: 0

 4. Run the producer command line client and type some messages on the
    console to send to the server.

        bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
        This is a message
        This is another message

 5. Run the consumer command line client that dumps the messages to the
    standard output.

        bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

 6. Type messages in the producer terminal and see them appear in the
    consumer terminal.

 7. Stop the consumer and producer using CTRL+C.


Multi Broker Cluster
--------------------
Perform the following steps to setup a Kafka Cluster with multiple
brokers, 3 in our case and all of them on the local machine.

 1. Perform steps 1 and 2 from the previous section if the server is not
    already started.

 2. Make a config file for each of the brokers.

        cp config/server.properties config/server-1.properties
        cp config/server.properties config/server-2.properties

 3. Edit the config files created above and set the following
    properties.

    config/server-1.properties:

        broker.id=1
        listeners=PLAINTEXT://:9093
        log.dir=/tmp/kafka-logs-1

    config/server-2.properties:

        broker.id=2
        listeners=PLAINTEXT://:9094
        log.dir=/tmp/kafka-logs-2

    Note: The broker.id property is the unique and permanent name of
    each node in the cluster. We have to override the port and log
    directory only because we are running these all on the same machine
    and we want to keep the brokers from all trying to register on the
    same port or overwrite each other's data.

 4. Start the two new nodes.

        bin/kafka-server-start.sh config/server-1.properties &
        bin/kafka-server-start.sh config/server-2.properties &

 5. Create a new topic with replication factor of three.

        bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 1 --topic my-replicated-topic
        bin/kafka-topics.sh --list --zookeeper localhost:2181
        bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic my-replicated-topic 

    Example:

        bin/kafka-topics.sh --list --zookeeper localhost:2181
        __consumer_offsets
        my-replicated-topic
        test

        bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic my-replicated-topic 
        Topic:my-replicated-topic	PartitionCount:1	ReplicationFactor:3	Configs:
            Topic: my-replicated-topic	Partition: 0	Leader: 0	Replicas: 0,1,2	Isr: 0,1,2

    The describe topic command above shows which broker is doing what.
    In the output, the first line gives a summary of all the partitions,
    each additional line gives information about one partition. Since we
    have only one partition for this topic there will be only one line.

    1. "leader" is the node responsible for all reads and writes for the
       given partition. Each node will be the leader for a randomly
       selected portion of the partitions.

    2. "replicas" is the list of nodes that replicate the log for this
       partition regardless of whether they are the leader or even if they
       are currently alive.

    3. "isr" is the set of "in-sync" replicas. This is the subset of the
       replicas list that is currently alive and caught-up to the
       leader.

    Note that in the example above node 0 is the leader for the only
    partition of the topic.

 6. Publish a few messages to the new topic.

        bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-replicated-topic
        foo
        bar

 7. Consume the messages.

        bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic my-replicated-topic
        bin/kafka-console-consumer.sh --bootstrap-server localhost:9093 --from-beginning --topic my-replicated-topic
        bin/kafka-console-consumer.sh --bootstrap-server localhost:9094 --from-beginning --topic my-replicated-topic

 8. Test the fault tolerance.

    1. Kill the leader which is broker 0 in our case.

            Use CTRL+c in the terminal where broker 0 is running
            or
            ps -ef | grep server.properties
            Get the process id and use kill -9

    2. Run describe topic to see that the leadership is switched to one
       of the slave nodes.

            bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic my-replicated-topic 

       Example:

            bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic my-replicated-topic
            Topic:my-replicated-topic	PartitionCount:1	ReplicationFactor:3	Configs:
                Topic: my-replicated-topic	Partition: 0	Leader: 1	Replicas: 0,1,2	Isr: 1,2

       In the example above node 1 has become the leader and node 0 is
       no more in the in-sync replica set.

    3. Verify that the messages are still available for consumption even
       though the leader that took the writes originally is down:

            bin/kafka-console-consumer.sh --bootstrap-server localhost:9093 --from-beginning --topic my-replicated-topic

       Observation: The messages were not available for consumption
       consistently. Either the messages were not available at all or
       available only on terminating the first consumer instance and
       running a second one.


Troubleshooting Tips
====================

 1. Insufficient memory when starting Kafka server on VM :

        bin/kafka-server-start.sh config/server.properties
        Java HotSpot(TM) 64-Bit Server VM warning: INFO: os::commit_memory(0x00000000c0000000, 1073741824, 0) failed; error='Cannot allocate memory' (errno=12)
        #
        # There is insufficient memory for the Java Runtime Environment to continue.
        # Native memory allocation (mmap) failed to map 1073741824 bytes for committing reserved memory.
        # An error report file with more information is saved as:
        # /home/sunaina/opt/kafka_2.11-1.0.0/hs_err_pid20920.log

    Kafka defaults to `-Xmx1G -Xms1G` jvm memory parameters which means
    that kafka will allocate 1GB at startup and use a maximum of 1GB of
    memory.  Set `KAFKA_HEAP_OPTS` environment variable to whatever you
    can afford.  Editing `/bin/kafka-server-start.sh` and replacing the
    values is not recommended as the changes made to the script will be
    lost while upgrading Kafka. Set the variable outside the script. If
    it is set before starting Kafka via the script it will use the
    variable instead of the default values defined in
   `/bin/kafka-server-start.sh`.

        Edit ~/.bashrc and add:
        export KAFKA_HEAP_OPTS="-Xmx256M -Xms256M"

    Note: https://stackoverflow.com/a/36649296,
    https://stackoverflow.com/a/34966826

 2. JDK 8 download using `wget` resulting in an HTML document instead of
    the expected tar.gz.

        wget http://download.oracle.com/otn-pub/java/jdk/8u152-b16/jdk-8u152-linux-x64.tar.gz
        file jdk-8u152-linux-x64.tar.gz 
        jdk-8u152-linux-x64.tar.gz: HTML document, ASCII text, with very long lines, with CRLF line terminators

    Use this command instead:

        wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.tar.gz

    Note: https://stackoverflow.com/a/10959815
