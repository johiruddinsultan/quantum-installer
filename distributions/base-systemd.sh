function install_init {
	if [ ! -d /etc/systemd/system ]; then
		_error "/etc/systemd/system does not exist. Is systemd installed?" 8
	fi
	cp /tmp/quantumx/contrib/systemd/quantumx.service /etc/systemd/system/quantumx.service
	cp /tmp/quantumx/contrib/systemd/quantumx.conf /etc/
	if [ $USE_ROCKSDB == 1 ]; then
		echo -e "\nDB_ENGINE=rocksdb" >> /etc/quantumx.conf
	fi
	systemctl daemon-reload
	systemctl enable quantumx
	systemctl status quantumx
	_info "Use service quantumx start to start quantumx once it's configured"
}
