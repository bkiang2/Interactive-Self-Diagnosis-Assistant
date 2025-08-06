setwd("~/Desktop/health")

# Datasets
health <- read.csv("dataset.csv")
symptom_severity <- read.csv("Symptom-severity.csv")
symptom_description <- read.csv("symptom_Description.csv")
symptom_precaution <- read.csv("symptom_precaution.csv")

# Trim values to remove whitespace
for (i in 1:4920) {
  for (j in 1:18) {
    health[i,j] = trimws(health[i,j])
    if (health[i,j] == "dischromic _patches") {
      health[i,j] = "dischromic_patches"
    } else if (health[i,j] == "spotting_ urination") {
      health[i,j] = "spotting_urination"
    }
  }
}
health

for (i in 1:41) {
  for (j in 1:5) {
    symptom_precaution[i,j] = trimws(symptom_precaution[i,j])
  }
}
symptom_precaution

for (i in 1:41) {
  for (j in 2) {
    symptom_description[i,j] = trimws(symptom_description[i,j])
  } 
}

for (i in 1:133) {
  for (i in 1:2) {
    symptom_severity[i,j] = trimws(symptom_severity[i,j])
  }
}


# Find all unique diseases
diseases <- unique(health$Disease)
diseases_df <- data.frame(Disease = diseases)

diseases_df$Symptoms = ""

# Find all symptoms present for all diseases
for (i in 1:length(diseases)) {
  symptoms <- list()
  for (j in 2:ncol(health[health$Disease == diseases[i], ])) {
    symptoms <- append(symptoms, unique(health[health$Disease == diseases[i], j]))
  }
  symptoms <- unique(symptoms)
  diseases_df$Symptoms[i] = paste(symptoms, sep = "", collapse = ",")
}

diseases_df


# Add percentages that represents the proportion of disease diagnoses who experienced that symptom

# number of fungal infection diagnoses with "itching" as a symptom
sum(health[health$Disease == "Fungal infection", 2:17] == "itching")

# number of fungal infection diagnoses
nrow(health[health$Disease == "Fungal infection", 2:17])

sum(health[health$Disease == "Fungal infection", 2:17] == "itching") /
  nrow(health[health$Disease == "Fungal infection", 2:17])

# Trim strings to have no whitespace
trimws(unlist(strsplit(diseases_df$Symptoms[1], ",")))

sum(health[health$Disease == "Fungal infection", 2:17] == "skin_rash")

symptom = data.frame(Symptoms = symptom_severity$Symptom)
symptom["Fungal infection"] = 0
symptom$Allergy = 0
symptom$GERD = 0
symptom["Chronic cholestasis"] = 0
symptom["Drug Reaction"] = 0
symptom["Peptic ulcer diseae"] = 0
symptom$AIDS = 0
symptom$Diabetes = 0
symptom$Gastroenteritis = 0
symptom["Bronchial Asthma"] = 0
symptom$Hypertension = 0
symptom$Migraine = 0
symptom["Cervical spondylosis"] = 0
symptom["Paralysis (brain hemorrhage)"] = 0
symptom["Jaundice"] = 0
symptom$Malaria = 0
symptom["Chicken pox"] = 0
symptom$Dengue = 0
symptom$Typhoid = 0
symptom["hepatitis A"] = 0
symptom["Hepatitis B"] = 0
symptom["Hepatitis C"] = 0
symptom["Hepatitis D"] = 0
symptom["Hepatitis E"] = 0
symptom["Alcoholic hepatitis"] = 0
symptom$Tuberculosis = 0
symptom["Common Cold"] = 0
symptom["Pneumonia"] = 0
symptom["Dimorphic hemmorhoids(piles)"] = 0
symptom["Heart attack"] = 0
symptom["Varicose veins"] = 0
symptom$Hypothyroidism = 0
symptom$Hyperthyroidism = 0
symptom$Hypoglycemia = 0
symptom$Osteoarthristis = 0
symptom$Arthritis = 0
symptom["(vertigo) Paroymsal  Positional Vertigo"] = 0
symptom$Acne = 0
symptom["Urinary tract infection"] = 0
symptom$Psoriasis = 0
symptom$Impetigo = 0


for (i in 1:133) {
  for (j in 1:41) {
    present = sum(health[health$Disease == symptom_precaution$Disease[j], 2:17] == symptom_severity$Symptom[i])
    total = nrow(health[health$Disease == symptom_precaution$Disease[j], 2:17])
    symptom[i, symptom_precaution$Disease[j]] = present / total * 100
  }
}

