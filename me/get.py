import os
import json 
import subprocess

output = subprocess.check_output("DIR=$(dirname $0); . $DIR/../env.vars; apic me:get -s $CLOUD_ADMIN_SERVER --format json", shell=True)
output_file=output.split()[1]

with open(output_file, 'r') as f:
  meJsonData  = json.load(f)
print('username: ' + meJsonData['username'])
print('email: ' + meJsonData['email'])

os.system('rm {}'.format(output_file))