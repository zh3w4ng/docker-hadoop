# Apache Hadoop 2.x - Pseudo-Distributed Mode
**- Container run**

    root@zhewang:~# docker run -d --name="hadoop" -h "hadoop" \
    -p 8042:8042 -p 8088:8088 -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 8188:8188 -p 8080:8080 zh3w4ng/hadoop:1.0
    root@zhewang:~# docker exec -it hadoop bash
or

**- Build**

    root@zhewang:~# git clone https://github.com/zh3w4ng/docker-hadoop.git /opt/docker-hadoop
    root@zhewang:~# cd /opt/docker-hadoop
    root@zhewang:~# docker build  -t zh3w4ng/hadoop:dev .
    root@zhewang:~# root@zhewang:~# docker run -d --name="hadoop" -h "hadoop" \
    -p 8042:8042 -p 8088:8088 -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 8188:8188 -p 8080:8080 zh3w4ng/hadoop:dev

**- Container run**

    root@zhewang:~# docker run -d --name="hadoop" -h "hadoop" \
    -p 8042:8042 -p 8088:8088 -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 8188:8188 -p 8080:8080 zh3w4ng/hadoop:dev

**- SSH login**

root password : hadoop

    root@zhewang:~# ssh `docker inspect -f '{{ .NetworkSettings.IPAddress }}' hadoop`

**- Hadoop status**

    root@hadoop:~# jps
    624 NodeManager
    209 DataNode
    659 Jps
    132 NameNode
    540 ResourceManager
    334 SecondaryNameNode

