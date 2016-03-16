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

  [1]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f6170616368655f6861646f6f705f6e616d656e6f64652e706e67&path=apache_hadoop_namenode.png&repository_id=52154305#3b08a8ef-4469-40b8-8f8d-cecae98a2e0f
  [2]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f6170616368655f6861646f6f705f646174616e6f64652e706e67&path=apache_hadoop_datanode.png&repository_id=52154305#eee188ed-7e53-4cd8-83f5-98425fddc20b
  [3]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f6170616368655f6861646f6f705f7365636f6e646172796e6f64652e706e67&path=apache_hadoop_secondarynode.png&repository_id=52154305#17e809d3-f9e1-4a6f-8e51-de16e6e431b2
  [4]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f6170616368655f6861646f6f705f737461727475705f70726f67726573732e706e67&path=apache_hadoop_startup_progress.png&repository_id=52154305#15c4611a-d78a-4037-a9cf-b1085ca8d5ce
  [5]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f6170616368655f6861646f6f705f62726f7773696e675f686466732e706e67&path=apache_hadoop_browsing_hdfs.png&repository_id=52154305#3f9c8d16-5ce3-47d8-a35a-862d4cf7984f
  [6]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f6170616368655f6861646f6f705f6e6f64656d616e616765722e706e67&path=apache_hadoop_nodemanager.png&repository_id=52154305#df5a4d1d-e901-4605-a9c8-c992dcdf3882
  [7]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f6170616368655f6861646f6f705f7265736f757263656d616e616765722e706e67&path=apache_hadoop_resourcemanager.png&repository_id=52154305#deeb6daf-66ce-4e93-b029-1af991b57677
  [8]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d3136253230617425323031312e30322e3034253230414d2e706e67&path=Screen+Shot+2016-03-16+at+11.02.04+AM.png&repository_id=52154305#79bf5140-d024-4c1d-b780-0bf66a90020f
  [9]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d3136253230617425323031312e30342e3530253230414d2e706e67&path=Screen+Shot+2016-03-16+at+11.04.50+AM.png&repository_id=52154305#e103284f-a33c-43c6-8f1b-ea3b2dc00d58
  [10]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d31362532306174253230342e30352e3335253230504d2e706e67&path=Screen+Shot+2016-03-16+at+4.05.35+PM.png&repository_id=52154305#2f60f033-838f-405a-92de-f86083a8ed20
  [11]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d31362532306174253230342e30352e3431253230504d2e706e67&path=Screen+Shot+2016-03-16+at+4.05.41+PM.png&repository_id=52154305#e25314df-6342-4ebc-9607-653abe241664
  [12]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d31362532306174253230342e30352e3532253230504d2e706e67&path=Screen+Shot+2016-03-16+at+4.05.52+PM.png&repository_id=52154305#85e8bcb0-d0e8-4764-9dc9-0b8de5abac3a
  [13]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d31362532306174253230342e30352e3539253230504d2e706e67&path=Screen+Shot+2016-03-16+at+4.05.59+PM.png&repository_id=52154305#629b15d6-6473-4e07-90f6-ffb06cc7f53c
  [14]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d31362532306174253230342e30362e3035253230504d2e706e67&path=Screen+Shot+2016-03-16+at+4.06.05+PM.png&repository_id=52154305#c86d7b0d-4e82-4a28-ac54-d1b4e8f04531
  [15]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d31362532306174253230342e30362e3134253230504d2e706e67&path=Screen+Shot+2016-03-16+at+4.06.14+PM.png&repository_id=52154305#5b7ef4ee-4bee-43a6-83d9-a9d3c894c7b6
  [16]: https://render.githubusercontent.com/added/img?commit=35f716916709433c5c9a5b9ba70233b2299e5d51&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f7a683377346e672f646f636b65722d6861646f6f702f333566373136393136373039343333633563396135623962613730323333623232393965356435312f53637265656e25323053686f74253230323031362d30332d31362532306174253230342e30362e3138253230504d2e706e67&path=Screen+Shot+2016-03-16+at+4.06.18+PM.png&repository_id=52154305#870c0168-60d1-49b4-acab-5d9204a21038
