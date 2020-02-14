@echo off
echo Your development environment Net ID is: UNKNOWN
echo.
echo You must fully exit TwinCAT for this IOC to work.
echo Please close TwinCAT now and
pause
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "C:\Repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Repos\lcls-plc-lfe-vac\plc_lfe_vac\:/reg/g/pcds/epics/ioc/plc_lfe_vac" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
        "make -C ${ADS_IOC_PATH}/iocBoot/templates && cd '/reg/g/pcds/epics/ioc/plc_lfe_vac/iocBoot/ioc-plc-lfe-vac' && make && sed -i '/^adsIoc_registerRecord.*$/a adsSetLocalAddress(UNKNOWN)' st.cmd && ./st.cmd; echo 'IOC exited.'; sleep 1"
pause
