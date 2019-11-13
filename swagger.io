swagger: "2.0"

info:
  version: 1.0.0
  title: Bench Task
  description: A simple Project with list of technologies like swagger, spring boot, kafka, mysql, junit, pcf, splunk

schemes:
  - http
host: localhost
basePath: /api

paths: 
  /customers:
    get:
      summary: get list of all customers
      description: return list of all customers only via pagination
      parameters:
       - name: pageNumber
         in: query
         description: Current Page number
         type: integer
         required: true
         default: 1
       - name: pageSize
         in: query
         description: Number of customers returned
         type: integer
         required: true
         default : 10
      responses:
        200:
          description: list of customers
          schema:
            type: array
            items:
              required:
                - number
                - firstName
                - lastName
                - birthdate
                - country
                - countryCode
                - mobileNumber
                - email
                - customerStatus
                - address
              properties:
                number:
                  type: number
                firstName:
                  type: string
                lastName:
                  type: string
                birthdate:
                  type: string
                country:
                  type: string
                countryCode:
                  type: string
                mobileNumber:
                  type: string
                email:
                  type: string
                customerStatus:
                  type: string
                address:
                  type: object
                  required:
                    - addressLine1
                    - postalCode
                  properties:
                    addressLine1:
                      type: string
                    addressLine2:
                      type: string
                    street:
                      type: string
                    postalCode:
                      type: integer

                  
        
    
