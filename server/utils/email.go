package utils

import (
	"log"
	"os"
	"strconv"

	"gopkg.in/gomail.v2"
)

func SendEmail(subject string, body string) error {
	from := os.Getenv("NOTIFICATION_FROM_ADDRESS")
	to := os.Getenv("NOTIFICATION_TO_ADDRESS")
	smtpHost := os.Getenv("SMTP_HOST")
	smtpUser := os.Getenv("SMTP_USER")
	smtpPW := os.Getenv("SMTP_PASSWORD")
	smtpPort, err := strconv.Atoi(os.Getenv("SMTP_PORT"))
	if err != nil {
		return err
	}

	m := gomail.NewMessage()
	m.SetHeader("From", from)
	m.SetHeader("To", to)
	m.SetHeader("Subject", subject)
	m.SetBody("text/plain", body)

	d := gomail.NewDialer(smtpHost, smtpPort, smtpUser, smtpPW)
	if err := d.DialAndSend(m); err != nil {
		log.Fatal(err)
		return err
	}

	return nil
}
