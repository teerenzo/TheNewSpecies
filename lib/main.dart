// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:newspecies/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/pages/splash.dart';
import 'package:newspecies/store/cart.dart';
import 'package:newspecies/store/chechOut.dart';
import 'package:newspecies/store/wishList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartStore>(create: (context) {
          return CartStore();
        }),
        ChangeNotifierProvider<WishListStore>(create: (context) {
          return WishListStore();
        }),
        ChangeNotifierProvider<CheckOutStore>(create: (context) {
          return CheckOutStore();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}

var tee = [
 
  
   
  {
    "id": "cod",
    "title": "Cash on delivery",
    "description": "Pay with cash upon delivery.",
    "order": 2,
    "enabled": true,
    "method_title": "Cash on delivery",
    "method_description":
        "Have your customers pay with cash (or by other means) upon delivery.",
    "method_supports": ["products"],
    "settings": {
      "title": {
        "id": "title",
        "label": "Title",
        "description":
            "Payment method description that the customer will see on your checkout.",
        "type": "text",
        "value": "Cash on delivery",
        "default": "Cash on delivery",
        "tip":
            "Payment method description that the customer will see on your checkout.",
        "placeholder": ""
      },
      "instructions": {
        "id": "instructions",
        "label": "Instructions",
        "description": "Instructions that will be added to the thank you page.",
        "type": "textarea",
        "value": "Pay with cash upon delivery.",
        "default": "Pay with cash upon delivery.",
        "tip": "Instructions that will be added to the thank you page.",
        "placeholder": ""
      },
      "enable_for_methods": {
        "id": "enable_for_methods",
        "label": "Enable for shipping methods",
        "description":
            "If COD is only available for certain methods, set it up here. Leave blank to enable for all methods.",
        "type": "multiselect",
        "value": "",
        "default": "",
        "tip":
            "If COD is only available for certain methods, set it up here. Leave blank to enable for all methods.",
        "placeholder": "",
        "options": {
          "Flat rate": {
            "flat_rate": "Any &quot;Flat rate&quot; method",
            "flat_rate:1": "Rwanda &ndash; Delivery fees (#1)",
            "flat_rate:4": "Everywhere &ndash; Flat rate (#4)"
          },
          "Free shipping": {
            "free_shipping": "Any &quot;Free shipping&quot; method",
            "free_shipping:5": "Rwanda &ndash; Free shipping (#5)",
            "free_shipping:2": "Everywhere &ndash; Free shipping (#2)"
          },
          "Local pickup": {
            "local_pickup": "Any &quot;Local pickup&quot; method",
            "local_pickup:6": "Rwanda &ndash; In store pickup (#6)",
            "local_pickup:3": "Everywhere &ndash; Local pickup (#3)"
          }
        }
      },
      "enable_for_virtual": {
        "id": "enable_for_virtual",
        "label": "Accept COD if the order is virtual",
        "description": "",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip": "",
        "placeholder": ""
      }
    },
    "needs_setup": false,
    "post_install_scripts": [],
    "settings_url":
        "https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=cod",
    "connection_url": null,
    "setup_help_text": null,
    "required_settings_keys": [],
    "_links": {
      "self": [
        {"href": "https://thenewspecies.com/wp-json/wc/v3/payment_gateways/cod"}
      ],
      "collection": [
        {"href": "https://thenewspecies.com/wp-json/wc/v3/payment_gateways"}
      ]
    }
  },
  {
    "id": "paypal",
    "title": "PayPal",
    "description":
        "Pay via PayPal; you can pay with your credit card if you don't have a PayPal account.",
    "order": 3,
    "enabled": false,
    "method_title": "PayPal Standard",
    "method_description":
        "PayPal Standard redirects customers to PayPal to enter their payment information.",
    "method_supports": ["products", "refunds"],
    "settings": {
      "title": {
        "id": "title",
        "label": "Title",
        "description":
            "This controls the title which the user sees during checkout.",
        "type": "text",
        "value": "PayPal",
        "default": "PayPal",
        "tip": "This controls the title which the user sees during checkout.",
        "placeholder": ""
      },
      "email": {
        "id": "email",
        "label": "PayPal email",
        "description":
            "Please enter your PayPal email address; this is needed in order to take payment.",
        "type": "email",
        "value": "info@thenewspecies.com",
        "default": "info@thenewspecies.com",
        "tip":
            "Please enter your PayPal email address; this is needed in order to take payment.",
        "placeholder": "you@youremail.com"
      },
      "advanced": {
        "id": "advanced",
        "label": "Advanced options",
        "description": "",
        "type": "title",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "testmode": {
        "id": "testmode",
        "label": "Enable PayPal sandbox",
        "description":
            "PayPal sandbox can be used to test payments. Sign up for a <a href=\"https://developer.paypal.com/\">developer account</a>.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "PayPal sandbox can be used to test payments. Sign up for a <a href=\"https://developer.paypal.com/\">developer account</a>.",
        "placeholder": ""
      },
      "debug": {
        "id": "debug",
        "label": "Enable logging",
        "description":
            "Log PayPal events, such as IPN requests, inside <code>/home2/thenewsp/public_html/wp-content/uploads/wc-logs/paypal-2022-03-16-ae0b55b320fdc1cbd7649e7ae7139fac.log</code> Note: this may log personal information. We recommend using this for debugging purposes only and deleting the logs when finished.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "Log PayPal events, such as IPN requests, inside <code>/home2/thenewsp/public_html/wp-content/uploads/wc-logs/paypal-2022-03-16-ae0b55b320fdc1cbd7649e7ae7139fac.log</code> Note: this may log personal information. We recommend using this for debugging purposes only and deleting the logs when finished.",
        "placeholder": ""
      },
      "ipn_notification": {
        "id": "ipn_notification",
        "label": "Enable IPN email notifications",
        "description":
            "Send notifications when an IPN is received from PayPal indicating refunds, chargebacks and cancellations.",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "Send notifications when an IPN is received from PayPal indicating refunds, chargebacks and cancellations.",
        "placeholder": ""
      },
      "receiver_email": {
        "id": "receiver_email",
        "label": "Receiver email",
        "description":
            "If your main PayPal email differs from the PayPal email entered above, input your main receiver email for your PayPal account here. This is used to validate IPN requests.",
        "type": "email",
        "value": "info@thenewspecies.com",
        "default": "",
        "tip":
            "If your main PayPal email differs from the PayPal email entered above, input your main receiver email for your PayPal account here. This is used to validate IPN requests.",
        "placeholder": "you@youremail.com"
      },
      "identity_token": {
        "id": "identity_token",
        "label": "PayPal identity token",
        "description":
            "Optionally enable \"Payment Data Transfer\" (Profile > Profile and Settings > My Selling Tools > Website Preferences) and then copy your identity token here. This will allow payments to be verified without the need for PayPal IPN.",
        "type": "text",
        "value": "",
        "default": "",
        "tip":
            "Optionally enable \"Payment Data Transfer\" (Profile > Profile and Settings > My Selling Tools > Website Preferences) and then copy your identity token here. This will allow payments to be verified without the need for PayPal IPN.",
        "placeholder": ""
      },
      "invoice_prefix": {
        "id": "invoice_prefix",
        "label": "Invoice prefix",
        "description":
            "Please enter a prefix for your invoice numbers. If you use your PayPal account for multiple stores ensure this prefix is unique as PayPal will not allow orders with the same invoice number.",
        "type": "text",
        "value": "WC-",
        "default": "WC-",
        "tip":
            "Please enter a prefix for your invoice numbers. If you use your PayPal account for multiple stores ensure this prefix is unique as PayPal will not allow orders with the same invoice number.",
        "placeholder": ""
      },
      "send_shipping": {
        "id": "send_shipping",
        "label": "Send shipping details to PayPal instead of billing.",
        "description":
            "PayPal allows us to send one address. If you are using PayPal for shipping labels you may prefer to send the shipping address rather than billing. Turning this option off may prevent PayPal Seller protection from applying.",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "PayPal allows us to send one address. If you are using PayPal for shipping labels you may prefer to send the shipping address rather than billing. Turning this option off may prevent PayPal Seller protection from applying.",
        "placeholder": ""
      },
      "address_override": {
        "id": "address_override",
        "label":
            "Enable \"address_override\" to prevent address information from being changed.",
        "description":
            "PayPal verifies addresses therefore this setting can cause errors (we recommend keeping it disabled).",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "PayPal verifies addresses therefore this setting can cause errors (we recommend keeping it disabled).",
        "placeholder": ""
      },
      "paymentaction": {
        "id": "paymentaction",
        "label": "Payment action",
        "description":
            "Choose whether you wish to capture funds immediately or authorize payment only.",
        "type": "select",
        "value": "sale",
        "default": "sale",
        "tip":
            "Choose whether you wish to capture funds immediately or authorize payment only.",
        "placeholder": "",
        "options": {"sale": "Capture", "authorization": "Authorize"}
      },
      "image_url": {
        "id": "image_url",
        "label": "Image url",
        "description":
            "Optionally enter the URL to a 150x50px image displayed as your logo in the upper left corner of the PayPal checkout pages.",
        "type": "text",
        "value": "",
        "default": "",
        "tip":
            "Optionally enter the URL to a 150x50px image displayed as your logo in the upper left corner of the PayPal checkout pages.",
        "placeholder": "Optional"
      },
      "api_details": {
        "id": "api_details",
        "label": "API credentials",
        "description":
            "Enter your PayPal API credentials to process refunds via PayPal. Learn how to access your <a href=\"https://developer.paypal.com/webapps/developer/docs/classic/api/apiCredentials/#create-an-api-signature\">PayPal API Credentials</a>.",
        "type": "title",
        "value": "",
        "default": "",
        "tip":
            "Enter your PayPal API credentials to process refunds via PayPal. Learn how to access your <a href=\"https://developer.paypal.com/webapps/developer/docs/classic/api/apiCredentials/#create-an-api-signature\">PayPal API Credentials</a>.",
        "placeholder": ""
      },
      "api_username": {
        "id": "api_username",
        "label": "Live API username",
        "description": "Get your API credentials from PayPal.",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional"
      },
      "api_password": {
        "id": "api_password",
        "label": "Live API password",
        "description": "Get your API credentials from PayPal.",
        "type": "password",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional"
      },
      "api_signature": {
        "id": "api_signature",
        "label": "Live API signature",
        "description": "Get your API credentials from PayPal.",
        "type": "password",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional"
      },
      "sandbox_api_username": {
        "id": "sandbox_api_username",
        "label": "Sandbox API username",
        "description": "Get your API credentials from PayPal.",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional"
      },
      "sandbox_api_password": {
        "id": "sandbox_api_password",
        "label": "Sandbox API password",
        "description": "Get your API credentials from PayPal.",
        "type": "password",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional"
      },
      "sandbox_api_signature": {
        "id": "sandbox_api_signature",
        "label": "Sandbox API signature",
        "description": "Get your API credentials from PayPal.",
        "type": "password",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional"
      }
    },
    "needs_setup": false,
    "post_install_scripts": [],
    "settings_url":
        "https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=paypal",
    "connection_url": null,
    "setup_help_text": null,
    "required_settings_keys": [],
    "_links": {
      "self": [
        {
          "href":
              "https://thenewspecies.com/wp-json/wc/v3/payment_gateways/paypal"
        }
      ],
      "collection": [
        {"href": "https://thenewspecies.com/wp-json/wc/v3/payment_gateways"}
      ]
    }
  },
  {
    "id": "ppec_paypal",
    "title": "PayPal Checkout",
    "description": "",
    "order": 4,
    "enabled": false,
    "method_title": "PayPal Checkout",
    "method_description":
        "Allow customers to conveniently checkout directly with PayPal.",
    "method_supports": ["products", "refunds"],
    "settings": {
      "title": {
        "id": "title",
        "label": "Title",
        "description":
            "This controls the title which the user sees during checkout.",
        "type": "text",
        "value": "PayPal",
        "default": "PayPal",
        "tip": "This controls the title which the user sees during checkout.",
        "placeholder": ""
      },
      "account_settings": {
        "id": "account_settings",
        "label": "Account Settings",
        "description": "",
        "type": "title",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "environment": {
        "id": "environment",
        "label": "Environment",
        "description":
            "This setting specifies whether you will process live transactions, or whether you will process simulated transactions using the PayPal Sandbox.",
        "type": "select",
        "value": "live",
        "default": "live",
        "tip":
            "This setting specifies whether you will process live transactions, or whether you will process simulated transactions using the PayPal Sandbox.",
        "placeholder": "",
        "options": {"live": "Live", "sandbox": "Sandbox"}
      },
      "api_credentials": {
        "id": "api_credentials",
        "label": "API Credentials",
        "description":
            "<a href=\"https://connect.woocommerce.com/login/ppe?redirect=https%3A%2F%2Fthenewspecies.com%2Fwp-admin%2Fadmin.php%3Fpage%3Dwc-settings%26tab%3Dcheckout%26section%3Dppec_paypal%26env%3Dlive%26wc_ppec_ips_admin_nonce%3Dbec4b12811&#038;countryCode=RW&#038;merchantId=eafa2f2d77b0d496a0cc69a3f65541ad\" class=\"button button-primary\">Setup or link an existing PayPal account</a> or <a href=\"#\" class=\"ppec-toggle-settings\">click here to toggle manual API credential input</a>.<br /><br />To authenticate payments with WooCommerce Shipping & Tax, <a href=\"https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=ppec_paypal&reroute_requests=yes&nonce=4c505badbd&environment=live\">click here</a>.",
        "type": "title",
        "value": "",
        "default": "",
        "tip":
            "<a href=\"https://connect.woocommerce.com/login/ppe?redirect=https%3A%2F%2Fthenewspecies.com%2Fwp-admin%2Fadmin.php%3Fpage%3Dwc-settings%26tab%3Dcheckout%26section%3Dppec_paypal%26env%3Dlive%26wc_ppec_ips_admin_nonce%3Dbec4b12811&#038;countryCode=RW&#038;merchantId=eafa2f2d77b0d496a0cc69a3f65541ad\" class=\"button button-primary\">Setup or link an existing PayPal account</a> or <a href=\"#\" class=\"ppec-toggle-settings\">click here to toggle manual API credential input</a>.<br /><br />To authenticate payments with WooCommerce Shipping & Tax, <a href=\"https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=ppec_paypal&reroute_requests=yes&nonce=4c505badbd&environment=live\">click here</a>.",
        "placeholder": ""
      },
      "api_username": {
        "id": "api_username",
        "label": "Live API Username",
        "description": "Get your API credentials from PayPal.",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": ""
      },
      "api_password": {
        "id": "api_password",
        "label": "Live API Password",
        "description": "Get your API credentials from PayPal.",
        "type": "password",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": ""
      },
      "api_signature": {
        "id": "api_signature",
        "label": "Live API Signature",
        "description": "Get your API credentials from PayPal.",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional if you provide a certificate below"
      },
      "api_certificate": {
        "id": "api_certificate",
        "label": "Live API Certificate",
        "description": "No API certificate on file.",
        "type": "file",
        "value": "",
        "default": "",
        "tip": "No API certificate on file.",
        "placeholder": ""
      },
      "api_subject": {
        "id": "api_subject",
        "label": "Live API Subject",
        "description":
            "If you're processing transactions on behalf of someone else's PayPal account, enter their email address or Secure Merchant Account ID (also known as a Payer ID) here. Generally, you must have API permissions in place with the other account in order to process anything other than \"sale\" transactions for them.",
        "type": "text",
        "value": "",
        "default": "",
        "tip":
            "If you're processing transactions on behalf of someone else's PayPal account, enter their email address or Secure Merchant Account ID (also known as a Payer ID) here. Generally, you must have API permissions in place with the other account in order to process anything other than \"sale\" transactions for them.",
        "placeholder": "Optional"
      },
      "sandbox_api_credentials": {
        "id": "sandbox_api_credentials",
        "label": "Sandbox API Credentials",
        "description":
            "<a href=\"https://connect.woocommerce.com/login/ppesandbox?redirect=https%3A%2F%2Fthenewspecies.com%2Fwp-admin%2Fadmin.php%3Fpage%3Dwc-settings%26tab%3Dcheckout%26section%3Dppec_paypal%26env%3Dsandbox%26wc_ppec_ips_admin_nonce%3Dbec4b12811&#038;countryCode=RW&#038;merchantId=eafa2f2d77b0d496a0cc69a3f65541ad\" class=\"button button-primary\">Setup or link an existing PayPal Sandbox account</a> or <a href=\"#\" class=\"ppec-toggle-sandbox-settings\">click here to toggle manual API credential input</a>.<br /><br />To authenticate payments with WooCommerce Shipping & Tax, <a href=\"https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=ppec_paypal&reroute_requests=yes&nonce=4c505badbd&environment=sandbox\">click here</a>.",
        "type": "title",
        "value": "",
        "default": "",
        "tip":
            "<a href=\"https://connect.woocommerce.com/login/ppesandbox?redirect=https%3A%2F%2Fthenewspecies.com%2Fwp-admin%2Fadmin.php%3Fpage%3Dwc-settings%26tab%3Dcheckout%26section%3Dppec_paypal%26env%3Dsandbox%26wc_ppec_ips_admin_nonce%3Dbec4b12811&#038;countryCode=RW&#038;merchantId=eafa2f2d77b0d496a0cc69a3f65541ad\" class=\"button button-primary\">Setup or link an existing PayPal Sandbox account</a> or <a href=\"#\" class=\"ppec-toggle-sandbox-settings\">click here to toggle manual API credential input</a>.<br /><br />To authenticate payments with WooCommerce Shipping & Tax, <a href=\"https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=ppec_paypal&reroute_requests=yes&nonce=4c505badbd&environment=sandbox\">click here</a>.",
        "placeholder": ""
      },
      "sandbox_api_username": {
        "id": "sandbox_api_username",
        "label": "Sandbox API Username",
        "description": "Get your API credentials from PayPal.",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": ""
      },
      "sandbox_api_password": {
        "id": "sandbox_api_password",
        "label": "Sandbox API Password",
        "description": "Get your API credentials from PayPal.",
        "type": "password",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": ""
      },
      "sandbox_api_signature": {
        "id": "sandbox_api_signature",
        "label": "Sandbox API Signature",
        "description": "Get your API credentials from PayPal.",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "Get your API credentials from PayPal.",
        "placeholder": "Optional if you provide a certificate below"
      },
      "sandbox_api_certificate": {
        "id": "sandbox_api_certificate",
        "label": "Sandbox API Certificate",
        "description": "No API certificate on file.",
        "type": "file",
        "value": "",
        "default": "",
        "tip": "No API certificate on file.",
        "placeholder": ""
      },
      "sandbox_api_subject": {
        "id": "sandbox_api_subject",
        "label": "Sandbox API Subject",
        "description":
            "If you're processing transactions on behalf of someone else's PayPal account, enter their email address or Secure Merchant Account ID (also known as a Payer ID) here. Generally, you must have API permissions in place with the other account in order to process anything other than \"sale\" transactions for them.",
        "type": "text",
        "value": "",
        "default": "",
        "tip":
            "If you're processing transactions on behalf of someone else's PayPal account, enter their email address or Secure Merchant Account ID (also known as a Payer ID) here. Generally, you must have API permissions in place with the other account in order to process anything other than \"sale\" transactions for them.",
        "placeholder": "Optional"
      },
      "paypal_hosted_settings": {
        "id": "paypal_hosted_settings",
        "label": "PayPal-hosted Checkout Settings",
        "description":
            "Customize the appearance of PayPal Checkout on the PayPal side.",
        "type": "title",
        "value": "",
        "default": "",
        "tip":
            "Customize the appearance of PayPal Checkout on the PayPal side.",
        "placeholder": ""
      },
      "brand_name": {
        "id": "brand_name",
        "label": "Brand Name",
        "description":
            "A label that overrides the business name in the PayPal account on the PayPal hosted checkout pages.",
        "type": "text",
        "value": "",
        "default": "",
        "tip":
            "A label that overrides the business name in the PayPal account on the PayPal hosted checkout pages.",
        "placeholder": ""
      },
      "logo_image_url": {
        "id": "logo_image_url",
        "label": "Logo Image (190×60)",
        "description":
            "If you want PayPal to co-brand the checkout page with your logo, enter the URL of your logo image here.<br/>The image must be no larger than 190x60, GIF, PNG, or JPG format, and should be served over HTTPS.",
        "type": "image",
        "value": "",
        "default": "",
        "tip":
            "If you want PayPal to co-brand the checkout page with your logo, enter the URL of your logo image here.<br/>The image must be no larger than 190x60, GIF, PNG, or JPG format, and should be served over HTTPS.",
        "placeholder": "Optional"
      },
      "header_image_url": {
        "id": "header_image_url",
        "label": "Header Image (750×90)",
        "description":
            "If you want PayPal to co-brand the checkout page with your header, enter the URL of your header image here.<br/>The image must be no larger than 750x90, GIF, PNG, or JPG format, and should be served over HTTPS.",
        "type": "image",
        "value": "",
        "default": "",
        "tip":
            "If you want PayPal to co-brand the checkout page with your header, enter the URL of your header image here.<br/>The image must be no larger than 750x90, GIF, PNG, or JPG format, and should be served over HTTPS.",
        "placeholder": "Optional"
      },
      "page_style": {
        "id": "page_style",
        "label": "Page Style",
        "description":
            "Optionally enter the name of the page style you wish to use. These are defined within your PayPal account.",
        "type": "text",
        "value": "",
        "default": "",
        "tip":
            "Optionally enter the name of the page style you wish to use. These are defined within your PayPal account.",
        "placeholder": "Optional"
      },
      "landing_page": {
        "id": "landing_page",
        "label": "Landing Page",
        "description": "Type of PayPal page to display.",
        "type": "select",
        "value": "Login",
        "default": "Login",
        "tip": "Type of PayPal page to display.",
        "placeholder": "",
        "options": {
          "Billing": "Billing (Non-PayPal account)",
          "Login": "Login (PayPal account login)"
        }
      },
      "advanced": {
        "id": "advanced",
        "label": "Advanced Settings",
        "description": "",
        "type": "title",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "debug": {
        "id": "debug",
        "label": "Enable Logging",
        "description": "Log PayPal events, such as IPN requests.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip": "Log PayPal events, such as IPN requests.",
        "placeholder": ""
      },
      "invoice_prefix": {
        "id": "invoice_prefix",
        "label": "Invoice Prefix",
        "description":
            "Please enter a prefix for your invoice numbers. If you use your PayPal account for multiple stores ensure this prefix is unique as PayPal will not allow orders with the same invoice number.",
        "type": "text",
        "value": "WC-",
        "default": "WC-",
        "tip":
            "Please enter a prefix for your invoice numbers. If you use your PayPal account for multiple stores ensure this prefix is unique as PayPal will not allow orders with the same invoice number.",
        "placeholder": ""
      },
      "require_billing": {
        "id": "require_billing",
        "label": "Require Billing Address",
        "description":
            "PayPal only returns a shipping address back to the website. To make sure billing address is returned as well, please enable this functionality on your PayPal account by calling <a href=\"https://www.paypal.com/us/selfhelp/contact/call\">PayPal Technical Support</a>.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "PayPal only returns a shipping address back to the website. To make sure billing address is returned as well, please enable this functionality on your PayPal account by calling <a href=\"https://www.paypal.com/us/selfhelp/contact/call\">PayPal Technical Support</a>.",
        "placeholder": ""
      },
      "require_phone_number": {
        "id": "require_phone_number",
        "label": "Require Phone Number",
        "description":
            "Require buyer to enter their telephone number during checkout if none is provided by PayPal. Disabling this option doesn't affect direct Debit or Credit Card payments offered by PayPal.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "Require buyer to enter their telephone number during checkout if none is provided by PayPal. Disabling this option doesn't affect direct Debit or Credit Card payments offered by PayPal.",
        "placeholder": ""
      },
      "paymentaction": {
        "id": "paymentaction",
        "label": "Payment Action",
        "description":
            "Choose whether you wish to capture funds immediately or authorize payment only.",
        "type": "select",
        "value": "sale",
        "default": "sale",
        "tip":
            "Choose whether you wish to capture funds immediately or authorize payment only.",
        "placeholder": "",
        "options": {"sale": "Sale", "authorization": "Authorize"}
      },
      "instant_payments": {
        "id": "instant_payments",
        "label": "Require Instant Payment",
        "description":
            "If you enable this setting, PayPal will be instructed not to allow the buyer to use funding sources that take additional time to complete (for example, eChecks). Instead, the buyer will be required to use an instant funding source, such as an instant transfer, a credit/debit card, or PayPal Credit.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "If you enable this setting, PayPal will be instructed not to allow the buyer to use funding sources that take additional time to complete (for example, eChecks). Instead, the buyer will be required to use an instant funding source, such as an instant transfer, a credit/debit card, or PayPal Credit.",
        "placeholder": ""
      },
      "subtotal_mismatch_behavior": {
        "id": "subtotal_mismatch_behavior",
        "label": "Subtotal Mismatch Behavior",
        "description":
            "Internally, WC calculates line item prices and taxes out to four decimal places; however, PayPal can only handle amounts out to two decimal places (or, depending on the currency, no decimal places at all). Occasionally, this can cause discrepancies between the way WooCommerce calculates prices versus the way PayPal calculates them. If a mismatch occurs, this option controls how the order is dealt with so payment can still be taken.",
        "type": "select",
        "value": "add",
        "default": "add",
        "tip":
            "Internally, WC calculates line item prices and taxes out to four decimal places; however, PayPal can only handle amounts out to two decimal places (or, depending on the currency, no decimal places at all). Occasionally, this can cause discrepancies between the way WooCommerce calculates prices versus the way PayPal calculates them. If a mismatch occurs, this option controls how the order is dealt with so payment can still be taken.",
        "placeholder": "",
        "options": {
          "add": "Add another line item",
          "drop": "Do not send line items to PayPal"
        }
      },
      "button_settings": {
        "id": "button_settings",
        "label": "Button Settings",
        "description":
            "Customize the appearance of PayPal Checkout on your site.",
        "type": "title",
        "value": "",
        "default": "",
        "tip": "Customize the appearance of PayPal Checkout on your site.",
        "placeholder": ""
      },
      "use_spb": {
        "id": "use_spb",
        "label": "Use Smart Payment Buttons",
        "description":
            "PayPal Checkout's Smart Payment Buttons provide a variety of button customization options, such as color, language, shape, and multiple button layout. <a href=\"https://developer.paypal.com/docs/integration/direct/express-checkout/integration-jsv4/#smart-payment-buttons\">Learn more about Smart Payment Buttons</a>.",
        "type": "checkbox",
        "value": "yes",
        "default": "no",
        "tip":
            "PayPal Checkout's Smart Payment Buttons provide a variety of button customization options, such as color, language, shape, and multiple button layout. <a href=\"https://developer.paypal.com/docs/integration/direct/express-checkout/integration-jsv4/#smart-payment-buttons\">Learn more about Smart Payment Buttons</a>.",
        "placeholder": ""
      },
      "button_color": {
        "id": "button_color",
        "label": "Button Color",
        "description":
            "Controls the background color of the primary button. Use \"Gold\" to leverage PayPal's recognition and preference, or change it to match your site design or aesthetic.",
        "type": "select",
        "value": "gold",
        "default": "gold",
        "tip":
            "Controls the background color of the primary button. Use \"Gold\" to leverage PayPal's recognition and preference, or change it to match your site design or aesthetic.",
        "placeholder": "",
        "options": {
          "gold": "Gold (Recommended)",
          "blue": "Blue",
          "silver": "Silver",
          "black": "Black"
        }
      },
      "button_shape": {
        "id": "button_shape",
        "label": "Button Shape",
        "description":
            "The pill-shaped button's unique and powerful shape signifies PayPal in people's minds. Use the rectangular button as an alternative when pill-shaped buttons might pose design challenges.",
        "type": "select",
        "value": "rect",
        "default": "rect",
        "tip":
            "The pill-shaped button's unique and powerful shape signifies PayPal in people's minds. Use the rectangular button as an alternative when pill-shaped buttons might pose design challenges.",
        "placeholder": "",
        "options": {"pill": "Pill", "rect": "Rectangle"}
      },
      "button_label": {
        "id": "button_label",
        "label": "Button Label",
        "description":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "type": "select",
        "value": "paypal",
        "default": "paypal",
        "tip":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "placeholder": "",
        "options": {
          "paypal": "PayPal",
          "checkout": "PayPal Checkout",
          "buynow": "PayPal Buy Now",
          "pay": "Pay with PayPal"
        }
      },
      "button_layout": {
        "id": "button_layout",
        "label": "Button Layout",
        "description":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "type": "select",
        "value": "vertical",
        "default": "vertical",
        "tip":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "placeholder": "",
        "options": {"vertical": "Vertical", "horizontal": "Horizontal"}
      },
      "button_size": {
        "id": "button_size",
        "label": "Button Size",
        "description":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "type": "select",
        "value": "responsive",
        "default": "responsive",
        "tip":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "placeholder": "",
        "options": {
          "responsive": "Responsive",
          "small": "Small",
          "medium": "Medium",
          "large": "Large"
        }
      },
      "hide_funding_methods": {
        "id": "hide_funding_methods",
        "label": "Hide Funding Method(s)",
        "description": "Hides the specified funding methods.",
        "type": "multiselect",
        "value": ["CARD"],
        "default": ["CARD"],
        "tip": "Hides the specified funding methods.",
        "placeholder": "",
        "options": {
          "CARD": "Credit or debit cards",
          "CREDIT": "PayPal Credit",
          "BANCONTACT": "Bancontact",
          "BLIK": "BLIK",
          "ELV": "ELV",
          "EPS": "eps",
          "GIROPAY": "giropay",
          "IDEAL": "iDEAL",
          "MERCADOPAGO": "MercadoPago",
          "MYBANK": "MyBank",
          "P24": "Przelewy24",
          "SEPA": "SEPA-Lastschrift",
          "SOFORT": "Sofort",
          "VENMO": "Venmo"
        }
      },
      "credit_enabled": {
        "id": "credit_enabled",
        "label":
            "Enable PayPal Credit to eligible customers<p><em>This option is disabled. Currently PayPal Credit only available for U.S. merchants using USD currency.</em></p>",
        "description":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "placeholder": ""
      },
      "credit_message_enabled": {
        "id": "credit_message_enabled",
        "label": "Enable PayPal Credit messages",
        "description":
            "Display credit messages on your website to promote special financing offers, which help increase sales.",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "Display credit messages on your website to promote special financing offers, which help increase sales.",
        "placeholder": ""
      },
      "credit_message_layout": {
        "id": "credit_message_layout",
        "label": "Credit Messaging Layout",
        "description": "The layout of the message.",
        "type": "select",
        "value": "text",
        "default": "text",
        "tip": "The layout of the message.",
        "placeholder": "",
        "options": {"text": "Text", "flex": "Graphic"}
      },
      "credit_message_logo": {
        "id": "credit_message_logo",
        "label": "Credit Messaging logo",
        "description": "PayPal Credit logo used in the message.",
        "type": "select",
        "value": "primary",
        "default": "primary",
        "tip": "PayPal Credit logo used in the message.",
        "placeholder": "",
        "options": {
          "primary": "Primary",
          "alternative": "Alternative",
          "inline": "In-Line",
          "none": "None"
        }
      },
      "credit_message_logo_position": {
        "id": "credit_message_logo_position",
        "label": "Credit Messaging logo position",
        "description": "Position of the PayPal logo in the message.",
        "type": "select",
        "value": "left",
        "default": "left",
        "tip": "Position of the PayPal logo in the message.",
        "placeholder": "",
        "options": {"left": "Left", "right": "Right", "top": "Top"}
      },
      "credit_message_text_color": {
        "id": "credit_message_text_color",
        "label": "Credit Messaging text color",
        "description": "Text and logo color of the message.",
        "type": "select",
        "value": "black",
        "default": "black",
        "tip": "Text and logo color of the message.",
        "placeholder": "",
        "options": {
          "black": "Black",
          "white": "White",
          "monochrome": "Monochrome",
          "grayscale": "Grayscale"
        }
      },
      "credit_message_flex_color": {
        "id": "credit_message_flex_color",
        "label": "Credit Messaging color",
        "description": "Color of the message.",
        "type": "select",
        "value": "black",
        "default": "black",
        "tip": "Color of the message.",
        "placeholder": "",
        "options": {
          "black": "Black",
          "blue": "Blue",
          "monochrome": "Monochrome",
          "gray": "Gray",
          "grayscale": "Grayscale",
          "white": "White",
          "white-no-border": "White no border"
        }
      },
      "credit_message_flex_ratio": {
        "id": "credit_message_flex_ratio",
        "label": "Credit Messaging ratio",
        "description": "Shape and size of the message.",
        "type": "select",
        "value": "1x1",
        "default": "1x1",
        "tip": "Shape and size of the message.",
        "placeholder": "",
        "options": {"1x1": "1x1", "1x4": "1x4", "8x1": "8x1", "20x1": "20x1"}
      },
      "cart_checkout_enabled": {
        "id": "cart_checkout_enabled",
        "label": "Enable PayPal Checkout buttons on the cart page",
        "description": "",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip": "",
        "placeholder": ""
      },
      "mini_cart_settings": {
        "id": "mini_cart_settings",
        "label": "Mini-cart Button Settings",
        "description": "",
        "type": "title",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "mini_cart_settings_toggle": {
        "id": "mini_cart_settings_toggle",
        "label": "Configure settings specific to mini-cart",
        "description":
            "Optionally override global button settings above and configure buttons for this context.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "Optionally override global button settings above and configure buttons for this context.",
        "placeholder": ""
      },
      "mini_cart_button_layout": {
        "id": "mini_cart_button_layout",
        "label": "Button Layout",
        "description":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "type": "select",
        "value": "vertical",
        "default": "vertical",
        "tip":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "placeholder": "",
        "options": {"vertical": "Vertical", "horizontal": "Horizontal"}
      },
      "mini_cart_button_size": {
        "id": "mini_cart_button_size",
        "label": "Button Size",
        "description":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "type": "select",
        "value": "responsive",
        "default": "responsive",
        "tip":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "placeholder": "",
        "options": {
          "responsive": "Responsive",
          "small": "Small",
          "medium": "Medium",
          "large": "Large"
        }
      },
      "mini_cart_button_label": {
        "id": "mini_cart_button_label",
        "label": "Button Label",
        "description":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "type": "select",
        "value": "paypal",
        "default": "paypal",
        "tip":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "placeholder": "",
        "options": {
          "paypal": "PayPal",
          "checkout": "PayPal Checkout",
          "buynow": "PayPal Buy Now",
          "pay": "Pay with PayPal"
        }
      },
      "mini_cart_hide_funding_methods": {
        "id": "mini_cart_hide_funding_methods",
        "label": "Hide Funding Method(s)",
        "description": "Hides the specified funding methods.",
        "type": "multiselect",
        "value": ["CARD"],
        "default": ["CARD"],
        "tip": "Hides the specified funding methods.",
        "placeholder": "",
        "options": {
          "CARD": "Credit or debit cards",
          "CREDIT": "PayPal Credit",
          "BANCONTACT": "Bancontact",
          "BLIK": "BLIK",
          "ELV": "ELV",
          "EPS": "eps",
          "GIROPAY": "giropay",
          "IDEAL": "iDEAL",
          "MERCADOPAGO": "MercadoPago",
          "MYBANK": "MyBank",
          "P24": "Przelewy24",
          "SEPA": "SEPA-Lastschrift",
          "SOFORT": "Sofort",
          "VENMO": "Venmo"
        }
      },
      "mini_cart_credit_enabled": {
        "id": "mini_cart_credit_enabled",
        "label":
            "Enable PayPal Credit to eligible customers<p><em>This option is disabled. Currently PayPal Credit only available for U.S. merchants using USD currency.</em></p>",
        "description":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "placeholder": ""
      },
      "single_product_settings": {
        "id": "single_product_settings",
        "label": "Single Product Button Settings",
        "description": "",
        "type": "title",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "checkout_on_single_product_enabled": {
        "id": "checkout_on_single_product_enabled",
        "label": "Enable PayPal Checkout buttons on the single product page",
        "description": "",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip": "",
        "placeholder": ""
      },
      "single_product_settings_toggle": {
        "id": "single_product_settings_toggle",
        "label": "Configure settings specific to Single Product view",
        "description":
            "Optionally override global button settings above and configure buttons for this context.",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "Optionally override global button settings above and configure buttons for this context.",
        "placeholder": ""
      },
      "single_product_button_layout": {
        "id": "single_product_button_layout",
        "label": "Button Layout",
        "description":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "type": "select",
        "value": "horizontal",
        "default": "horizontal",
        "tip":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "placeholder": "",
        "options": {"vertical": "Vertical", "horizontal": "Horizontal"}
      },
      "single_product_button_size": {
        "id": "single_product_button_size",
        "label": "Button Size",
        "description":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "type": "select",
        "value": "responsive",
        "default": "responsive",
        "tip":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "placeholder": "",
        "options": {
          "responsive": "Responsive",
          "small": "Small",
          "medium": "Medium",
          "large": "Large"
        }
      },
      "single_product_button_label": {
        "id": "single_product_button_label",
        "label": "Button Label",
        "description":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "type": "select",
        "value": "paypal",
        "default": "paypal",
        "tip":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "placeholder": "",
        "options": {
          "paypal": "PayPal",
          "checkout": "PayPal Checkout",
          "buynow": "PayPal Buy Now",
          "pay": "Pay with PayPal"
        }
      },
      "single_product_hide_funding_methods": {
        "id": "single_product_hide_funding_methods",
        "label": "Hide Funding Method(s)",
        "description": "Hides the specified funding methods.",
        "type": "multiselect",
        "value": ["CARD"],
        "default": ["CARD"],
        "tip": "Hides the specified funding methods.",
        "placeholder": "",
        "options": {
          "CARD": "Credit or debit cards",
          "CREDIT": "PayPal Credit",
          "BANCONTACT": "Bancontact",
          "BLIK": "BLIK",
          "ELV": "ELV",
          "EPS": "eps",
          "GIROPAY": "giropay",
          "IDEAL": "iDEAL",
          "MERCADOPAGO": "MercadoPago",
          "MYBANK": "MyBank",
          "P24": "Przelewy24",
          "SEPA": "SEPA-Lastschrift",
          "SOFORT": "Sofort",
          "VENMO": "Venmo"
        }
      },
      "single_product_credit_enabled": {
        "id": "single_product_credit_enabled",
        "label":
            "Enable PayPal Credit to eligible customers<p><em>This option is disabled. Currently PayPal Credit only available for U.S. merchants using USD currency.</em></p>",
        "description":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "placeholder": ""
      },
      "single_product_credit_message_enabled": {
        "id": "single_product_credit_message_enabled",
        "label": "Enable PayPal Credit messages",
        "description":
            "Display credit messages on your website to promote special financing offers, which help increase sales.",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "Display credit messages on your website to promote special financing offers, which help increase sales.",
        "placeholder": ""
      },
      "single_product_credit_message_layout": {
        "id": "single_product_credit_message_layout",
        "label": "Credit Messaging Layout",
        "description": "The layout of the message.",
        "type": "select",
        "value": "text",
        "default": "text",
        "tip": "The layout of the message.",
        "placeholder": "",
        "options": {"text": "Text", "flex": "Graphic"}
      },
      "single_product_credit_message_logo": {
        "id": "single_product_credit_message_logo",
        "label": "Credit Messaging logo",
        "description": "PayPal Credit logo used in the message.",
        "type": "select",
        "value": "primary",
        "default": "primary",
        "tip": "PayPal Credit logo used in the message.",
        "placeholder": "",
        "options": {
          "primary": "Primary",
          "alternative": "Alternative",
          "inline": "In-Line",
          "none": "None"
        }
      },
      "single_product_credit_message_logo_position": {
        "id": "single_product_credit_message_logo_position",
        "label": "Credit Messaging logo position",
        "description": "Position of the PayPal logo in the message.",
        "type": "select",
        "value": "left",
        "default": "left",
        "tip": "Position of the PayPal logo in the message.",
        "placeholder": "",
        "options": {"left": "Left", "right": "Right", "top": "Top"}
      },
      "single_product_credit_message_text_color": {
        "id": "single_product_credit_message_text_color",
        "label": "Credit Messaging text color",
        "description": "Text and logo color of the message.",
        "type": "select",
        "value": "black",
        "default": "black",
        "tip": "Text and logo color of the message.",
        "placeholder": "",
        "options": {
          "black": "Black",
          "white": "White",
          "monochrome": "Monochrome",
          "grayscale": "Grayscale"
        }
      },
      "single_product_credit_message_flex_color": {
        "id": "single_product_credit_message_flex_color",
        "label": "Credit Messaging color",
        "description": "Color of the message.",
        "type": "select",
        "value": "black",
        "default": "black",
        "tip": "Color of the message.",
        "placeholder": "",
        "options": {
          "black": "Black",
          "blue": "Blue",
          "monochrome": "Monochrome",
          "gray": "Gray",
          "grayscale": "Grayscale",
          "white": "White",
          "white-no-border": "White no border"
        }
      },
      "single_product_credit_message_flex_ratio": {
        "id": "single_product_credit_message_flex_ratio",
        "label": "Credit Messaging ratio",
        "description": "Shape and size of the message.",
        "type": "select",
        "value": "1x1",
        "default": "1x1",
        "tip": "Shape and size of the message.",
        "placeholder": "",
        "options": {"1x1": "1x1", "1x4": "1x4", "8x1": "8x1", "20x1": "20x1"}
      },
      "mark_settings": {
        "id": "mark_settings",
        "label": "Regular Checkout Button Settings",
        "description": "",
        "type": "title",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "mark_enabled": {
        "id": "mark_enabled",
        "label": "Enable PayPal Checkout buttons on the regular checkout page",
        "description": "",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip": "",
        "placeholder": ""
      },
      "mark_settings_toggle": {
        "id": "mark_settings_toggle",
        "label": "Configure settings specific to regular checkout",
        "description":
            "Optionally override global button settings above and configure buttons for this context.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip":
            "Optionally override global button settings above and configure buttons for this context.",
        "placeholder": ""
      },
      "mark_button_layout": {
        "id": "mark_button_layout",
        "label": "Button Layout",
        "description":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "type": "select",
        "value": "vertical",
        "default": "vertical",
        "tip":
            "If additional funding sources are available to the buyer through PayPal, such as Venmo, then multiple buttons are displayed in the space provided. Choose \"vertical\" for a dynamic list of alternative and local payment options, or \"horizontal\" when space is limited.",
        "placeholder": "",
        "options": {"vertical": "Vertical", "horizontal": "Horizontal"}
      },
      "mark_button_size": {
        "id": "mark_button_size",
        "label": "Button Size",
        "description":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "type": "select",
        "value": "responsive",
        "default": "responsive",
        "tip":
            "PayPal offers different sizes of the \"PayPal Checkout\" buttons, allowing you to select a size that best fits your site's theme. This setting will allow you to choose which size button(s) appear on your cart page. (The \"Responsive\" option adjusts to container size, and is available and recommended for Smart Payment Buttons.)",
        "placeholder": "",
        "options": {
          "responsive": "Responsive",
          "small": "Small",
          "medium": "Medium",
          "large": "Large"
        }
      },
      "mark_button_label": {
        "id": "mark_button_label",
        "label": "Button Label",
        "description":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "type": "select",
        "value": "paypal",
        "default": "paypal",
        "tip":
            "PayPal offers different labels on the \"PayPal Checkout\" buttons, allowing you to select a suitable label.)",
        "placeholder": "",
        "options": {
          "paypal": "PayPal",
          "checkout": "PayPal Checkout",
          "buynow": "PayPal Buy Now",
          "pay": "Pay with PayPal"
        }
      },
      "mark_hide_funding_methods": {
        "id": "mark_hide_funding_methods",
        "label": "Hide Funding Method(s)",
        "description": "Hides the specified funding methods.",
        "type": "multiselect",
        "value": ["CARD"],
        "default": ["CARD"],
        "tip": "Hides the specified funding methods.",
        "placeholder": "",
        "options": {
          "CARD": "Credit or debit cards",
          "CREDIT": "PayPal Credit",
          "BANCONTACT": "Bancontact",
          "BLIK": "BLIK",
          "ELV": "ELV",
          "EPS": "eps",
          "GIROPAY": "giropay",
          "IDEAL": "iDEAL",
          "MERCADOPAGO": "MercadoPago",
          "MYBANK": "MyBank",
          "P24": "Przelewy24",
          "SEPA": "SEPA-Lastschrift",
          "SOFORT": "Sofort",
          "VENMO": "Venmo"
        }
      },
      "mark_credit_enabled": {
        "id": "mark_credit_enabled",
        "label":
            "Enable PayPal Credit to eligible customers<p><em>This option is disabled. Currently PayPal Credit only available for U.S. merchants using USD currency.</em></p>",
        "description":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "This enables PayPal Credit, which displays a PayPal Credit button next to the primary PayPal Checkout button. PayPal Checkout lets you give customers access to financing through PayPal Credit® - at no additional cost to you. You get paid up front, even though customers have more time to pay. A pre-integrated payment button shows up next to the PayPal Button, and lets customers pay quickly with PayPal Credit®. (Should be unchecked for stores involved in Real Money Gaming.)",
        "placeholder": ""
      },
      "mark_credit_message_enabled": {
        "id": "mark_credit_message_enabled",
        "label": "Enable PayPal Credit messages",
        "description":
            "Display credit messages on your website to promote special financing offers, which help increase sales.",
        "type": "checkbox",
        "value": "yes",
        "default": "yes",
        "tip":
            "Display credit messages on your website to promote special financing offers, which help increase sales.",
        "placeholder": ""
      },
      "mark_credit_message_layout": {
        "id": "mark_credit_message_layout",
        "label": "Credit Messaging Layout",
        "description": "The layout of the message.",
        "type": "select",
        "value": "text",
        "default": "text",
        "tip": "The layout of the message.",
        "placeholder": "",
        "options": {"text": "Text", "flex": "Graphic"}
      },
      "mark_credit_message_logo": {
        "id": "mark_credit_message_logo",
        "label": "Credit Messaging logo",
        "description": "PayPal Credit logo used in the message.",
        "type": "select",
        "value": "primary",
        "default": "primary",
        "tip": "PayPal Credit logo used in the message.",
        "placeholder": "",
        "options": {
          "primary": "Primary",
          "alternative": "Alternative",
          "inline": "In-Line",
          "none": "None"
        }
      },
      "mark_credit_message_logo_position": {
        "id": "mark_credit_message_logo_position",
        "label": "Credit Messaging logo position",
        "description": "Position of the PayPal logo in the message.",
        "type": "select",
        "value": "left",
        "default": "left",
        "tip": "Position of the PayPal logo in the message.",
        "placeholder": "",
        "options": {"left": "Left", "right": "Right", "top": "Top"}
      },
      "mark_credit_message_text_color": {
        "id": "mark_credit_message_text_color",
        "label": "Credit Messaging text color",
        "description": "Text and logo color of the message.",
        "type": "select",
        "value": "black",
        "default": "black",
        "tip": "Text and logo color of the message.",
        "placeholder": "",
        "options": {
          "black": "Black",
          "white": "White",
          "monochrome": "Monochrome",
          "grayscale": "Grayscale"
        }
      },
      "mark_credit_message_flex_color": {
        "id": "mark_credit_message_flex_color",
        "label": "Credit Messaging color",
        "description": "Color of the message.",
        "type": "select",
        "value": "black",
        "default": "black",
        "tip": "Color of the message.",
        "placeholder": "",
        "options": {
          "black": "Black",
          "blue": "Blue",
          "monochrome": "Monochrome",
          "gray": "Gray",
          "grayscale": "Grayscale",
          "white": "White",
          "white-no-border": "White no border"
        }
      },
      "mark_credit_message_flex_ratio": {
        "id": "mark_credit_message_flex_ratio",
        "label": "Credit Messaging ratio",
        "description": "Shape and size of the message.",
        "type": "select",
        "value": "1x1",
        "default": "1x1",
        "tip": "Shape and size of the message.",
        "placeholder": "",
        "options": {"1x1": "1x1", "1x4": "1x4", "8x1": "8x1", "20x1": "20x1"}
      }
    },
    "needs_setup": false,
    "post_install_scripts": [],
    "settings_url":
        "https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=ppec_paypal",
    "connection_url": null,
    "setup_help_text": null,
    "required_settings_keys": [],
    "_links": {
      "self": [
        {
          "href":
              "https://thenewspecies.com/wp-json/wc/v3/payment_gateways/ppec_paypal"
        }
      ],
      "collection": [
        {"href": "https://thenewspecies.com/wp-json/wc/v3/payment_gateways"}
      ]
    }
  },
  {
    "id": "rave",
    "title": "Rave",
    "description":
        "Powered by Flutterwave: Accepts Mastercard, Visa, Verve, Discover, AMEX, Diners Club and Union Pay.",
    "order": 5,
    "enabled": true,
    "method_title": "Rave",
    "method_description":
        "Rave allows you to accept payment from cards and bank accounts in multiple currencies. You can also accept payment offline via USSD and POS.",
    "method_supports": [
      "products",
      "tokenization",
      "subscriptions",
      "subscription_cancellation",
      "subscription_suspension",
      "subscription_reactivation",
      "subscription_amount_changes",
      "subscription_date_changes",
      "subscription_payment_method_change",
      "subscription_payment_method_change_customer",
      "subscription_payment_method_change_admin",
      "multiple_subscriptions"
    ],
    "settings": {
      "go_live": {
        "id": "go_live",
        "label": "Live mode",
        "description": "Check this box if you're using your live keys.",
        "type": "checkbox",
        "value": "yes",
        "default": "no",
        "tip": "Check this box if you're using your live keys.",
        "placeholder": ""
      },
      "logging_option": {
        "id": "logging_option",
        "label": "Disable Logging",
        "description": "Check this box if you're disabling logging.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip": "Check this box if you're disabling logging.",
        "placeholder": ""
      },
      "barter": {
        "id": "barter",
        "label": "Disable Barter",
        "description": "Check the box if you want to disable barter.",
        "type": "checkbox",
        "value": "no",
        "default": "no",
        "tip": "Check the box if you want to disable barter.",
        "placeholder": ""
      },
      "webhook": {
        "id": "webhook",
        "label": "Webhook Instruction",
        "description":
            "Please copy this webhook URL and paste on the webhook section on your dashboard <strong style=\"color: red\"><pre><code>https://thenewspecies.com/wc-api/Flw_WC_Payment_Webhook/</code></pre></strong> (<a href=\"https://rave.flutterwave.com/dashboard/settings/webhooks\" target=\"_blank\">Rave Account</a>)",
        "type": "hidden",
        "value": "",
        "default": "",
        "tip":
            "Please copy this webhook URL and paste on the webhook section on your dashboard <strong style=\"color: red\"><pre><code>https://thenewspecies.com/wc-api/Flw_WC_Payment_Webhook/</code></pre></strong> (<a href=\"https://rave.flutterwave.com/dashboard/settings/webhooks\" target=\"_blank\">Rave Account</a>)",
        "placeholder": ""
      },
      "secret_hash": {
        "id": "secret_hash",
        "label": "Enter Secret Hash",
        "description":
            "Ensure that <b>SECRET HASH</b> is the same with the one on your Rave dashboard",
        "type": "text",
        "value": "",
        "default": "Rave-Secret-Hash",
        "tip":
            "Ensure that <b>SECRET HASH</b> is the same with the one on your Rave dashboard",
        "placeholder": ""
      },
      "title": {
        "id": "title",
        "label": "Payment method title",
        "description": "Optional",
        "type": "text",
        "value": "Rave",
        "default": "Rave",
        "tip": "Optional",
        "placeholder": ""
      },
      "test_public_key": {
        "id": "test_public_key",
        "label": "Rave Test Public Key",
        "description": "",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "test_secret_key": {
        "id": "test_secret_key",
        "label": "Rave Test Secret Key",
        "description": "",
        "type": "text",
        "value": "",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "live_public_key": {
        "id": "live_public_key",
        "label": "Rave Live Public Key",
        "description": "",
        "type": "text",
        "value": "FLWPUBK-dce2b9bf97e73acefefb9f1995da5e1e-X",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "live_secret_key": {
        "id": "live_secret_key",
        "label": "Rave Live Secret Key",
        "description": "",
        "type": "text",
        "value": "FLWSECK-825492478d4d6b82c227dd8354bc1be9-X",
        "default": "",
        "tip": "",
        "placeholder": ""
      },
      "payment_style": {
        "id": "payment_style",
        "label": "Payment Style on checkout",
        "description":
            "Optional - Choice of payment style to use. Either inline or redirect. (Default: inline)",
        "type": "select",
        "value": "inline",
        "default": "inline",
        "tip":
            "Optional - Choice of payment style to use. Either inline or redirect. (Default: inline)",
        "placeholder": "",
        "options": {
          "inline": "Popup(Keep payment experience on the website)",
          "redirect": "Redirect"
        }
      },
      "payment_options": {
        "id": "payment_options",
        "label": "Payment Options",
        "description":
            "Optional - Choice of payment method to use. Card, Account etc.",
        "type": "select",
        "value": "",
        "default": "",
        "tip": "Optional - Choice of payment method to use. Card, Account etc.",
        "placeholder": "",
        "options": {
          "": "Default",
          "card": "Card Only",
          "account": "Account Only",
          "ussd": "USSD Only",
          "qr": "QR Only",
          "mpesa": "Mpesa Only",
          "mobilemoneyghana": "Ghana MM Only"
        }
      }
    },
    "needs_setup": false,
    "post_install_scripts": [],
    "settings_url":
        "https://thenewspecies.com/wp-admin/admin.php?page=wc-settings&tab=checkout&section=rave",
    "connection_url": null,
    "setup_help_text": null,
    "required_settings_keys": [],
    "_links": {
      "self": [
        {
          "href":
              "https://thenewspecies.com/wp-json/wc/v3/payment_gateways/rave"
        }
      ],
      "collection": [
        {"href": "https://thenewspecies.com/wp-json/wc/v3/payment_gateways"}
      ]
    }
  }
];
