import dlt
import requests
import json
from pathlib import Path
import os
import pandas as pd


def get_data(url, params):
    response = requests.get(url, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode('utf8')).get("features")

@dlt.resource(write_disposition="merge")
def load_api_resource():
    street_name = "Borensvägen"
    url = f"https://openparking.stockholm.se/LTF-Tolken/v1/servicedagar/street/{street_name}"
    params = {
    "outputFormat": "json",
    "apiKey": "92e3ac4d-dfda-4fca-9ecb-1ca417538abd"
    }

    raw_data = get_data(url, params)
    # Iterate through the raw data and flatten each record
    for item in raw_data:
        # Create a new dictionary to hold the flattened data
        flat_record = {
            "id": item.get("id"),
            "type": item.get("type"),
            "geometry_type": item.get("geometry", {}).get("type"),
            "geometry_coordinates": item.get("geometry", {}).get("coordinates"),
        }
        
        # Merge the properties dictionary into the flat record
        flat_record.update(item.get("properties", {}))
        
        # Yield the flattened record
        yield flat_record

def run_pipeline(table_name):
    pipeline = dlt.pipeline(
        pipeline_name="ifood",
        destination="snowflake",
        dataset_name="staging",
    )
    load_info = pipeline.run(load_api_resource(), table_name=table_name)
    print(load_info)

if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    table_name = "parking_2"

    run_pipeline(table_name)