
package main

import (
	c "./src/controllers"
	"./src/logs"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"os"
)

func main() {
	router := mux.NewRouter().StrictSlash(true)
	// router.Use(a.JwtAuthentication)
	f, err := os.OpenFile("" +
		"activity.log",
		os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Println(err)
	}
	defer f.Close()

	log.SetOutput(f)
	log.SetPrefix("LOG: ")
	log.SetFlags(log.Ldate | log.Lmicroseconds | log.Llongfile)
	log.Println("init started")


	// Reset Slots table
	 go c.InitMidNight()


	// authentication routes
	router.Handle("/api/user/register", c.CreateUserController).Methods("POST")
	router.Handle("/api/login", c.AuthenticateUserController).Methods("POST")


	// reservations routes
	router.Handle("/api/reservation/requests/create", c.CreateReservationController).Methods("POST")
	router.Handle("/api/reservation/get", c.GetReservationsController).Methods("GET")
	router.Handle("/api/reservation/get/{id}", c.GetReservationsForController).Methods("GET")

	// Slots routes
	router.Handle("/api/slots/create", c.CreateSlotController).Methods("POST")
	router.Handle("/api/slots/get", c.GetSlotsController).Methods("GET")
	router.Handle("/api/slots/update/{id}", c.UpdateSlotController).Methods("PUT")


	// Reservations Approval routes
	router.Handle("/api/reservations/requests", c.GetReservationsRequestsController).Methods("GET")
	router.Handle("/api/approve/reservations/requests/{id}", c.UpdateReservationController).Methods("PUT")
	router.Handle("/api/slots/close", c.CloseReservationController).Methods("PUT")


	// Destination Routes
	router.Handle("/api/town", c.CreateTownController).Methods("POST")
	router.Handle("/api/town", c.GetTownsController).Methods("GET")

	// Days Routes
	router.Handle("/api/day", c.CreateDayController).Methods("POST")
	router.Handle("/api/day", c.GetDaysController).Methods("GET")

	// Time Routes
	router.Handle("/api/time", c.CreateTimeController).Methods("POST")
	router.Handle("/api/time", c.GetTimesController).Methods("GET")

	// Destination with Time Routes
	router.Handle("/api/destination/time", c.CreateDestinationDayTimesController).Methods("POST")
	router.Handle("/api/destination/time", c.GetDestinationDayTimesController).Methods("GET")




	if err := http.ListenAndServe("0.0.0.0:7080", logs.LogRequest("",handlers.LoggingHandler(os.Stdout, router))); err != nil {
		panic(err)
	}

}