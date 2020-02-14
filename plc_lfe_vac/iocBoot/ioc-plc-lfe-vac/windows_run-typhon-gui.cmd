@echo off
echo Starting Typhon...
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "C:\Repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Repos\lcls-plc-lfe-vac\plc_lfe_vac\:/reg/g/pcds/epics/ioc/plc_lfe_vac" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
	"cd '/reg/g/pcds/epics/ioc/plc_lfe_vac/iocBoot/ioc-plc-lfe-vac' && pytmc stcmd --template-path /ads-deploy/tools/templates --template typhon_display.py --only-motor """/reg/g/pcds/epics/ioc/plc_lfe_vac/plc_lfe_vac/plc_lfe_vac.tsproj""" > /tmp/display.py && echo 'Running Typhon...' && python /tmp/display.py; sleep 1"
