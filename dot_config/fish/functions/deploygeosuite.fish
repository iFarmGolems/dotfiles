function deploygeosuite
    set local_path ~/develop/repos/mis/sw/ims/ims4/Web/src/main/webapp
    set remote_path /opt/ims/tomcat/webapps/ims

    for target in $argv
        # Create necessary directories on remote
        ssh root@$target "mkdir -p $remote_path/js2/fragments/geosuite"
        ssh root@$target "mkdir -p $remote_path/css2/fragments/geosuite"
        ssh root@$target "mkdir -p $remote_path/build/dist/lib/thermodiagram"

        # Transfer the geosuite folder
        rsync -avz $local_path/js2/fragments/geosuite/ root@$target:$remote_path/js2/fragments/geosuite/

        # Transfer the scss file
        rsync -avz $local_path/css2/fragments/geosuite/geoSuite.scss root@$target:$remote_path/css2/fragments/geosuite/

        # Transfer the thermodiagram library
        rsync -avz $local_path/build/dist/lib/thermodiagram/ root@$target:$remote_path/build/dist/lib/thermodiagram/
    end
end
