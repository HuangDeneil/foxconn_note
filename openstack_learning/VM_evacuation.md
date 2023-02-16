



```py
xargs = lo.parse_config_sec()

args = xargs['openrc']
user    =   args['user']
passwd  =   args['passwd']
auth_url=   args['auth_url']
domain  =   args['domain']
project =   args['project']

auth = '--os-username {user} --os-password {passwd} --os-auth-url {url} --os-project-domain-id {projectdomain} --os-project-name {project} --os-user-domain-id {userdomain}'.format(user=user, passwd=passwd, url=auth_url, projectdomain=domain,project=project,userdomain=domain)



p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} runningevacuatestatus'.format(err=err_node),shell=True,stdout=subprocess.PIPE)

    p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} setevacuatestatus20'.format(err=err_node),shell=True,stdout=subprocess.PIPE)

# Check power status via bmc
p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} powerstatus'.format(err=err_node),shell=True,stdout=subprocess.PIPE)

    if shutdown_node :
        logger1.info('Shutdown %s' % err_node)
        p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} poweroffServer'.format(err=err_node),shell=True,stdout=subprocess.PIPE)




# Check nova status first
while True:
    p1=subprocess.Popen('nova {auth} service-list --host  {err_node}'.format(err_node=err_node, auth=auth),shell=True,stdout=subprocess.PIPE)
    p2=subprocess.Popen("grep {err_node}".format(err_node=err_node),shell=True,stdin=p1.stdout,stdout=subprocess.PIPE)
    p3=subprocess.Popen("awk -F \'|\' '{print $7}'",shell=True,stdin=p2.stdout,stdout=subprocess.PIPE)


    cmd = f"""nova {auth} service-list --host  {err_node} | grep {err_node} | """+"awk -F \'|\' '{print $7}' "
    print (subprocess.check_output(f'{cmd}', shell=True, text=True).rstrip())


if node_key:
    paz1=subprocess.Popen('mysql -uroot -pfoxconn -e "select aggregate_hosts.aggregate_id from nova_api.aggregate_hosts where host = \'{err_node}\';"|sed -e \'1d\''.format(err_node=err_node),shell=True,stdout=subprocess.PIPE)

    while True:
		pc1=subprocess.Popen('nova {auth} aggregate-show {ori_zone_id}'.format(ori_zone_id=spare_zone_id,auth=auth),shell=True,stdout=subprocess.PIPE)
		pc2=subprocess.Popen("grep {evac_node}".format(evac_node=evac_node),shell=True,stdin=pc1.stdout,stdout=subprocess.PIPE)
	
    p2=subprocess.Popen('nova {auth} aggregate-add-host {new_zone_id} {evac_node}'.format(new_zone_id=new_zone_id,evac_node=evac_node,auth=auth),shell=True,stdout=subprocess.PIPE)



"""
Step 2. change node's AZ in update  aggregate_hosts set aggregate_id='xx' where id='xx' and deleted='NULL';
"""
print("[*] Step.2 Update spare node")
node_key = []
evac_node = ""
for key in node_mapping:
	node_key.append(key)
if node_key:
        paz1=subprocess.Popen('mysql -uroot -pfoxconn -e "select aggregate_hosts.aggregate_id from nova_api.aggregate_hosts where host = \'{err_node}\';"|sed -e \'1d\''.format(err_node=err_node),shell=True,stdout=subprocess.PIPE)







"""
Step 4
4.  Evacuate VMs to the spare node chosen.
5.  If exception occurs, i.e., some evacuation failed,  do exception handling script. (By exception case we ever had, some db field clean work will be done, and redo the process from step III.
"""

for vm in vmlist:
	if vm:
		logger1.info("Evacuate {vm} to {evac_node}".format(vm=vm,evac_node=evac_node))
		
        p4=subprocess.Popen('nova {auth} evacuate --force {vm} {evac_node}'.format(evac_node=evac_node, auth=auth, vm=vm),shell=True,stdout=subprocess.PIPE)



p5=subprocess.Popen('nova {auth} list --all --host {node}'.format(node=evac_node, auth=auth),shell=True,stdout=subprocess.PIPE)
p6=subprocess.Popen("awk 'NR>3{print $2}'",shell=True,stdin=p5.stdout,stdout=subprocess.PIPE)

```