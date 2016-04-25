class profile::software::www::java::oppna_program_delegation::startup {
	
	rclocal::script { "start-oppna-program-delegation":
		priority => "1",
		content  => "su - delegation -c \"cd /home/delegation/service/; nohup /usr/bin/java -jar oppna-program-delegation-service-core-bc-module-intsvc.jar > /tmp/oppna-program-delegation.log &\"\n",
	}
}
