import streamlit as st
import pandas as pd
import numpy as np
import pickle
import os

# Load model and expected features
with open('../model/house_price_model.pkl', 'rb') as f:
    model, model_features = pickle.load(f)

st.title("🏠 House Price Prediction App")

uploaded_file = st.file_uploader("Upload CSV with house features", type="csv")

if uploaded_file:
    df = pd.read_csv(uploaded_file)

    # Fix column issues
    df = df[model_features]  # select only the columns model expects
    df = df.fillna(0)        # fill any missing values (basic safeguard)

    preds = model.predict(df)
    df['PredictedPrice'] = np.expm1(preds)

    st.subheader("📈 Predicted House Prices:")
    st.dataframe(df)
