from src.extract_text import extract_text_from_pdf
from src.preprocess import clean_text
from src.skill_extractor import extract_skills
from src.matcher import match_skills

import streamlit as st
import nltk
import PyPDF2
import re
from nltk.corpus import stopwords

nltk.download('stopwords')

nltk.download('stopwords')

# ------------------ TEXT EXTRACTION ------------------ #
def extract_text_from_pdf(uploaded_file):
    text = ""
    reader = PyPDF2.PdfReader(uploaded_file)
    for page in reader.pages:
        if page.extract_text():
            text += page.extract_text()
    return text

# ------------------ PREPROCESS ------------------ #
def clean_text(text):
    text = text.lower()
    text = re.sub(r'[^a-zA-Z ]', '', text)
    words = text.split()
    words = [w for w in words if w not in stopwords.words('english')]
    return " ".join(words)

# ------------------ SKILL EXTRACTION ------------------ #
SKILLS_DB = [
    "python", "java", "c++", "machine learning", "deep learning",
    "sql", "html", "css", "javascript", "react", "node", "nlp",
    "data analysis", "pandas", "numpy", "tensorflow"
]

def extract_skills(text):
    found = []
    for skill in SKILLS_DB:
        if skill in text:
            found.append(skill)
    return list(set(found))

# ------------------ MATCHING ------------------ #
def match_skills(resume_skills, job_skills):
    matched = set(resume_skills) & set(job_skills)
    score = (len(matched) / len(job_skills)) * 100 if job_skills else 0
    missing = set(job_skills) - set(resume_skills)
    return score, matched, missing

# ------------------ UI ------------------ #
st.set_page_config(page_title="Resume Analyzer", layout="centered")

st.title("📄 Resume Analyzer & Job Matcher")

st.write("Upload your resume and paste the job description")

# Upload Resume
uploaded_file = st.file_uploader("Upload Resume (PDF)", type=["pdf"])

# Job Description Input
job_text = st.text_area("Paste Job Description Here")

# Button
if st.button("Analyze Resume"):

    if uploaded_file is None or job_text.strip() == "":
        st.warning("Please upload resume and enter job description")
    else:
        # Extract text
        resume_text = extract_text_from_pdf(uploaded_file)

        # Preprocess
        resume_clean = clean_text(resume_text)
        job_clean = clean_text(job_text)

        # Extract skills
        resume_skills = extract_skills(resume_clean)
        job_skills = extract_skills(job_clean)

        # Match
        score, matched, missing = match_skills(resume_skills, job_skills)

        # ---------------- OUTPUT ---------------- #
        st.subheader("📊 Match Results")

        st.metric("Match Score", f"{round(score, 2)} %")

        st.write("✅ Matched Skills:")
        st.success(", ".join(matched) if matched else "None")

        st.write("❌ Missing Skills:")
        st.error(", ".join(missing) if missing else "None")

        st.write("📌 Resume Skills:")
        st.info(", ".join(resume_skills))