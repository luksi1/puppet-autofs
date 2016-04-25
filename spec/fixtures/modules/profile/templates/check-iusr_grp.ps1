$group = [ADSI]"WinNT://<% server_name %>/<% local_group_name %>,group"
$group.Name