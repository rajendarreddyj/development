ant-cheatsheet
===================

A cheatsheet on the usage of ant
<!-- Ant Properties are immutable -->
 
<!-- Create a Macro. It can reach outside properties with $ and internal properties with @. -->
<macrodef name="testmacro">
    <attribute name="inparam" />
    <attribute name="outparam" />
    <sequential>
        <exec executable="@{inparam}" resultproperty="@{outparam}"/>
    </sequential>
</macrodef>
 
<target name="testtarget">
  <testmacro inparam="cd ~" outparam="exitcode-cd-home" />
  <echo message="Exitcode cd home: ${exitcode-cd-home}" />
   
  <testmacro inparam="cd /" outparam="exitcode-cd-root" />
  <echo message="Exitcode cd root: ${exitcode-cd-root}" />
</target>