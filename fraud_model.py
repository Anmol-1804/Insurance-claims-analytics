import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.impute import SimpleImputer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import roc_auc_score

df=pd.read_csv("insurance_fraud_clean.csv")
df=df[df["fraud_flag"].notna()].copy()

features=['age_of_driver', 'gender', 'marital_status', 'safety_rating', 'annual_income', 'high_education', 'address_change', 'property_status', 'claim_day_of_week', 'accident_site', 'past_num_of_claims', 'witness_present', 'liab_prct', 'channel', 'police_report', 'age_of_vehicle', 'vehicle_category', 'vehicle_price', 'vehicle_color', 'total_claim', 'injury_claim', 'policy deductible', 'annual premium', 'days open', 'form defects']
X=df[features]
y=df["fraud_flag"].astype(int)

cat_cols=[c for c in features if X[c].dtype=="object"]
num_cols=[c for c in features if c not in cat_cols]

pre=ColumnTransformer([
    ("num",Pipeline([("imputer",SimpleImputer(strategy="median")),("scaler",StandardScaler())]),num_cols),
    ("cat",Pipeline([("imputer",SimpleImputer(strategy="most_frequent")),("onehot",OneHotEncoder(handle_unknown="ignore"))]),cat_cols)
])
model=Pipeline([("preprocess",pre),("classifier",LogisticRegression(max_iter=1500,class_weight="balanced"))])

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=.25,stratify=y,random_state=42)
model.fit(X_train,y_train)
p=model.predict_proba(X_test)[:,1]
print("ROC-AUC:",round(roc_auc_score(y_test,p),4))
