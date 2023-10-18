          oldIFS="$IFS"
          IFS=,
          cd /tmp/repo
          rm -rf $list 
          IFS=$oldIFS