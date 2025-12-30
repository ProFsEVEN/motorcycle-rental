using { com.pala.motorental as my } from '../db/schema';


service AdminService @(path:'/admin') {
    entity Bikes as projection on my.Bikes;
    entity Customers as projection on my.Customers;
    entity Rentals as projection on my.Rentals;
    entity Maintenances as projection on my.Maintenances;
    entity BikeStatus as projection on my.BikeStatus;
}
