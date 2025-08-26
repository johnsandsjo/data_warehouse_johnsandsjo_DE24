import dlt
import pandas as pd
from pathlib import Path
import os

@dlt.resource(write_disposition="append")
def load_snowflake_resource(file_path:str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df.to_dict(orient="records")

if __name__ == "__main__":
    
    working_directory = Path(__file__).parent 
    os.chdir(working_directory)

    pipeline = dlt.pipeline(
        pipeline_name= "load_snowflake",
        destination= "snowflake",
        dataset_name= "staging", #schema
    )
    
    data= list(load_snowflake_resource(working_directory / "data" / "NetflixOriginals.csv", encoding="latin1"))
    
    #print(data)
    load_info = pipeline.run(data, table_name="netflix")

    print(load_info)