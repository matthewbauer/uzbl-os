(function() {
	var run = Uzbl.run;

	self.shell = function(command){
		return run("sync_sh 'su web -c \"" + command + "\"'");
	}

	self.sudo = function(command){
		return run("sync_sh \"Xdialog --yesno Are you sure you want to give " + window.location + " root priveleges? It will run command: " + command + " 10 120 --fill --stdout --default-no; [ $? == 0 ] && '" + command + "'\"");
	}
})();