**- Testing**

    root@hadoop:/opt/hadoop-2.7.1/etc/hadoop# hadoop jar $HADOOP_PREFIX/share/hadoop/mapreduce/hadoop-mapreduce-examples*.jar pi 3 3
    Number of Maps  = 3
    Samples per Map = 3
    SLF4J: Class path contains multiple SLF4J bindings.
    SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.1/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
    SLF4J: Found binding in [jar:file:/opt/tez-0.8.2-minimal/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
    SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
    SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
    Wrote input for Map #0
    Wrote input for Map #1
    Wrote input for Map #2
    Starting Job
    16/03/16 03:01:33 INFO impl.TimelineClientImpl: Timeline service address: http://hadoop:8188/ws/v1/timeline/
    16/03/16 03:01:33 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
    16/03/16 03:01:34 INFO input.FileInputFormat: Total input paths to process : 3
    16/03/16 03:01:34 INFO mapreduce.JobSubmitter: number of splits:3
    16/03/16 03:01:35 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1458097183826_0001
    16/03/16 03:01:35 INFO client.YARNRunner: Number of stages: 2
    16/03/16 03:01:35 INFO client.TezClient: Tez Client Version: [ component=tez-api, version=0.8.2, revision=${buildNumber}, SCM-URL=scm:git:https://git-wip-us.apache.org/repos/asf/tez.git, buildTime=20160311-0640 ]
    16/03/16 03:01:36 INFO impl.TimelineClientImpl: Timeline service address: http://hadoop:8188/ws/v1/timeline/
    16/03/16 03:01:36 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
    16/03/16 03:01:36 INFO client.TezClient: Using org.apache.tez.dag.history.ats.acls.ATSHistoryACLPolicyManager to manage Timeline ACLs
    16/03/16 03:01:36 INFO impl.TimelineClientImpl: Timeline service address: http://hadoop:8188/ws/v1/timeline/
    16/03/16 03:01:36 INFO client.TezClient: Submitting DAG application with id: application_1458097183826_0001
    16/03/16 03:01:36 INFO client.TezClientUtils: Using tez.lib.uris value from configuration: hdfs://0.0.0.0:9000/apps/tez-0.8.2/tez-0.8.2.tar.gz
    16/03/16 03:01:36 INFO client.TezClient: Tez system stage directory hdfs://0.0.0.0:9000/tmp/hadoop-yarn/staging/root/.staging/job_1458097183826_0001/.tez/application_1458097183826_0001 doesn't exist and is created
    16/03/16 03:01:36 INFO acls.ATSHistoryACLPolicyManager: Created Timeline Domain for History ACLs, domainId=Tez_ATS_application_1458097183826_0001
    16/03/16 03:01:38 INFO client.TezClient: Submitting DAG to YARN, applicationId=application_1458097183826_0001, dagName=QuasiMonteCarlo
    16/03/16 03:01:38 INFO impl.YarnClientImpl: Submitted application application_1458097183826_0001
    16/03/16 03:01:38 INFO client.TezClient: The url to track the Tez AM: http://hadoop:8088/proxy/application_1458097183826_0001/
    16/03/16 03:01:53 INFO impl.TimelineClientImpl: Timeline service address: http://hadoop:8188/ws/v1/timeline/
    16/03/16 03:01:53 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
    16/03/16 03:01:54 INFO impl.TimelineClientImpl: Timeline service address: http://hadoop:8188/ws/v1/timeline/
    16/03/16 03:01:54 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
    16/03/16 03:01:55 INFO mapreduce.Job: The url to track the job: http://hadoop:8088/proxy/application_1458097183826_0001/
    16/03/16 03:01:55 INFO mapreduce.Job: Running job: job_1458097183826_0001
    16/03/16 03:01:56 INFO mapreduce.Job: Job job_1458097183826_0001 running in uber mode : false
    16/03/16 03:01:56 INFO mapreduce.Job:  map 0% reduce 0%
    16/03/16 03:03:24 INFO mapreduce.Job:  map 100% reduce 0%
    16/03/16 03:04:31 INFO mapreduce.Job:  map 100% reduce 100%
    16/03/16 03:04:31 INFO mapreduce.Job: Job job_1458097183826_0001 completed successfully
    16/03/16 03:04:33 INFO mapreduce.Job: Counters: 0
    Job Finished in 181.265 seconds
    Estimated value of Pi is 3.55555555555555555556
or (without TEZ)

    root@hadoop:~# hadoop jar \
    $HADOOP_PREFIX/share/hadoop/mapreduce/hadoop-mapreduce-examples*.jar pi 3 3
    Number of Maps  = 3
    Samples per Map = 3
    Wrote input for Map #0
    Wrote input for Map #1
    Wrote input for Map #2
    Starting Job
    14/08/29 09:43:26 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
    14/08/29 09:43:26 INFO input.FileInputFormat: Total input paths to process : 3
    14/08/29 09:43:26 INFO mapreduce.JobSubmitter: number of splits:3
    14/08/29 09:43:27 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1409304988887_0003
    14/08/29 09:43:27 INFO impl.YarnClientImpl: Submitted application application_1409304988887_0003
    14/08/29 09:43:27 INFO mapreduce.Job: The url to track the job: http://hadoop:8088/proxy/application_1409304988887_0003/
    14/08/29 09:43:27 INFO mapreduce.Job: Running job: job_1409304988887_0003
    14/08/29 09:43:33 INFO mapreduce.Job: Job job_1409304988887_0003 running in uber mode : false
    14/08/29 09:43:33 INFO mapreduce.Job:  map 0% reduce 0%
    14/08/29 09:43:41 INFO mapreduce.Job:  map 67% reduce 0%
    14/08/29 09:43:42 INFO mapreduce.Job:  map 100% reduce 0%
    14/08/29 09:43:47 INFO mapreduce.Job:  map 100% reduce 100%
    14/08/29 09:43:47 INFO mapreduce.Job: Job job_1409304988887_0003 completed successfully
    14/08/29 09:43:47 INFO mapreduce.Job: Counters: 49
            File System Counters
                FILE: Number of bytes read=72
                FILE: Number of bytes written=389309
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=792
                HDFS: Number of bytes written=215
                HDFS: Number of read operations=15
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=3
        Job Counters
                Launched map tasks=3
                Launched reduce tasks=1
                Data-local map tasks=3
                Total time spent by all maps in occupied slots (ms)=17686
                Total time spent by all reduces in occupied slots (ms)=3917
                Total time spent by all map tasks (ms)=17686
                Total time spent by all reduce tasks (ms)=3917
                Total vcore-seconds taken by all map tasks=17686
                Total vcore-seconds taken by all reduce tasks=3917
                Total megabyte-seconds taken by all map tasks=18110464
                Total megabyte-seconds taken by all reduce tasks=4011008
        Map-Reduce Framework
                Map input records=3
                Map output records=6
                Map output bytes=54
                Map output materialized bytes=84
                Input split bytes=438
                Combine input records=0
                Combine output records=0
                Reduce input groups=2
                Reduce shuffle bytes=84
                Reduce input records=6
                Reduce output records=0
                Spilled Records=12
                Shuffled Maps =3
                Failed Shuffles=0
                Merged Map outputs=3
                GC time elapsed (ms)=426
                CPU time spent (ms)=1450
                Physical memory (bytes) snapshot=807591936
                Virtual memory (bytes) snapshot=7788961792
                Total committed heap usage (bytes)=607125504
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters
                Bytes Read=354
        File Output Format Counters
                Bytes Written=97
    Job Finished in 21.529 seconds
    Estimated value of Pi is 3.55555555555555555556

**- Web UI**

Namenode Information
![Namenode Information][1]

Datanode Information
![Datanode Information][2]

Secondarynode Information
![Secondarynode Information][3]

Startup progress Information
![Startup progress Information][4]

Utilities - Browse the file system
![Browsing HDFS][5]

Nodemanager Information
![Nodemanager Information][6]

Resource manager Information
![Resource Manager Information][7]

Tez UI
![Tez UI][8]
![Tez UI][9]
![Tez UI][10]
![Tez UI][11]
![Tez UI][12]
![Tez UI][13]
![Tez UI][14]
![Tez UI][15]
![Tez UI][16]

Thanks. :-)

  [1]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/apache_hadoop_namenode.png
  [2]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/apache_hadoop_datanode.png
  [3]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/apache_hadoop_secondarynode.png
  [4]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/apache_hadoop_startup_progress.png
  [5]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/apache_hadoop_browsing_hdfs.png
  [6]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/apache_hadoop_nodemanager.png
  [7]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/apache_hadoop_resourcemanager.png
  [8]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%2011.02.04%20AM.png
  [9]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%2011.04.50%20AM.png
  [10]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%204.05.35%20PM.png
  [11]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%204.05.41%20PM.png
  [12]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%204.05.52%20PM.png
  [13]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%204.05.59%20PM.png
  [14]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%204.06.05%20PM.png
  [15]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%204.06.14%20PM.png
  [16]: https://raw.githubusercontent.com/zh3w4ng/docker-hadoop/35f716916709433c5c9a5b9ba70233b2299e5d51/Screen%20Shot%202016-03-16%20at%204.06.18%20PM.png
