function deploygeosuite
    set target $argv[1]
    set local_path ~/develop/repos/mis/sw/ims/ims4/Web/src/main/webapp
    set remote_path /opt/ims/tomcat/webapps/ims

    # Create necessary directories on remote
    ssh root@$target "mkdir -p $remote_path/js2/fragments/geosuite"
    ssh root@$target "mkdir -p $remote_path/css2/fragments/geosuite"

    # Transfer the geosuite folder
    rsync -avz $local_path/js2/fragments/geosuite/ root@$target:$remote_path/js2/fragments/geosuite/

    # Transfer the scss file
    rsync -avz $local_path/css2/fragments/geosuite/geoSuite.scss root@$target:$remote_path/css2/fragments/geosuite/
end
