window.shell = function(command){
	alert(Uzbl.run("spawn sh -u web -c " + command));
	return Uzbl.run("spawn sh -u web -c " + command);
}

//window.sudo = function(command){
//	return Uzbl.run("spawn Xdialog --yesno Are you sure you want to give " + window.location + " root priveleges? It will run command: " + command + " 10 120 --fill --stdout --default-no; if [ $? == 0 ]; then " + command + ";fi;");
//}
