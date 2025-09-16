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
	helm uninstall -i frontend . -f env-dev/frontend.yaml 
	helm uninstall -i catalogue . -f env-dev/catalogue.yaml 
	helm uninstall -i cart . -f env-dev/cart.yaml 
	helm uninstall -i shipping . -f env-dev/shipping.yaml 
	helm uninstall -i payment . -f env-dev/payment.yaml 
	helm uninstall -i user . -f env-dev/user.yaml 	