# Above code calculates the percentage of each patient with a given disease that experiences said symptom


# Pattern matching
any(grepl("hydr", diseases_df$Symptoms))

symptom_precaution[symptom_precaution$Disease == "Common Cold", 2]


solutions <- function(disease) {
  output = list()
  for (i in 1:length(disease)) {
    # output <- append(output, i)
    output <- append(output, paste(symptom_precaution[symptom_precaution$Disease == disease[i], 2:4], collapse = ", "))
  }
  output <- unlist(output)
  return(paste(output, collapse = ", "))
}

# Must eventually narrow down to one most likely disease diagnosis
  # can then simplify the solutions function

# All symptoms present in these diseases
diagnosis <- function(symptoms) {
  if (length(symptoms) > 0) {
    output = list()
    disease = list()
    # num = 1
    for (i in 1:41) {
      possible = FALSE
      for (j in 1:length(symptoms)) {
        if (!any(grepl(symptoms[j], diseases_df$Symptoms[i]))) {
          possible = FALSE
          break
        }
        possible = TRUE
      }
      if (possible == TRUE) {
        disease <- append(disease, diseases_df$Disease[i])
        # output <- append(output, num)
        # num <- num + 1
        output <- append(output, diseases_df$Disease[i])
      }
    }
    if (length(output) == 0) {
      return("No disease matches all selected symptoms")
    }
    output <- unlist(output)
    return(paste(output, collapse = ", "))
  }
  return("Select symptoms")
}


# 1-2 symptoms not present
possible <- function(symptoms) {
  if (length(symptoms) >= 4) {
    output = list()
    disease = list()
    # num = 1
    for (i in 1:41) {
      mistakes <- 0
      for (j in 1:length(symptoms)) {
        if (!any(grepl(symptoms[j], diseases_df$Symptoms[i]))) {
          mistakes <- mistakes + 1
        }
      }
      if (mistakes == 1 || mistakes == 2) {
        disease <- append(disease, diseases_df$Disease[i])
        # output <- append(output, num)
        # num <- num + 1
        output <- append(output, diseases_df$Disease[i])
      }
    }
    if (length(output) == 0) {
      return("No disease matches the selected symptoms (with 1-2 buffer)")
    }
    output <- unlist(output)
    return(paste(output, collapse = ", "))
  }
  return("Select 4+ symptoms")
}

# 3-4 symptoms not present
unlikely <- function(symptoms) {
  if (length(symptoms) >= 7) {
    output = list()
    disease = list()
    # num = 1
    for (i in 1:41) {
      mistakes <- 0
      for (j in 1:length(symptoms)) {
        if (!any(grepl(symptoms[j], diseases_df$Symptoms[i]))) {
          mistakes <- mistakes + 1
        }
      }
      if (mistakes == 3 || mistakes == 4) {
        disease <- append(disease, diseases_df$Disease[i])
        # output <- append(output, num)
        # num <- num + 1
        output <- append(output, diseases_df$Disease[i])
      }
    }
    if (length(output) == 0) {
      return("No disease matches the selected symptoms (with 3-4 buffer)")
    }
    output <- unlist(output)
    return(paste(output, collapse = ", "))
  }
  return("Select 7+ symptoms")
}

diagnosis_solutions <- function(symptoms) {
  disease = list()
  for (i in 1:41) {
    possible = FALSE
    for (j in 1:length(symptoms)) {
      if (!any(grepl(symptoms[j], diseases_df$Symptoms[i]))) {
        possible = FALSE
        break
      }
      possible = TRUE
    }
    if (possible == TRUE) {
      disease <- append(disease, diseases_df$Disease[i])
    }
  }
  if (length(disease) == 0) {
    return(NA)
  }
  solution = solutions(disease)
  return(paste(solution, collapse = ", "))
}

diagnosis(c("continuous_sneezing", "chills", "fatigue", "cough", "high_fever"))
diagnosis(c("fatigue", "chills", "cough"))

possible(c("fatigue", "chills", "cough"))

unlikely(c("fatigue", "chills", "cough"))


diagnosis_solutions(c("continuous_sneezing", "chills", "fatigue", "cough", "high_fever"))
diagnosis_solutions(c("fatigue", "chills", "cough"))

solutions(c("Common Cold", "Fungal infection"))

paste(symptom_precaution[symptom_precaution$Disease == "Common Cold", 2:4], collapse = ", ")
symptom_precaution[symptom_precaution$Disease == "Common Cold", 4]
diseases_df$Disease[1]

