# Database creation

### messages table
| column | type   |not null|index|foreign key|unique|
|:-------|:-------|:-------|:-------|:-------|:-------|
|body    |text    |◯       |        |        |        |
|image   |string  |        |        |        |        |
|group_id|integer |◯       |        |◯       |◯       |
|user_id |integer |◯       |        |◯       |◯       |

### users table
| column | type   |not null|index|foreign key|unique|
|:-------|:-------|:-------|:-------|:-------|:-------|
|nickname|string  |◯       |◯       |        |◯       |

*※ログイン情報についてはgem(devise)を使用*

### group table
| column | type   |not null|index|foreign key|unique|
|:-------|:-------|:-------|:-------|:-------|:-------|
|name    |string  |◯       |◯       |        |◯       |

### users_groups table
| column | type   |not null|index|foreign key|unique|
|:-------|:-------|:-------|:-------|:-------|:-------|
|user_id |integer |◯       |        |◯       |◯       |
|group_id|integer |◯       |        |◯       |◯       |

###アソシエーション
- message belongs_to user
- message belongs_to group
- user has_many messages
- user has_many groups
- group has_many messages
- group has_many users