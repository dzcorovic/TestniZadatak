import smtplib
from email.message import EmailMessage

def sendMail(email, password, to):
    message = EmailMessage()
    message['subject'] = 'Test report RobotFramework'
    message['from'] = email
    message['to'] = to

    sender_email = email

    with open('log.html', 'rb') as f:
        file_data = f.read()
        file_name = f.name
    message.add_attachment(file_data, maintype='application', subtype='octet-stream', filename=file_name)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(sender_email, password)
    print('Login success')
    server.send_message(message)
    server.quit()