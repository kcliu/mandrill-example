mandrill = require 'mandrill-api/mandrill'
mandrillClient = new mandrill.Mandrill 'KEY'
# request = require 'superagent'

templateName = 'mandrill-example'
templateContent = [{
    'name': templateName
    'content': 'example content'
}]

message =
    'from_name': 'kcliu'
    'from_email': 'kcliu@eztable.com'
    'to': [
        'email': 'kcliu@eztable.com'
    ]
    "merge_vars": [{
        "rcpt": "kcliu@eztable.com"
        "vars": [{
                "name": "CUSTOMER_NAME"
                "content": "kcliu"
            }]
    }]

url = 'https://mandrillapp.com/api/1.0/messages/send-template.json'

# request.post(url)
# .send() (res) ->

mandrillClient.messages.sendTemplate
    'template_name': templateName
    'template_content': templateContent
    'message': message
    'async': false
, (response) ->
    console.log response
, (error) ->
    console.log 'mandrill error:' + error.name + '-' + error.message
