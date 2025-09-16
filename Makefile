default:
	git pull
	helm upgrade -i $(component) . -f env-$(env)/$(component).yaml

debug:
	git pull
	helm upgrade -i $(component) . -f env-$(env)/$(component).yaml --debug

dev: 
	git pull
	for chart in frontend catalogue cart shipping payment user; do make env=dev component=$$chart ; done

uninstall:
	git pull
	helm uninstall frontend 
	helm uninstall catalogue  
	helm uninstall  cart  
	helm uninstall  shipping  
	helm uninstall  payment  
	helm uninstall  user  	