# Interactive Self-Diagnosis Assistant

// NOTE // 
The UI is still undergoing development to improve instructions for using this program.



This program is designed to assist patients in diagnosing their symptoms and receive real-time feedback relating to their present symptoms.

# Data Analysis

The datasets used for this project were obtained from Kaggle (https://www.kaggle.com/datasets/itachi9604/disease-symptom-description-dataset?select=symptom_precaution.csv) and cleaned through R. For those interested in seeing how this data was cleaned, processed, and analyzed, feel free to reach out. Once the data was cleaned, I built an interactive UI through the Shiny package within R.

# UI

On the sidebar located by the left-hand side of the screen, there is an extensive list of possible symptoms listed in alphabetical order. Patients are then encouraged to select all NEW symptoms to help identify the root cause.

<img width="1437" height="773" alt="Screenshot 2025-08-06 at 1 53 53 PM" src="https://github.com/user-attachments/assets/76a0fa83-5f4f-4656-a2d6-1ea2ccbcba5e" />

To view the diseases that may be responsible for these symptoms, click on the Disease matching tab located on the top of the screen. From here, there are three separate subsections. 
  - Likely Diseases: Diseases listed in this section refer to diseases that have ALL selected symptoms commonly present in those diagnosed with this disease. If even just one symptom is selected by the patient that is not commonly seen in a disease, that disease will NOT show up in this section.
  - Possible Diseases: For this section to return a disease, at least 4 symptoms must be selected. Diseases listed in this section have a 2 symptom "buffer". For instance, if a patient were to select 5 symptoms and only 3/4 of the symptoms are commonly seen in a specific disease, the disease will be listed in this section.
  - Less Likely Diseases: For this section to return a disease, at least 7 symptoms must be selected. Diseases listed in this section have a 4 symptom "buffer". For instance, if a patient were to select 9 symptoms and only 5/6/7/8 of the symptoms are commonly seen in a specific disease, the disease will be listed in this section.

<img width="1437" height="773" alt="Screenshot 2025-08-06 at 1 54 04 PM" src="https://github.com/user-attachments/assets/ac424a2b-e520-445a-8883-62635418501c" />

As diseases start to get listed on the Disease matching tab, patients can then either navigate to the diseases tab underneath and select the appropriate disease or navigate to the search bar and manually search the disease name. Once searched, the screen will reroute to the corresponding disease, outputting a brief description of the disease, treatments, and an inforgraphic providing extensive information.


<img width="1434" height="770" alt="Screenshot 2025-08-06 at 1 54 23 PM" src="https://github.com/user-attachments/assets/ff536045-3714-4ac1-8353-8854af502aa9" />
