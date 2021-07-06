
import json
import facebook
import requests
import urllib2
import pandas as pd
import logging
import time
import os
import sys
import socket
import psycopg2
from dotenv import load_dotenv, find_dotenv
load_dotenv(find_dotenv())


def get_logger(message, encoding):
    log = logging.getLogger()
    if not len(log.handlers):
        log.setLevel(logging.INFO)
        formatter = logging.Formatter(
            '%(asctime)s "%(levelname)s" "{}" "{}" \'"%(filename)s:%(lineno)d" "{}" "%(message)s"'.format(
                socket.gethostname(), 'test_facebook_API', 'main.py'),
            datefmt='%Y-%m-%dT%H:%M:%S%z')
        sh = logging.StreamHandler(stream=sys.stdout)
        sh.setFormatter(formatter)
        log.addHandler(sh)
    return log



def find_between(s, first, last):
    try:
        start = s.index(first) + len(first)
        end = s.index(last, start)
        return s[start:end]
    except ValueError:
        return ""



def check_limit():
    account_number = '4612769778742098'
    token = 'EABBjSigXs1IBAAZBBnQrO84ix4BJZA6EU0WTGA2t7qW9aYKxuE6ztGwCuJVD7vypdZCbJ9sZBpN3GkyqnZB6lLE6A7kQOhtTv9q5VoL8vs6ViGkHxIsLT7Q65V06bh0TS1AtVOnXZCbv8ZCnaIGs4lEgX7ZCWxJlNZArB2f5UZARsVVLNIGKb8A7KrIOiotgeCHHZBWM0LLWYcXo9HCLPxE7z72nFjYwgMh9QVLyphHZB5RvwhwtiOhAcscWhEBOHBSA8MEZD'
    check = requests.get('https://graph.facebook.com/v3.3/act_'+account_number+'/insights?access_token='+token)
    if check.status_code == 200:

        call = float(find_between(check.headers['x-business-use-case-usage'], 'call_count":', '}'))
        cpu = float(find_between(check.headers['x-business-use-case-usage'], 'total_cputime":', '}'))
        total = float(find_between(check.headers['x-business-use-case-usage'], 'total_time":', ','))
        usage = max(call, cpu, total)
        if (usage > 75):
            message = '75% Rate Limit Reached. Cooling Time 5 Minutes.'
            log = get_logger(message, encoding='utf-8')
            log.info(message)
            time.sleep(300)

    else:
        print('I don\'t have some permissions for logging')


