# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BusTerminalSystem.Repo.insert!(%BusTerminalSystem.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias BusTerminalSystem.Settings

save = (fn key, value -> if Settings.find_by(key: key) == nil, do: Settings.create(key: key, value: value, status: true) end)

save.("APPLICATION_NAME", "BTMMS")
save.("BANK_URL", "http://41.175.13.198:7664/api/json/commercials/probase/zicb/fundsTransfer")
save.("BANK_SECONDARY_URL", "http://41.175.13.198:7664//api/json/commercials/zicb/banking")
save.("BANK_AUTH_KEY", "NOT SET")
save.("BANK_ENABLE_TICKET_POSTING", "FALSE")
save.("BANK_AUTH_SERVICE_KEY", "NOT SET")
save.("BANK_ACCOUNT_OPENING_TYPE", "WA")
save.("BANK_ACCOUNT_OPENING_CURRENCY", "ZMW")
save.("BANK_ACCOUNT_OPENING_UNIQUE_TYPE", "NRC")
save.("BANK_PROXY_ACCOUNT_OPENING_SERVICE_CODE", "ZB0631")
save.("EYED_BUS_ROUTES_URL", "NOT SET")
save.("SMS_ENABLE", "FALSE")
save.("SMS_GATEWAY", "NOT SET")
save.("SMS_GATEWAY_USERNAME", "NOT SET")
save.("SMS_GATEWAY_PASSWORD", "NOT SET")
save.("SMS_GATEWAY_SMSC", "NOT SET")
save.("SMS_GATEWAY_SENDER", "NOT SET")
save.("COSEC_GD", "http://10.70.1.1/cosec/api.svc/v2/device") # GET DEVICES
save.("COSEC_AD", "http://10.70.1.1/cosec/api.svc/v2/user") # ADD DEVICE
save.("COSEC_AD2U", "http://10.70.1.1/cosec/api.svc/v2/device") # ADD DEVICE TO USER
save.("COSEC_ADC", "http://10.70.1.1/cosec/api.svc/v2/user") # ADD CREDENTIALS
save.("COSEC_CRED", "c2E6MTIzNDU=") # COSEC CREDENTIALS
save.("COSEC_CARD_LENGTH", "10") # COSEC CREDENTIALS
save.("COSEC_TURNSTILE_ENABLE_TID_IP", "http://10.70.3.55:5000/enable/")
save.("COSEC_TURNSTILE_DISABLE_TID_IP", "http://10.70.3.55:5000/disable/")
save.("NAPSA_MEMBER_VALIDATION_URL", "http://10.10.1.114:8092/apis/external/v1/validatessnnrc")
save.("NAPSA_SOAP_URL", "http://napsa-enapsauatsvr:8738/eNAPSAExternalAPI/2018/04/NPSService")
save.("NAPSA_CONTRIBUTION_URL", "http://enapsa.napsa.co.zm/eNAPSAServicesLibrary/2016/11/IeNAPSAExternalAPI/ReturnUpload")
