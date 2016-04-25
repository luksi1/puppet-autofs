$objOu = [ADSI]"WinNT://<% server_name") %>
$objUser = $objOU.Create("Group", <%= local_group_name %>)
$objUser.SetInfo()
$objUser.description = "<%= local_group_description %>"
$objUser.SetInfo()
$objOU = [ADSI]"WinNT://<% server_name %>/<% local_group_name %>,group"
$objOU.add("WinNT://LOCAL SERVICE")
$objOU.add("WinNT://NETWORK SERVICE")