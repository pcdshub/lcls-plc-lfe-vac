@echo off
echo Your development environment Net ID is: 198.129.119.34.1.1
echo.
echo You must fully exit TwinCAT for this IOC to work.
echo Please close TwinCAT now and
pause
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "C:\repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Users\pcds\Documents\Visual Studio 2013\Projects\lcls-plc-lfe-vac\PLC_LFE_VAC\\:/reg/g/pcds/epics/ioc/PLC_LFE_VAC" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
        "make -C ${ADS_IOC_PATH}/iocBoot/templates && cd '/reg/g/pcds/epics/ioc/PLC_LFE_VAC/iocBoot/ioc-PLC-LFE-VAC' && make && sed -i '/^adsIoc_registerRecord.*$/a adsSetLocalAddress(198.129.119.34.1.1)' st.cmd && ./st.cmd; echo 'IOC exited.'; sleep 1"
pause
