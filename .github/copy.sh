          oldIFS="$IFS"
          IFS=,
          cd ${GITHUB_WORKSPACE}
          cp --parents $list /tmp/changed/
          IFS=$oldIFS