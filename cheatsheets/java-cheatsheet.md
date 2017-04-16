java-cheatsheet
===================

A cheatsheet on the usage of java.

```sh
java -cp $(echo *.jar | tr ' ' ':') <MainClass> <Arguments>
```

// Run java with cli parameter with "-D"
 
// Get cli parameter
System.getProperty();
 
// Activate Remote Debugging on JVM via Java Debug Wire Protocol (JDWP)
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=7777
 
// Listening for a debugger to connect: Yes or No
// No: JVM tries to connect to a debugger under the "address" field
server=y/n
 
// JVM waits for a debugger to connect -> Halts execution until a debugger connects to it
suspend=y/n
 
// Port for a debugger to connect to
address=7777
 
// Make a JAR available to all programs that run on a JVM. 
Put the JAR in <JDK>/jre/lib/ext
 
// JAR Tool
jar [actionoptions] [Manifest] <filename> input1 [input2]
 
// Actionoptions
c: Create a JAR out of the resources specified in input1, input2 etc. Resources are files and directories
t: Show the content of the archive in the console (Table of contents)
x: Extracts the specified files from the archive to the current directory
u: Overrides or creates (updates) the specified file in the archive
f: The next parameter is the archive file (almost used in every action)
v: Prints a detailed protocol of the executed actions (verbose)
m: Creates a Manifest file with meta infos in the JAR
 
// Create JAR
jar cvf Tetris.jar *.class images sounds
 
// Show JAR contents
jar tvf Tetris.jar
 
// Modify JAR contents
jar uf Tetris.jar Readme.md
 
// Extract all contents from JAR
jar xf Tetris.jar
 
// Extract specific file from JAR
jar xf Tetris.jar Readme.md
 
// Start class in JAR
java -cp <archive.jar> <mypackage.Main-Class>
 
// Create JAR with specific manifest
// --> JAR structure: "classes/de/tetris/App.class"
// --> Start the JAR wouldn't work "java -jar Tetris.jar": Main-Class de.tetris.App couln't be found
//     because of the "classes/" folder in the JAR
jar cvfm Tetris.jar manifest.txt classes/
 
// Create JAR without the "classes" folder in the archive
// --> JAR stucture: "de/tetris/App.class"
jar cvfm Tetris.jar manifest.txt -C classes .
 
// Load file from JAR relative to the project root directory
final URL fileUrl = App.class.getClassLoader().getResource(filename);
 
// Load file from JAR relative to the current .class file
final URL fileUrl = App.class.getResource(filename);