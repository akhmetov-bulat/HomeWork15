import sqlite3



def get_info(itemid):
    connection = sqlite3.connect('animal.db')
    cursor = connection.cursor()
    query = f'''SELECT animal_id, name, breeds.breed, types.type, a.color, b.color, outcomes.type,
                outcomes.year from fin_table
                LEFT JOIN breeds ON fin_table.'index' = breeds.id
                LEFT JOIN types ON fin_table.type_id = types.id
                LEFT JOIN outcomes ON fin_table."index" = outcomes."index" 
                LEFT JOIN colors as a ON trim(fin_table.color1) = a.id
                LEFT JOIN colors as b ON trim(fin_table.color2) = b.id 
                WHERE fin_table.'index' = {itemid}
                '''
    cursor.execute(query)
    raw_data = cursor.fetchall()
    data = {}
    for id, name, breed, type, color1, color2, outcome_type, outcome_year in raw_data:
        data = {"Animal id":id,
                "Name":name,
                "Breed":breed,
                "Type": type,
                "Main color":color1,
                "Secondary color":color2,
                "Outcome type":outcome_type,
                "Outcome year":outcome_year}
    return data

