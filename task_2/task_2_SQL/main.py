# coding=utf-8
import pandas as pd
import psycopg2
import pandas.io.sql as sqlio



#Single insert to database
def single_insert(conn, insert_req):
    cursor = conn.cursor()
    try:
        cursor.execute(insert_req)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print("Error: %s" % error)
        conn.rollback()
        cursor.close()
        return 1
    cursor.close()




if __name__ == '__main__':

    db = "dbname=%s user=%s password=%s host=%s port=%s" % ('test', 'test', 'test', 'localhost', '5432')
    schema = "public"
    conn = psycopg2.connect(db)

    cursor = conn.cursor()
    cursor.execute('drop table if exists public.second_task;')
    cursor.execute('CREATE TABLE public.second_task (\
       user_id VARCHAR (255) NOT NULL,\
       time date NOT NULL,\
       source VARCHAR (255) NOT NULL,\
       medium VARCHAR (255) NOT NULL,\
       registrations int NOT NULL\
     );')
    cursor.close()
    conn.commit()




    data_df = pd.read_csv('~/Desktop/Тестовое_задание_FB/task_2/data_2_task.csv', delimiter=';')
    data_df['Registrations'] = data_df['Registrations'].fillna(0)

    for ind_ in range(len(data_df)):
        query = """
            INSERT into public.second_task(
                            user_id,\
                            time,\
                            source,\
                            medium,\
                            registrations
            ) values('%s', '%s', '%s', '%s', %s);
                """ % (data_df['userid'][ind_],
                       data_df['time'][ind_],
                       data_df['source'][ind_],
                       data_df['medium'][ind_],
                       data_df['Registrations'][ind_]
                       )
        single_insert(conn, query)





    #first_click
    sql = """
        select 
            b.* 
        from public.second_task b 
        inner join (
                select distinct user_id, 
                                min(time) over(partition by user_id) as min_time 
                from public.second_task ) a on a.user_id = b.user_id and a.min_time = b.time

          ;"""
    data_df2 = sqlio.read_sql_query(sql, conn)
    print(data_df2.head())


    # last_click
    sql = """
            select 
                b.* 
            from public.second_task b 
            inner join (
                    select distinct user_id, 
                                    max(time) over(partition by user_id) as max_time 
                    from public.second_task ) a on a.user_id = b.user_id and a.max_time = b.time

              ;"""
    data_df2 = sqlio.read_sql_query(sql, conn)
    print(data_df2.head())


    #Last click non Direct
    sql = """
            select c.user_id, c.time, c.source, c.medium, c.registrations
            from (
                select 
                    user_id, 
                    max(time) over(partition by user_id) as max_time, 
                    time, 
                    source, medium, registrations
                from (
                        select 
                            a.* 
                        from public.second_task a 
                        where source not in ('direct') and medium not in ('none')
                    ) b
                ) c
            where c.max_time = c.time
        

         ;"""
    data_df2 = sqlio.read_sql_query(sql, conn)
    print(data_df2.head(10))

    # Linear
    sql = """
        select 
            t1.user_id, t1.time, t1.source, t1.medium, t1.registrations, t2.total/100 as linear
        from public.second_task t1 
        left join 
         (select user_id, cast(100/count(*) as decimal(10,7)) as total from public.second_task group by 1) t2 on t2.user_id = t1.user_id

         ;"""
    data_df2 = sqlio.read_sql_query(sql, conn)
    print(data_df2.head(10))













