library(randomForest)

server <- function(input, output) {
  
  hr <- reactive({
    rf <- readRDS("C:/Users/User/Desktop/multivariate/R-2/HR-Analytics/rf.rds")
    vector <- readRDS("C:/Users/User/Desktop/multivariate/R-2/HR-Analytics/data.rds")
    #dept <- input$dept
    dept <- switch(input$dept,"1" = "Sales & Marketing","2"= "Operations","3" ="Technology","4"="Analytics","5"="R&D","6"="Procurement","7"="Finance","8"="HR","9"="Legal")
    reg <- switch(input$reg,"1"="region_1","2"="region_2","3"="region_3","4"="region_4","5" ="region_5",
                  "6"="region_6","7"="region_7","8"="region_8","9"="region_9","10"="region_10",
                  "11"="region_11","12"="region_12","13"="region_13","14"="region_14","15" ="region_15",
                  "16"="region_16","17"="region_17","18"="region_18","19"="region_19","20"="region_20",
                  "21"="region_21","22"="region_22","23"="region_23","24"="region_24","25" ="region_25",
                  "26"="region_26","27"="region_27","28"="region_28","29"="region_29","30"="region_30",
                  "31"="region_31","32"="region_32","33"="region_33","34"="region_34")
    edu <- switch (input$edu,"1"="Master's & above","2"="Bachelor's","3"="Below Secondary")
    gender <- switch(input$gender,"1"= "Male","2"="Female")
    rec <- switch(input$rec,"1"="Sourcing","2"="Other","3"="Referred")
    not <- input$not
    pyr <- switch(input$pyr,"1"=1,"2"=2,"3"=3,"4"=4,"5"=5)
    age <- input$age
    len <- input$len
    kpi <- switch(input$kpi,"1"=1,"2"=0)
    award <- switch(input$award,"1"= "Won award","2"="No award")
    ats <- input$ats
    vector[1,]<- c(dept,reg,edu,gender,rec,not,age,pyr,len,kpi,award,ats)
    result <-as.character(predict(rf,newdata = vector[1,]))
    return(result)
    
  })
  
  observeEvent(input$submit, {
    showModal(modalDialog(
      title = paste("Employee ID",input$empid),
      renderPrint(hr()),
      easyClose = TRUE
    ))
  })
}
