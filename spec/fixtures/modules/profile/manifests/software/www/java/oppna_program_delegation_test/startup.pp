class profile::software::www::java::oppna_program_delegation_test::startup {
	
	rclocal::script { "start-oppna-program-delegation-test":
		priority => "2",
		content  => "su - delegation-test -c \"cd /home/delegation-test/service/; nohup /usr/bin/java -jar oppna-program-delegation-service-core-bc-module-intsvc.jar > /tmp/oppna-program-delegation-test.log &\"\n",
	}
}
