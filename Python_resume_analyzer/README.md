# Python Resume Analyzer

A machine learning-based application that analyzes resumes and compares them with job descriptions to evaluate candidate suitability.

## What it does:

- Extracts text from resumes (PDF format)
- Cleans and preprocesses the extracted text
- Identifies key skills from the resume
- Matches resume content with job description
- Calculates similarity score between resume and job role
- Provides insights on candidate relevance

## Project Structure:

- `data/` → Contains resume and job description files
- `src/` → Core logic (text extraction, preprocessing, matching, skill extraction)
- `app.py` → Main application file
- `requirements.txt` → Required libraries

## Usage:

Run the application using:

```bash
python app.py
```

## Notes:

- Ensure your resume is placed inside the `data/` folder
- Update the `job_description.txt` file based on the role
- Works best with PDF resumes

## Requirements:

- Python 3
- Required libraries (install using requirements file)

Install dependencies using:

```bash
pip install -r requirements.txt
```

## Tech Stack:

- Python
- NLP (Natural Language Processing)
- Machine Learning (basic similarity matching)
