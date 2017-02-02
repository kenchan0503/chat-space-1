# Database creation

### messages table
| column | type      |not null|index|foreign key|unique|
|:-------|:----------|:-------|:-------|:-------|:-------|
|body    |text       |◯       |        |        |        |
|image   |string     |        |        |        |        |
|group_id|references |◯       |◯       |◯       |◯       |
|user_id |references |◯       |◯       |◯       |◯       |

- belongs_to user
- belongs_to group

### users table
| column | type   |not null|index|foreign key|unique|
|:-------|:-------|:-------|:-------|:-------|:-------|
|nickname|string  |◯       |◯       |        |◯       |


*※ログイン情報についてはgem(devise)を使用*

- has_many messages
- has_many user_groups
- has_many groups, through user_groups


### groups table
| column | type   |not null|index|foreign key|unique|
|:-------|:-------|:-------|:-------|:-------|:-------|
|name    |string  |◯       |        |        |◯       |

- has_many messages
- has_many user_groups
- has_many users, through user_groups

### users_groups table
| column | type       |not null|index|foreign key|unique|
|:-------|:-----------|:-------|:-------|:-------|:-------|
|user_id |references  |◯       |◯       |◯       |◯       |
|group_id|references  |◯       |◯       |◯       |◯       |

- belongs_to user
- belongs_to group


