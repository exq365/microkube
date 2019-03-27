create database applogic;

use applogic;

CREATE TABLE withdrawal 
  ( 
     id       BIGINT NOT NULL auto_increment, 
     currency VARCHAR(30) NOT NULL, 
     rid      VARCHAR(50) NOT NULL, 
     user     VARCHAR(30) NOT NULL, 
     PRIMARY KEY (id) 
  ) 
engine = innodb;

create index withdrawal_user_currency_idx on withdrawal(user, currency);

CREATE TABLE referral_fees_schedule
  (
     id             BIGINT NOT NULL auto_increment, 
     currency       VARCHAR(30) NOT NULL, 
     rank           VARCHAR(30) NOT NULL, 
     rate           DECIMAL(32,16) NOT NULL, 
     PRIMARY KEY (id) 
  )
engine = innodb;

CREATE TABLE referral_fee
  (
     id                 BIGINT NOT NULL auto_increment, 
     uid                VARCHAR(30) NOT NULL, 
     rank               VARCHAR(30) NOT NULL, 
     currency           VARCHAR(30) NOT NULL, 
     referral_fee_rate  DECIMAL(32,16) NOT NULL, 
     transaction_fee    DECIMAL(32,16) NOT NULL, 
     referral_fee       DECIMAL(32,16) NOT NULL, 
     peatio_trade_id    BIGINT NOT NULL, 
     peatio_order_id    BIGINT NOT NULL, 
     type               VARCHAR(30) NOT NULL, 
     status             VARCHAR(30) NOT NULL, 
     created_date       DATETIME NOT NULL, 
     posted_date        DATETIME NOT NULL, 
     PRIMARY KEY (id) 
  )
engine = innodb;

CREATE TABLE peatio_trades
  (
     id                 BIGINT NOT NULL auto_increment, 
     batch_id           VARCHAR(38) NOT NULL,
     peatio_trade_id    BIGINT NOT NULL, 
     price              DECIMAL(32,16) NOT NULL, 
     volume             DECIMAL(32,16) NOT NULL, 
     funds              DECIMAL(32,16) NOT NULL, 
     bid                VARCHAR(30) NOT NULL, 
     ask                VARCHAR(30) NOT NULL, 
     bid_member         VARCHAR(30) NOT NULL, 
     bid_revenue        DECIMAL(32,16) NOT NULL, 
     ask_member         VARCHAR(30) NOT NULL, 
     ask_revenue        DECIMAL(32,16) NOT NULL, 
     created_date       DATETIME NOT NULL, 
     PRIMARY KEY (id) 
  )
engine = innodb;

create index peatio_trades_batch_id_idx on peatio_trades(batch_id);
create unique index peatio_trades_peatio_trade_id_idx on peatio_trades(peatio_trade_id);

CREATE TABLE user_banks
  (
    id                        BIGINT NOT NULL auto_increment,
    user_uid                  VARCHAR(30) NOT NULL,
    bank_account_holder_name  VARCHAR(30) NOT NULL,
    bank_name                 VARCHAR(30) NOT NULL,
    swift_code                VARCHAR(30) NOT NULL,
    bank_account_number       VARCHAR(30) NOT NULL,
    bank_branch               VARCHAR(30),
    PRIMARY KEY (id)
  )
engine = innodb;

create index user_banks_user_uid_idx on user_banks(user_uid);