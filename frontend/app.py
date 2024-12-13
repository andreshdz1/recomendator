import streamlit as st

def recommend(item):
    recommendations = {
        "item1": "Recommendation for item1",
        "item2": "Recommendation for item2",
        "item3": "Recommendation for item3",
    }
    return recommendations.get(item, "No recommendation available")
st.title("Recommendation System")

selected_item = st.selectbox("Select an item:", ["item1", "item2", "item3"])

if selected_item:
    recommendation = recommend(selected_item)
    st.write(f"Recommendation: {recommendation}")