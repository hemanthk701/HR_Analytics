library(shinydashboard)
library(shinyWidgets)
library(htmlwidgets)
library(htmltools)


ui <- dashboardPage(skin = "blue",
                    
dashboardHeader(title = "HR Analytics"),

  dashboardSidebar(
                      
    menuItem(h4("Home"), tabName = "home", icon = icon("home")),
                    
    menuItem(h4("Prediction"), tabName = "pred", icon = icon("th")),
    
    textInput(inputId = "empid",label = "Employee Id",value = "")
                  
        ),
                    
  dashboardBody(
    
    setBackgroundImage(
      src = "https://ptkam.co.id/wp-content/uploads/2017/08/bg1.jpg",shinydashboard = TRUE
    ),
    
                    
tabItems(
            
tabItem(tabName = "home",
h2(strong("Human Resource Analytics")),
        
  p(h3("Human Resource management is one of the key function of an organization.")),
  p(h3("Human Resource management acts like a fuel to the gears of an organization.")),
  
  p(h3("Every organisation strives for acquring, developing, motivating and")),
  p(h3("retaining human resource to ensure smooth working to achieve organizational objectives")),

p(h3("The HR is the one responsible to make decision in every step of functionality")),

p(h3("The role of a HR includes:")),
p(h3("1) Planning for staffing need")),
p(h3("2) Employee Recruitment and Selection")),
p(h3("3) Employee training and Performance evaluation")),
p(h3("4) Employee compensation and benifits")),
p(h3("5) Employee relation, motivation and engagement")),

p(h3("One of the way to encourage employees is through promotion to handle new roles and responsibilities.")),
p(h3("In an organisation of many employees decision of promotion is a difficult task!")),
p(strong(h3("Not to worry!"))),
p(strong(h3("Here is an application developed by team Horcrux to help an HR select the elligible candidates to next job level."))),
#img(src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ74IB1F4IfQoYi3KT8JT-TrFk-x_J75u_15ZxTc3xyGGdcQdFu&usqp=CAU", align = "centre",height="50%", width="50%"),
            
h3(strong("Methodology used")),
p(h3("We have used random forest method in deciding the promotion of an employee. 
     Entering the required details will give an output "))

),

#-------------------------------------------------------------------------------------------------------------------------------#              
      tabItem(tabName = "pred",
                                
        h2(strong("Please Enter Correct details")),
        
        br(),
                              
        column(width = 11,
        box(selectInput(inputId = "gender",label = h3("Gender"),choices = list(
                                                "Male"=1,
                                                "Female"=2
                                              ),selected = "NULL"),background = "teal",width = 4),  
                                
        box(selectInput(inputId = "edu",label = h3("Education"),choices = list(
                                  "Master's & above" =1,
                                  "Bachelor's"=2,
                                  "Below Secondary" = 3
                                ),selected = "NULL"),background = "teal",width = 4),      
                                
                              
        box(selectInput(inputId = "rec",label = h3("Recruitment Channel"),choices = list(
                                                "Sourcing" = 1,
                                                "Other" = 2,
                                                "Referred" = 3),selected = "NULL"),background = "teal",width = 4)),
        column(width= 11,
        box(selectInput("award",label = h3("Award Won"),choices = list(
                                      "Has Won Award " = 1,
                                      "Has not Won Award" = 2)),background = "aqua",width = 4),
                                    
                                    
        box(selectInput(inputId = "reg",label = h3("Region"),choices = list(
                                      "region_1"=1,"region_2"=2,"region_3"=3,"region_4"=4,"region_5"=5,
                                      "region_6"=6,"region_7"=7,"region_8"=8,"region_9"=9,"region_10"=10,
                                      "region_11"=11,"region_12"=12,"region_13"=13,"region_14"=14,"region_15"=15,
                                      "region_16"=16,"region_17"=17,"region_18"=18,"region_19"=19,"region_20"=20,
                                      "region_21"=21,"region_22"=22,"region_23"=23,"region_24"=24,"region_25"=25,
                                      "region_26"=26,"region_27"=27,"region_28"=28,"region_29"=29,"region_30"=30,
                                      "region_31"=31,"region_32"=32,"region_33"=33,"region_34"=34),selected = "NULL"),background = "aqua",width = 4),
                                    
        box(selectInput(inputId = "dept",label = h3("Department"),choices = list(
                                      "Sales & Marketing" = 1,
                                      "Operations"=2,
                                      "Technology"=3,
                                      "Analytics"=4,
                                      "R&D"=5,
                                      "Procurement"=6,
                                      "Finance"=7,
                                      "HR"=8,
                                      "Legal"=9),selected = NULL),background = "aqua",width = 4)),
                              
                  
                                
        column(width=11,
        box(radioGroupButtons(inputId = "pyr",label = h3("Previous year Rating"),choices = list(
                                      "1"=1,"2"=2,"3"=3,"4"=4,"5"=5)),background = "blue",width = 4),
                                    
                                    
        box(radioGroupButtons("kpi", label = h3("Key Performance Indicator"),choices = list(
                                      "Greater than 80%" = 1,
                                      "Lesser than 80%" = 2)),background = "blue",width = 4),
                                
                                    box(radioGroupButtons(inputId = "not",label = h3("Number of Trainings"),choices = list( "1" = 1,
                                                                                                                           "2" = 2,
                                                                                                                           "3" = 3,
                                                                                                                           "4" = 4,
                                                                                                                           "5" = 5,
                                                                                                                           "6" = 6,
                                                                                                                           "7" = 7,
                                                                                                                           "8" = 8,
                                                                                                                           "9" = 9,
                                                                                                                          "10" = 10)),background = "blue",width = 4)),
                        
        column(width=11,
        box(sliderInput(inputId = "len",label = h3("Length Of Service"),min = 1,max = 40,step = 1,value = 10 ),background = "navy",width = 4),
                                    
        box(sliderInput(inputId = "age",label = h3("Age"),min = 20,max = 60,step = 1,value = 25),background = "navy",width = 4),
                                
        box(sliderInput("ats",label = h3("Average Training Score"),min =25,max = 100,step = 1,value = 25),background = "navy",width = 4),
                                    
        actionButton("submit", h4("SUBMIT"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"))
      )
)))