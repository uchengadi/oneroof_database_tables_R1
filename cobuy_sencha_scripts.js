



var country = Ext.getStore('Countries');
                var thiscountry = country.findRecord('id', value);
				return thiscountry!== null ? thiscountry.get('name'): value;
				
				
var states = Ext.getStore('States');
                var thisstate = states.findRecord('id', value);
				return thisstate!== null ? thisstate.get('name'): value;		


var city = Ext.getStore('Cities');
                var thiscity = city.findRecord('id', value);
				return thiscity!== null ? thiscity.get('name'): value;	


var type = Ext.getStore('MembershipTypes');
                var membertype = type.findRecord('id', value);
				return membertype!== null ? membertype.get('name'): value;	

				
var Producttype = Ext.getStore('ProductTypes');
                var type = Producttype.findRecord('id', value);
				return type!== null ? type.get('name'): value;					


var fee = Ext.getStore('MembershipFees');
                var MembershipFees = fee.findRecord('id', value);
				return MembershipFees!== null ? MembershipFees.get('amount'): value;	


var containers = Ext.getStore('Containers');
                var thiscontainer = containers.findRecord('id', value);
				return thiscontainer!== null ? thiscontainer.get('name'): value;	


				
var services = Ext.getStore('Services');
                var thisservice = services.findRecord('id', value);
				return thisservice!== null ? thisservice.get('name'): value;		


var category = Ext.getStore('Categories');
                var thiscategory = category.findRecord('id', value);
				return thiscategory!== null ? thiscategory.get('name'): value;	



var products = Ext.getStore('Products');
                var thisproduct = products.findRecord('id', value);
				return thisproduct!== null ? thisproduct.get('name'): value;	



var productConstituents = Ext.getStore('ProductConstituents');
                var thisconstituent = productConstituents.findRecord('id', value);
				return thisconstituent!== null ? thisconstituent.get('name'): value;	
				
				
var userStore = Ext.getStore('AllMembers');
                var user = userStore.findRecord('id', value);
				if(user.get('middlename') === null || user.get('middlename') === undefined){
					var name = user.get('firstname') + " " + user.get('lastname');
				}else{
					var name = user.get('firstname') + " " + user.get('middlename') + " " + user.get('lastname');
				}
				
				return user!== null ? name: value;	
				
				
				
var Number = Ext.getStore('AllMembers');
                var thisnumber = Number.findRecord('id', value);
				return thisnumber!== null ? thisnumber.get('membership_number'): value;					
				
				
				
				
				
var symbol = Ext.getStore('MeasurementSymbols');
                var thissymbol = Symbol.findRecord('id', value);
				return thissymbol!== null ? thissymbol.get('name'): value;	
				

var currency = Ext.getStore('Currencies');
                var thiscurrency = currency.findRecord('id', value);
				return thiscurrency!== null ? thiscurrency.get('name'): value;	


var timezone = Ext.getStore('Timezones');
                var thistimezone = timezone.findRecord('id', value);
				return thistimezone!== null ? thistimezone.get('name'): value;	


var orders = Ext.getStore('Orders');
                var thisorder = orders.findRecord('id', value);
				return thisorder!== null ? thisorder.get('order_number'): value;



var subscription = Ext.getStore('AllSubscriptionPayments');
                var thissubscription = subscription.findRecord('id', value);
				return thissubscription!== null ? thissubscription.get('status'): value;



var delivery = Ext.getStore('OrderDeliveries');
                var thisdelivery = delivery.findRecord('id', value);
				return thisdelivery!== null ? thisdelivery.get('status'): value;	



var payments = Ext.getStore('Payments');
                var thispayment = payments.findRecord('id', value);
				return thispayment!== null ? thispayment.get('status'): value;					
				
				