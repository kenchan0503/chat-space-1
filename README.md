# Database creation

### messages table
| column | type   |
|:-------|:-------|
|body    |text    |
|image   |string  |
|group_id|integer |
|user_id |integer |

### users table
| column | type   |
|:-------|:-------|
|nickname|string  |

*※ログイン情報についてはgem(devise)を使用*

### group table
| column | type   |
|:-------|:-------|
|name    |string  |

### users_groups table
| column | type   |
|:-------|:-------|
|user_id |integer |
|group_id|integer |