def facebook_df_samples():
    # Use a breakpoint in the code line below to debug your script.
    #token = {'EAAFyDc118qoBAIUBXRWQqKLvIh23g4Rmp7jUvubpONbm8ZCAugHLh7GamH7mZAzge5ivXowre0yW2GZAJ3Rd7GxF6lKq8HHgGZBph16L6XcTSzhE4uWD68x5nUVyrebDxI0wHgEq2Ys2SggIN9y1jI4duxywcIhuZCJUvb3P4K38wnLs7JZBZBrvZAGjGvkFAOoNEAuZBZAwic0ln6pPmAQmJP1hbSZAqmvcZCv8tgHk1nYvoq8W4VYhJ61w5K2ictGOOccZD'}
    #token = {'EAAFyDc118qoBAGtBM8Qpt17A6F1mdMrI29YlTfrGPTxrouXBIhRcApnGunJJm5KVw8nmlcfkq6VXv5y6LpH9HRbBdTtSsWOld3hcxTjp3GZCYCJ9g04wmOeg8JVsmcp3kUOmcFhohg2ZCFloeWF1ZBKHYmFOZCQ1DtYzuMLm6csvYwDktrIKvIDMW0mcwTqmOt63p3sZCZCgUL7h7l7LwTH4OBDZBEZBTuOZBx0WYm7zyQeT4d3F5PGvx5GPV7cod4CQZD'}
    #token = {'EABBjSigXs1IBAJFHagvxA23pJojHa8AujF144ZAXDOhZBVmJi75dQMZC3hLyJwUZCcNtZCOjzR7kSFJiY3qkXoz0TP5khtUnKd0PR1deu59R3LRTdrI0S5a2i6VUB0ZB5sbhruZA3VjqIlxGR98naFzaeemue55moTN7UTY9zfwhGzKdgWYTSnyNMzgRk1MtgVJLdYoXgvLu2hlU5SdZCdhtqCLn9erSWUMC3d4BcExD26xsUyEl2dH5SFs5VWHRmZBgZD'}
    token = {'EABBjSigXs1IBAAZBBnQrO84ix4BJZA6EU0WTGA2t7qW9aYKxuE6ztGwCuJVD7vypdZCbJ9sZBpN3GkyqnZB6lLE6A7kQOhtTv9q5VoL8vs6ViGkHxIsLT7Q65V06bh0TS1AtVOnXZCbv8ZCnaIGs4lEgX7ZCWxJlNZArB2f5UZARsVVLNIGKb8A7KrIOiotgeCHHZBWM0LLWYcXo9HCLPxE7z72nFjYwgMh9QVLyphHZB5RvwhwtiOhAcscWhEBOHBSA8MEZD'}
    user = '100070092287271'


    graph = facebook.GraphAPI(token, version = 3.1)
    fields = ['posts{comments}']
    fields = ','.join(fields)

    #comment download
    profile = graph.get_object('me', fields = fields)
    profile_comments = profile
    print(profile_comments['posts']['data'][0]['comments']['data'][0]['created_time'])
    comment_date_list, post_id_list, comment_user_id, comment_name_list, comment_text_list = [], [], [], [], []
    for ind_ in range(len(profile_comments['posts']['data'])):
        try:
            dict_of_comment = profile_comments['posts']['data'][ind_]['comments']['data'][0]
            comment_date_list.append(dict_of_comment['created_time'])
            post_id_list.append(profile_comments['posts']['data'][ind_]['id'])
            comment_text_list.append(dict_of_comment['message'])
            comment_user_id.append(dict_of_comment['from']['id'])
            comment_name_list.append(dict_of_comment['from']['name'])
        except:
            pass

    #posts stats
    comment_df = pd.DataFrame({
        'comment_date': comment_date_list,
        'post_id': post_id_list,
        'comment_user_id': comment_user_id,
        'user_id_name': comment_name_list,
        'comment_text': comment_text_list})
    print(comment_df.head())


    #posts download
    graph = facebook.GraphAPI(token, version = 3.1)
    fields = ['posts']
    fields = ','.join(fields)
    profile = graph.get_object('me', fields = fields)
    profile_comments = profile

    posts_id_list, post_date_list, post_user_id_list, post_text_list = [], [], [], []
    for ind_ in range(len(profile_comments['posts']['data'])):
        try:
            dict_of_posts = profile_comments['posts']['data'][ind_]
            post_text_list.append(dict_of_posts['message'])
            post_date_list.append(dict_of_posts['created_time'])
            posts_id_list.append(dict_of_posts['id'])
            post_user_id_list.append(profile_comments['id'])
        except:
            pass


    posts_df = pd.DataFrame({
        'post_id': posts_id_list,
        'user_id': post_user_id_list,
        'post_text': post_text_list,
        'post_date': post_date_list
    })
    print(posts_df.head())

    return posts_df, comment_df


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

    posts_df, comment_df = facebook_df_samples()
    check_limit()



    cursor = conn.cursor()
    cursor.execute('drop table if exists public.facebook_posts;')
    cursor.execute('CREATE TABLE public.facebook_posts (\
       post_id VARCHAR (255) NOT NULL,\
       user_id VARCHAR (255) NOT NULL,\
       post_text VARCHAR (255) NOT NULL,\
       post_date date NOT NULL\
     );')
    cursor.close()
    conn.commit()

    cursor = conn.cursor()
    cursor.execute('drop table if exists public.comment_info;')
    cursor.execute('CREATE TABLE public.comment_info (\
       post_id VARCHAR (255) NOT NULL,\
       comment_text VARCHAR (255) NOT NULL,\
       user_id_name VARCHAR (255) NOT NULL,\
       comment_user_id VARCHAR (255) NOT NULL,\
       comment_date date NOT NULL\
     );')
    cursor.close()
    conn.commit()

    for ind_ in range(len(posts_df)):
        query = """
            INSERT into public.facebook_posts(
                            post_id,\
                            user_id,\
                            post_text,\
                            post_date
            ) values('%s', '%s', '%s', '%s');
                """ % (posts_df['post_id'][ind_],
                       posts_df['user_id'][ind_],
                       posts_df['post_text'][ind_],
                       posts_df['post_date'][ind_]
                       )
        single_insert(conn, query)

    for ind_ in range(len(comment_df)):
        query = """
                INSERT into public.comment_info(
                            post_id,\
                            comment_date,\
                            comment_user_id,\
                            user_id_name,\
                            comment_text
                ) values('%s', '%s', '%s', '%s', '%s');
                """ % (comment_df['post_id'][ind_],
                       comment_df['comment_date'][ind_],
                       comment_df['comment_user_id'][ind_],
                       comment_df['user_id_name'][ind_],
                       comment_df['comment_text'][ind_]
                       )
        single_insert(conn, query)
