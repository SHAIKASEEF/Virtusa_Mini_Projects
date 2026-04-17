SKILLS_DB = [
    "python", "java", "c++", "machine learning", "deep learning",
    "sql", "html", "css", "javascript", "react", "node", "nlp",
    "data analysis", "pandas", "numpy", "tensorflow"
]

def extract_skills(text):
    found_skills = []
    for skill in SKILLS_DB:
        if skill in text:
            found_skills.append(skill)
    return list(set(found_skills))