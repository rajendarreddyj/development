jvm-options-cheatsheet
===================

A cheatsheet on the usage of jvm options.

#### jvm memory

#### Garbage Collection
* `-XX:+UseSerialGC` To use Serial Garbage Collector.
* `-XX:+UseParallelGC` To use Parallel Garbage Collector.
* `-XX:ParallelGCThreads=<N>` To Control numbers of garbage collector threads.
* `-XX:MaxGCPauseMillis=<N>` To specify maximum pause time goal (gap [in milliseconds] between two GC.
* `-XX:GCTimeRatio=<N>` To specify maximum throughput target (measured regarding the time spent doing garbage collection versus the time spent outside of garbage collection.
* `-XX:+USeParNewGC` To use Concurrent Mark Sweep(CMS) Garbage Collector.
* `-XX:+UseG1GC` To use Garbage First(G1) Garbage Collector.
* `-XX:+UseStringDeduplication` To optimize the heap memory by removing duplicate String values to a global single char[] array.


