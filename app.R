library(shiny)
library(bslib)

setwd("~/Desktop/health")
source("health.R")

ui <- page_sidebar(
  title = "KnowYourSymptoms: Empowering Patients Through Guided Diagnosis",
  
  sidebar = sidebar(
    width = 350,
    helpText(
      "Help diagnose patients based on present symptoms"
    ),
    checkboxGroupInput(
      "checkGroup",
      "Select all that apply",
      choices = sort(symptom_severity$Symptom)
    ),
  ),
  textOutput("selected_var"),
  
  # Change the font and size of the text
  tags$head(
    tags$style(HTML("
      .nav-tabs > li > a {
        font-family: 'Arial', sans-serif;
        font-size: 16px;
      }
      .tab-content > .tab-pane {
        font-family: 'Times New Roman', serif;
        font-size: 12px;
      }
    "))
  ),
  
  navbarPage(
    "Disease Diagnosis Program",
    id = "navbar", # Important for redirection
    tabPanel("Home",  h2("Welcome to the Home Page")),
    tabPanel("About", h2("This program is designed to help patients self-diagnose themselves by selecting
                                                   all applicable symptoms. Do not use this program as a direct replacement
                                                                                  for professional guidance. Please conduct a doctor for a
                                                                                  precise, accurate diagnosis.")),
    tabPanel("Disease matching", h2(textOutput("likely_disease")), h3(textOutput("possible_disease")),
             h4(textOutput("unlikely_disease"))),
    tabPanel("Search",
             textInput("search_input", label = NULL, placeholder = "Enter search term..."),
             actionButton("search_button", "Go")
    ),
  ),
  
  
    
  navbarPage(
    "Home",
    id = "diseases",
    tabPanel("Welcome" ,imageOutput("doraemon")),
    collapsible = TRUE,
    navbarMenu("Diseases",
      tabPanel("Acne", h2(symptom_description[symptom_description$Disease == "Acne", 2]),
               h3(tags$h1("Treatments: ", solutions("Acne"), style = "color: blue;")), imageOutput("acne")
      ),
      tabPanel("AIDS", h2(symptom_description[symptom_description$Disease == "AIDS", 2]),
               h3(tags$h1("Treatments: ", solutions("AIDS"), style = "color: blue;")), imageOutput("aids")
      ),
      tabPanel("Alcoholic hepatitis", h2(symptom_description[symptom_description$Disease == "Alcoholic hepatitis", 2]),
               h3(tags$h1("Treatments: ", solutions("Alcoholic hepatitis"), style = "color: blue;")), imageOutput("alcoholic")
      ),
      tabPanel("Allergy", h2(symptom_description[symptom_description$Disease == "Allergy", 2]),
               h3(tags$h1("Treatments: ", solutions("Allergy"), style = "color: blue;")), imageOutput("allergy")
      ),
      tabPanel("Arthritis", h2(symptom_description[symptom_description$Disease == "Arthritis", 2]),
               h3(tags$h1("Treatments: ", solutions("Arthritis"), style = "color: blue;")), imageOutput("arthritis")
      ),
      tabPanel("Bronchial Asthma", h2(symptom_description[symptom_description$Disease == "Bronchial Asthma", 2]),
               h3(tags$h1("Treatments: ", solutions("Bronchial Asthma"), style = "color: blue;")), imageOutput("bronchial")
      ),
      tabPanel("Cervical spondylosis", h2(symptom_description[symptom_description$Disease == "Cervical spondylosis", 2]),
               h3(tags$h1("Treatments: ", solutions("Cervical spondylosis"), style = "color: blue;")), imageOutput("cervical")
      ),
      tabPanel("Chicken pox", h2(symptom_description[symptom_description$Disease == "Chicken pox", 2]),
               h3(tags$h1("Treatments: ", solutions("Chicken pox"), style = "color: blue;")), imageOutput("chicken")
      ),
      tabPanel("Chronic cholestasis", h2(symptom_description[symptom_description$Disease == "Chronic cholestasis", 2]),
               h3(tags$h1("Treatments: ", solutions("Chronic cholestasis"), style = "color: blue;")), imageOutput("chronic")
      ),
      tabPanel("Common Cold", h2(symptom_description[symptom_description$Disease == "Common Cold", 2]),
               h3(tags$h1("Treatments: ", solutions("Common Cold"), style = "color: blue;")), imageOutput("common")
      ),
      tabPanel("Dengue", h2(symptom_description[symptom_description$Disease == "Dengue", 2]),
               h3(tags$h1("Treatments: ", solutions("Dengue"), style = "color: blue;")), imageOutput("dengue")
      ),
      tabPanel("Diabetes", h2(symptom_description[symptom_description$Disease == "Diabetes", 2]),
               h3(tags$h1("Treatments: ", solutions("Diabetes"), style = "color: blue;")), imageOutput("diabetes")
      ),
      tabPanel("Dimporphic hemorrhoids (piles)", h2(symptom_description[symptom_description$Disease == "Dimorphic hemorrhoids(piles)", 2]),
               h3(tags$h1("Treatments: ", solutions("Dimorphic hemmorhoids(piles)"), style = "color: blue;")), imageOutput("piles")
      ),
      tabPanel("Drug Reaction", h2(symptom_description[symptom_description$Disease == "Drug Reaction", 2]),
               h3(tags$h1("Treatments: ", solutions("Drug Reaction"), style = "color: blue;")), imageOutput("drug")
      ),
      tabPanel("Fungal infection", h2(symptom_description[symptom_description$Disease == "Fungal infection", 2]),
               h3(tags$h1("Treatments: ", solutions("Fungal infection"), style = "color: blue;")), imageOutput("fungal")
      ),
      tabPanel("Gastroenteritis", h2(symptom_description[symptom_description$Disease == "Gastroenteritis", 2]),
               h3(tags$h1("Treatments: ", solutions("Gastroenteritis"), style = "color: blue;")), imageOutput("gastro")
      ),
      tabPanel("GERD", h2(symptom_description[symptom_description$Disease == "GERD", 2]),
               h3(tags$h1("Treatments: ", solutions("GERD"), style = "color: blue;")), imageOutput("gerd")
      ),
      tabPanel("Heart attack", h2(symptom_description[symptom_description$Disease == "Heart attack", 2]),
               h3(tags$h1("Treatments: ", solutions("Heart attack"), style = "color: blue;")), imageOutput("heart")
      ),
      tabPanel("Hepatitis A", h2(symptom_description[symptom_description$Disease == "hepatitis A", 2]),
               h3(tags$h1("Treatments: ", solutions("hepatitis A"), style = "color: blue;")), imageOutput("hepA")
      ),
      tabPanel("Hepatitis B", h2(symptom_description[symptom_description$Disease == "Hepatitis B", 2]),
               h3(tags$h1("Treatments: ", solutions("Hepatitis B"), style = "color: blue;")), imageOutput("hepB")
      ),
      tabPanel("Hepatitis C", h2(symptom_description[symptom_description$Disease == "Hepatitis C", 2]),
               h3(tags$h1("Treatments: ", solutions("Hepatitis C"), style = "color: blue;")), imageOutput("hepC")
      ),
      tabPanel("Hepatitis D", h2(symptom_description[symptom_description$Disease == "Hepatitis D", 2]),
               h3(tags$h1("Treatments: ", solutions("Hepatitis D"), style = "color: blue;")), imageOutput("hepD")
      ),
      tabPanel("Hepatitis E", h2(symptom_description[symptom_description$Disease == "Hepatitis E", 2]),
               h3(tags$h1("Treatments: ", solutions("Hepatitis E"), style = "color: blue;")), imageOutput("hepE")
      ),
      tabPanel("Hypertension", h2(symptom_description[symptom_description$Disease == "Hypertension", 2]),
               h3(tags$h1("Treatments: ", solutions("Hypertension"), style = "color: blue;")), imageOutput("hypertension")
      ),
      tabPanel("Hyperthyroidism", h2(symptom_description[symptom_description$Disease == "Hyperthyroidism", 2]),
               h3(tags$h1("Treatments: ", solutions("Hyperthyroidism"), style = "color: blue;")), imageOutput("hyperthyroidism")
      ),
      tabPanel("Hypoglycemia", h2(symptom_description[symptom_description$Disease == "Hypoglycemia", 2]),
               h3(tags$h1("Treatments: ", solutions("Hypoglycemia"), style = "color: blue;")), imageOutput("hypoglycemia")
      ),
      tabPanel("Hypothyroidism", h2(symptom_description[symptom_description$Disease == "Hypothyroidism", 2]),
               h3(tags$h1("Treatments: ", solutions("Hypothyroidism"), style = "color: blue;")), imageOutput("hypothyroidism")
      ),
      tabPanel("Impetigo", h2(symptom_description[symptom_description$Disease == "Impetigo", 2]),
               h3(tags$h1("Treatments: ", solutions("Impetigo"), style = "color: blue;")), imageOutput("impetigo")
      ),
      tabPanel("Jaundice", h2(symptom_description[symptom_description$Disease == "Jaundice", 2]),
               h3(tags$h1("Treatments: ", solutions("Jaundice"), style = "color: blue;")), imageOutput("jaundice")
      ),
      tabPanel("Malaria", h2(symptom_description[symptom_description$Disease == "Malaria", 2]),
               h3(tags$h1("Treatments: ", solutions("Malaria"), style = "color: blue;")), imageOutput("malaria")
      ),
      tabPanel("Migraine", h2(symptom_description[symptom_description$Disease == "Migraine", 2]),
               h3(tags$h1("Treatments: ", solutions("Migraine"), style = "color: blue;")), imageOutput("migraine")
      ),
      tabPanel("Osteoarthritis", h2(symptom_description[symptom_description$Disease == "Osteoarthristis", 2]),
               h3(tags$h1("Treatments: ", solutions("Osteoarthristis"), style = "color: blue;")), imageOutput("osteo")
      ),
      tabPanel("Paralysis (brain hemorrhage)", h2(symptom_description[symptom_description$Disease == "Paralysis (brain hemorrhage)", 2]),
               h3(tags$h1("Treatments: ", solutions("Paralysis (brain hemorrhage)"), style = "color: blue;")), imageOutput("paralysis")
      ),
      tabPanel("Peptic ulcer disease", h2(symptom_description[symptom_description$Disease == "Peptic ulcer diseae", 2]),
               h3(tags$h1("Treatments: ", solutions("Peptic ulcer diseae"), style = "color: blue;")), imageOutput("peptic")
      ),
      tabPanel("Pneumonia", h2(symptom_description[symptom_description$Disease == "Pneumonia", 2]),
               h3(tags$h1("Treatments: ", solutions("Pneumonia"), style = "color: blue;")), imageOutput("pneumonia")
      ),
      tabPanel("Psoriasis", h2(symptom_description[symptom_description$Disease == "Psoriasis", 2]),
               h3(tags$h1("Treatments: ", solutions("Psoriasis"), style = "color: blue;")), imageOutput("psoriasis")
      ),
      tabPanel("Tuberculosis", h2(symptom_description[symptom_description$Disease == "Tuberculosis", 2]),
               h3(tags$h1("Treatments: ", solutions("Tuberculosis"), style = "color: blue;")), imageOutput("tuberculosis")
      ),
      tabPanel("Typhoid", h2(symptom_description[symptom_description$Disease == "Typhoid", 2]),
               h3(tags$h1("Treatments: ", solutions("Typhoid"), style = "color: blue;")), imageOutput("typhoid")
      ),
      tabPanel("Urinary tract infection", h2(symptom_description[symptom_description$Disease == "Urinary tract infection", 2]),
               h3(tags$h1("Treatments: ", solutions("Urinary tract infection"), style = "color: blue;")), imageOutput("urinary")
      ),
      tabPanel("Varicose veins", h2(symptom_description[symptom_description$Disease == "Varicose veins", 2]),
               h3(tags$h1("Treatments: ", solutions("Varicose veins"), style = "color: blue;")), imageOutput("varicose")
      ),
      tabPanel("(vertigo) Paroxymsal Positional Vertigo", h2(symptom_description[symptom_description$Disease == "(vertigo) Paroymsal  Positional Vertigo", 2]),
               h3(tags$h1("Treatments: ", solutions("(vertigo) Paroymsal  Positional Vertigo"), style = "color: blue;")), imageOutput("vertigo")
      )
    )
  )

  
  # textOutput("selected_var"),
  # textOutput("check_var"),
  # textOutput("solutions")
)


server <- function(input, output, session) {
  output$selected_var <- renderText({
    paste("Note: 'Possible Diseases' has a buffer of up to 2 symptoms not commonly found in the list of diseases.
          'Unlikely Diseases' has a buffer of 3-4 symptoms not commonly found in the list of diseases.")
  })
  
  output$likely_disease <- renderText({
    paste("Likely Diseases: ", diagnosis(input$checkGroup))
  })
  
  output$possible_disease <- renderText({
    paste("Possible Diseases: ", possible(input$checkGroup))
  })
  
  output$unlikely_disease <- renderText({
    paste("Less Likely Diseases: ", unlikely(input$checkGroup))
  })
  
  observeEvent(input$search_button, {
    search_term <- tolower(input$search_input) # Convert to lowercase for case-insensitive search
    
    if (search_term == "home") {
      updateNavbarPage(session, "navbar", selected = "Home")
    } else if (search_term == "data") {
      updateNavbarPage(session, "navbar", selected = "Data")
    } else if (search_term == "about") {
      updateNavbarPage(session, "navbar", selected = "About")
    } else if (search_term == "acne") {
      updateNavbarPage(session, "diseases", selected = "Acne")
    } else if (search_term == "aids") {
      updateNavbarPage(session, "diseases", selected = "AIDS")
    } else if (any(grepl("alcoholic", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Alcoholic hepatitis")
    } else if (search_term == "allergy") {
      updateNavbarPage(session, "diseases", selected = "Allergy")
    } else if (search_term == "arthritis") {
      updateNavbarPage(session, "diseases", selected = "Arthritis")
    } else if (any(grepl("bronchial", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Bronchial Asthma")
    } else if (any(grepl("cervical", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Cervical spondylosis")
    } else if (any(grepl("chicken", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Chicken pox")
    } else if (any(grepl("chronic", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Chronic cholestasis")
    } else if (any(grepl("common", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Common Cold")
    } else if (search_term == "dengue") {
      updateNavbarPage(session, "diseases", selected = "Dengue")
    } else if (search_term == "diabetes") {
      updateNavbarPage(session, "diseases", selected = "Diabetes")
    } else if (any(grepl("dimorphic", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Dimporphic hemorrhoids (piles)")
    } else if (any(grepl("drug", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Drug Reaction")
    } else if (any(grepl("fungal", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Fungal infection")
    } else if (any(grepl("gastro", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Gastroenteritis")
    } else if (search_term == "gerd") {
      updateNavbarPage(session, "diseases", selected = "GERD")
    } else if (any(grepl("heart", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Heart attack")
    } else if (search_term == "hepatitis a") {
      updateNavbarPage(session, "diseases", selected = "Hepatitis A")
    } else if (search_term == "hepatitis b") {
      updateNavbarPage(session, "diseases", selected = "Hepatitis B")
    } else if (search_term == "hepatitis c") {
      updateNavbarPage(session, "diseases", selected = "Hepatitis C")
    } else if (search_term == "hepatitis d") {
      updateNavbarPage(session, "diseases", selected = "Hepatitis D")
    } else if (search_term == "hepatitis e") {
      updateNavbarPage(session, "diseases", selected = "Hepatitis E")
    } else if (search_term == "hypertension") {
      updateNavbarPage(session, "diseases", selected = "Hypertension")
    } else if (search_term == "hyperthyroidism") {
      updateNavbarPage(session, "diseases", selected = "Hyperthyroidism")
    } else if (search_term == "hypoglycemia") {
      updateNavbarPage(session, "diseases", selected = "Hypoglycemia")
    } else if (search_term == "hypothyroidism") {
      updateNavbarPage(session, "diseases", selected = "Hypothyroidism")
    } else if (search_term == "impetigo") {
      updateNavbarPage(session, "diseases", selected = "Impetigo")
    } else if (search_term == "jaundice") {
      updateNavbarPage(session, "diseases", selected = "Jaundice")
    } else if (search_term == "malaria") {
      updateNavbarPage(session, "diseases", selected = "Malaria")
    } else if (search_term == "migraine") {
      updateNavbarPage(session, "diseases", selected = "Migraine")
    } else if (any(grepl("osteo", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Osteoarthritis")
    } else if (any(grepl("paralysis", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Paralysis (brain hemorrhage)")
    } else if (any(grepl("peptic", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Peptic ulcer disease")
    } else if (any(grepl("pneumonia", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Pneumonia")
    } else if (any(grepl("psor", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Psoriasis")
    } else if (any(grepl("tuberculosis", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Tuberculosis")
    } else if (any(grepl("typhoid", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Typhoid")
    } else if (any(grepl("urinary", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Urinary tract infection")
    } else if (any(grepl("varicose", search_term))) {
      updateNavbarPage(session, "diseases", selected = "Varicose veins")
    } else if (any(grepl("vertigo", search_term))) {
      updateNavbarPage(session, "diseases", selected = "(vertigo) Paroymsal Positional Vertigo")
    } else {
      # Handle cases where no match is found (e.g., display an error message)
      showNotification("Search term not found.", type = "error")
    }
  })
  
  output$acne <- renderImage({
    # Generate or select image based on logic
    list(src = "www/acne.png", 
         contentType = "image/png",
         width = 720, 
         height = 720,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$aids <- renderImage({
    # Generate or select image based on logic
    list(src = "www/aids.png", 
         contentType = "image/png",
         width = 1200, 
         height = 675,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$alcoholic <- renderImage({
    # Generate or select image based on logic
    list(src = "www/alcohol.png", 
         contentType = "image/png",
         width = 1001, 
         height = 751,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$allergy <- renderImage({
    # Generate or select image based on logic
    list(src = "www/allergy.png", 
         contentType = "image/png",
         width = 700, 
         height = 1246,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$arthritis <- renderImage({
    # Generate or select image based on logic
    list(src = "www/arthritis.png", 
         contentType = "image/png",
         width = 770, 
         height = 568,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$bronchial <- renderImage({
    # Generate or select image based on logic
    list(src = "www/bronchial.png", 
         contentType = "image/png",
         width = 1200, 
         height = 635,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$cervical <- renderImage({
    # Generate or select image based on logic
    list(src = "www/cervical.png", 
         contentType = "image/png",
         width = 720, 
         height = 720,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$chicken <- renderImage({
    # Generate or select image based on logic
    list(src = "www/chicken.png", 
         contentType = "image/png",
         width = 612, 
         height = 792,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$chronic <- renderImage({
    # Generate or select image based on logic
    list(src = "www/cholestasis.png", 
         contentType = "image/png",
         width = 800, 
         height = 1200,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$common <- renderImage({
    # Generate or select image based on logic
    list(src = "www/cold.png", 
         contentType = "image/png",
         width = 1175, 
         height = 980,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$dengue <- renderImage({
    # Generate or select image based on logic
    list(src = "www/dengue.png", 
         contentType = "image/png",
         width = 770, 
         height = 1000,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$diabetes <- renderImage({
    # Generate or select image based on logic
    list(src = "www/diabetes.png", 
         contentType = "image/png",
         width = 400, 
         height = 518,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$piles <- renderImage({
    # Generate or select image based on logic
    list(src = "www/piles.png", 
         contentType = "image/png",
         width = 400, 
         height = 518,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$drug <- renderImage({
    # Generate or select image based on logic
    list(src = "www/drug.png", 
         contentType = "image/png",
         width = 1056, 
         height = 816,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$fungal <- renderImage({
    # Generate or select image based on logic
    list(src = "www/fungal.png", 
         contentType = "image/png",
         width = 600, 
         height = 1500,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$gastro <- renderImage({
    # Generate or select image based on logic
    list(src = "www/gastro.png", 
         contentType = "image/png",
         width = 600, 
         height = 1500,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$gerd <- renderImage({
    # Generate or select image based on logic
    list(src = "www/gerd.png", 
         contentType = "image/png",
         width = 662, 
         height = 1024,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$heart <- renderImage({
    # Generate or select image based on logic
    list(src = "www/heart.png", 
         contentType = "image/png",
         width = 740, 
         height = 1142,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hepA <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hepatitisA.png", 
         contentType = "image/png",
         width = 700, 
         height = 1200,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hepB <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hepatitisB.png", 
         contentType = "image/png",
         width = 1224, 
         height = 1584,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hepC <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hepatitisC.png", 
         contentType = "image/png",
         width = 1188, 
         height = 837,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hepD <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hepatitisD.png", 
         contentType = "image/png",
         width = 653, 
         height = 1024,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hepE <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hepatitisE.png", 
         contentType = "image/png",
         width = 601, 
         height = 768,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hypertension <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hypertension.png", 
         contentType = "image/png",
         width = 400, 
         height = 515,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hyperthyroidism <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hyperthyroidism.png", 
         contentType = "image/png",
         width = 800, 
         height = 553,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hypoglycemia <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hypoglycemia.png", 
         contentType = "image/png",
         width = 1520, 
         height = 1000,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$hypothyroidism <- renderImage({
    # Generate or select image based on logic
    list(src = "www/hypothyroidism.png", 
         contentType = "image/png",
         width = 800, 
         height = 2000,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$impetigo <- renderImage({
    # Generate or select image based on logic
    list(src = "www/impetigo.png", 
         contentType = "image/png",
         width = 476, 
         height = 619,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$jaundice <- renderImage({
    # Generate or select image based on logic
    list(src = "www/jaundice.png", 
         contentType = "image/png",
         width = 700, 
         height = 1761,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$malaria <- renderImage({
    # Generate or select image based on logic
    list(src = "www/malaria.png", 
         contentType = "image/png",
         width = 772, 
         height = 960,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$migraine <- renderImage({
    # Generate or select image based on logic
    list(src = "www/migraine.png", 
         contentType = "image/png",
         width = 818, 
         height = 2048,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$osteo <- renderImage({
    # Generate or select image based on logic
    list(src = "www/osteo.png", 
         contentType = "image/png",
         width = 800, 
         height = 2000,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$paralysis <- renderImage({
    # Generate or select image based on logic
    list(src = "www/brain.png", 
         contentType = "image/png",
         width = 1420, 
         height = 1000,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$peptic <- renderImage({
    # Generate or select image based on logic
    list(src = "www/peptic.png", 
         contentType = "image/png",
         width = 738, 
         height = 1080,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$pneumonia <- renderImage({
    # Generate or select image based on logic
    list(src = "www/pneumonia.png", 
         contentType = "image/png",
         width = 980, 
         height = 1470,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$psoriasis <- renderImage({
    # Generate or select image based on logic
    list(src = "www/psoriasis.png", 
         contentType = "image/png",
         width = 1141, 
         height = 878,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$tuberculosis <- renderImage({
    # Generate or select image based on logic
    list(src = "www/tuberculosis.png", 
         contentType = "image/png",
         width = 699, 
         height = 911,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$typhoid <- renderImage({
    # Generate or select image based on logic
    list(src = "www/typhoid.png", 
         contentType = "image/png",
         width = 582, 
         height = 746,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$urinary <- renderImage({
    # Generate or select image based on logic
    list(src = "www/urinary.png", 
         contentType = "image/png",
         width = 1000, 
         height = 1465,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$varicose <- renderImage({
    # Generate or select image based on logic
    list(src = "www/varicose.png", 
         contentType = "image/png",
         width = 860, 
         height = 632,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$vertigo <- renderImage({
    # Generate or select image based on logic
    list(src = "www/vertigo.png", 
         contentType = "image/png",
         width = 1000, 
         height = 1600,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
  output$doraemon <- renderImage({
    # Generate or select image based on logic
    list(src = "www/doraemon.png", 
         contentType = "image/png",
         width = 430, 
         height = 503,
         alt = "Dynamic image")
  }, deleteFile = FALSE) 
  
}

shinyApp(ui = ui, server = server)

# Add a text box where you can type out symptoms so that it's faster







