@echo off
echo Starting Typhon...
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "C:\repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Users\pcds\Documents\Visual Studio 2013\Projects\lcls-plc-lfe-vac\PLC_LFE_VAC\\:/reg/g/pcds/epics/ioc/PLC_LFE_VAC" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
	"cd '/reg/g/pcds/epics/ioc/PLC_LFE_VAC/iocBoot/ioc-PLC-LFE-VAC' && pytmc stcmd --template-path /ads-deploy/tools/templates --template typhon_display.py --only-motor """/reg/g/pcds/epics/ioc/PLC_LFE_VAC/PLC_LFE_VAC/PLC_LFE_VAC.tsproj""" > /tmp/display.py && echo 'Running Typhon...' && python /tmp/display.py; sleep 1"
