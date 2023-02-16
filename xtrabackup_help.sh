[root@deneil-barbican-test-seting xtrabackup]# xtrabackup 
xtrabackup: recognized server arguments: --datadir=/var/lib/mysql 
xtrabackup: recognized client arguments: 
xtrabackup version 2.4.27 based on MySQL server 5.7.40 Linux (x86_64) (revision id: aae8e82)
Open source backup tool for InnoDB and XtraDB

Copyright (C) 2009-2017 Percona LLC and/or its affiliates.
Portions Copyright (C) 2000, 2011, MySQL AB & Innobase Oy. All Rights Reserved.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation version 2
of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You can download full text of the license on http://www.gnu.org/licenses/gpl-2.0.txt

Usage: [xtrabackup [--defaults-file=#] --backup | xtrabackup [--defaults-file=#] --prepare] [OPTIONS]

Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf 
The following groups are read: xtrabackup mysqld
The following options may be given as the first argument:
--print-defaults        Print the program argument list and exit.
--no-defaults           Don't read default options from any option file,
                        except for login file.
--defaults-file=#       Only read default options from the given file #.
--defaults-extra-file=# Read this file after the global files are read.
--defaults-group-suffix=#
                        Also read groups with concat(group, suffix)
--login-path=#          Read this path from the login file.
  -v, --version       print xtrabackup version information
  --target-dir=name   destination directory
  --backup            take backup to target-dir
  --stats             calc statistic of datadir (offline mysqld is recommended)
  --prepare           prepare a backup for starting mysql server on the backup.
  --export            create files to import to another database when prepare.
  --apply-log-only    stop recovery process not to progress LSN after applying
                      log when prepare.
  --print-param       print parameter of mysqld needed for copyback.
  --use-memory=#      The value is used instead of buffer_pool_size
  --throttle=#        limit count of IO operations (pairs of read&write) per
                      second to IOS values (for '--backup')
  --log[=name]        Ignored option for MySQL option compatibility
  --log-copy-interval=# 
                      time interval between checks done by log copying thread
                      in milliseconds (default is 1 second).
  --extra-lsndir=name (for --backup): save an extra copy of the
                      xtrabackup_checkpoints file in this directory.
  --incremental-lsn=name 
                      (for --backup): copy only .ibd pages newer than specified
                      LSN 'high:low'. ##ATTENTION##: If a wrong LSN value is
                      specified, it is impossible to diagnose this, causing the
                      backup to be unusable. Be careful!
  --incremental-basedir=name 
                      (for --backup): copy only .ibd pages newer than backup at
                      specified directory.
  --incremental-dir=name 
                      (for --prepare): apply .delta files and logfile in the
                      specified directory.
  --to-archived-lsn=# Don't apply archived logs with bigger log sequence
                      number.
  --tables=name       filtering by regexp for table names.
  --tables-file=name  filtering by list of the exact database.table name in the
                      file.
  --databases=name    filtering by list of databases.
  --databases-file=name 
                      filtering by list of databases in the file.
  --tables-exclude=name 
                      filtering by regexp for table names. Operates the same
                      way as --tables, but matched names are excluded from
                      backup. Note that this option has a higher priority than
                      --tables.
  --databases-exclude=name 
                      Excluding databases based on name, Operates the same way
                      as --databases, but matched names are excluded from
                      backup. Note that this option has a higher priority than
                      --databases.
  --create-ib-logfile ** not work for now** creates ib_logfile* also after
                      '--prepare'. ### If you want create ib_logfile*, only
                      re-execute this command in same options. ###
  --stream=name       Stream all backup files to the standard output in the
                      specified format. Currently supported formats are 'tar'
                      and 'xbstream'.
  --compress[=name]   Compress individual backup files using the specified
                      compression algorithm. Currently the only supported
                      algorithm is 'quicklz'. It is also the default algorithm,
                      i.e. the one used when --compress is used without an
                      argument.
  --compress-threads=# 
                      Number of threads for parallel data compression. The
                      default value is 1.
  --compress-chunk-size=# 
                      Size of working buffer(s) for compression threads in
                      bytes. The default value is 64K.
  --encrypt=name      Encrypt individual backup files using the specified
                      encryption algorithm.
  --encrypt-key=name  Encryption key to use.
  --encrypt-key-file=name 
                      File which contains encryption key to use.
  --encrypt-threads=# Number of threads for parallel data encryption. The
                      default value is 1.
  --encrypt-chunk-size=# 
                      Size of working buffer(S) for encryption threads in
                      bytes. The default value is 64K.
  --compact           Create a compact backup by skipping secondary index
                      pages.
  --rebuild-indexes   Rebuild secondary indexes in InnoDB tables after applying
                      the log. Only has effect with --prepare.
  --rebuild-threads=# Use this number of threads to rebuild indexes in a
                      compact backup. Only has effect with --prepare and
                      --rebuild-indexes.
  --incremental-force-scan 
                      Perform a full-scan incremental backup even in the
                      presence of changed page bitmap data
  --close-files       do not keep files opened. Use at your own risk.
  --core-file         Write core on fatal signals
  --copy-back         Copy all the files in a previously made backup from the
                      backup directory to their original locations.
  --move-back         Move all the files in a previously made backup from the
                      backup directory to the actual datadir location. Use with
                      caution, as it removes backup files.
  --galera-info       This options creates the xtrabackup_galera_info file
                      which contains the local node state at the time of the
                      backup. Option should be used when performing the backup
                      of Percona-XtraDB-Cluster. Has no effect when backup
                      locks are used to create the backup.
  --slave-info        This option is useful when backing up a replication slave
                      server. It prints the binary log position and name of the
                      master server. It also writes this information to the
                      "xtrabackup_slave_info" file as a "CHANGE MASTER"
                      command. A new slave for this master can be set up by
                      starting a slave server on this backup and issuing a
                      "CHANGE MASTER" command with the binary log position
                      saved in the "xtrabackup_slave_info" file.
  --no-lock           Use this option to disable table lock with "FLUSH TABLES
                      WITH READ LOCK". Use it only if ALL your tables are
                      InnoDB and you DO NOT CARE about the binary log position
                      of the backup. This option shouldn't be used if there are
                      any DDL statements being executed or if any updates are
                      happening on non-InnoDB tables (this includes the system
                      MyISAM tables in the mysql database), otherwise it could
                      lead to an inconsistent backup. If you are considering to
                      use --no-lock because your backups are failing to acquire
                      the lock, this could be because of incoming replication
                      events preventing the lock from succeeding. Please try
                      using --safe-slave-backup to momentarily stop the
                      replication slave thread, this may help the backup to
                      succeed and you then don't need to resort to using this
                      option.
  --lock-ddl          Issue LOCK TABLES FOR BACKUP if it is supported by server
                      at the beginning of the backup to block all DDL
                      operations.
  --lock-ddl-timeout=# 
                      If LOCK TABLES FOR BACKUP does not return within given
                      timeout, abort the backup.
  --lock-ddl-per-table 
                      Lock DDL for each table before xtrabackup starts the copy
                      phase and until the backup is completed.
  --backup-lock-timeout=# 
                      Timeout in seconds for attempts to acquire metadata
                      locks.
  --backup-lock-retry-count=# 
                      Number of attempts to acquire metadata locks.
  --dump-innodb-buffer-pool 
                      Instruct MySQL server to dump innodb buffer pool by
                      issuing a SET GLOBAL innodb_buffer_pool_dump_now=ON 
  --dump-innodb-buffer-pool-timeout=# 
                      This option specifies the number of seconds xtrabackup
                      waits for innodb buffer pool dump to complete
  --dump-innodb-buffer-pool-pct=# 
                      This option specifies the percentage of buffer pool to be
                      dumped 
  --safe-slave-backup Stop slave SQL thread and wait to start backup until
                      Slave_open_temp_tables in "SHOW STATUS" is zero. If there
                      are no open temporary tables, the backup will take place,
                      otherwise the SQL thread will be started and stopped
                      until there are no open temporary tables. The backup will
                      fail if Slave_open_temp_tables does not become zero after
                      --safe-slave-backup-timeout seconds. The slave SQL thread
                      will be restarted when the backup finishes.
  --rsync             Uses the rsync utility to optimize local file transfers.
                      When this option is specified, innobackupex uses rsync to
                      copy all non-InnoDB files instead of spawning a separate
                      cp for each file, which can be much faster for servers
                      with a large number of databases or tables.  This option
                      cannot be used together with --stream.
  --force-non-empty-directories 
                      This option, when specified, makes --copy-back or
                      --move-back transfer files to non-empty directories. Note
                      that no existing files will be overwritten. If
                      --copy-back or --nove-back has to copy a file from the
                      backup directory which already exists in the destination
                      directory, it will still fail with an error.
  --no-version-check  This option disables the version check which is enabled
                      by the --version-check option.
  --tables-compatibility-check 
                      This option enables engine compatibility warning.
                      (Defaults to on; use --skip-tables-compatibility-check to disable.)
  --no-backup-locks   This option controls if backup locks should be used
                      instead of FLUSH TABLES WITH READ LOCK on the backup
                      stage. The option has no effect when backup locks are not
                      supported by the server. This option is enabled by
                      default, disable with --no-backup-locks.
  --decompress        Decompresses all files with the .qp extension in a backup
                      previously made with the --compress option.
  -u, --user=name     This option specifies the MySQL username used when
                      connecting to the server, if that's not the current user.
                      The option accepts a string argument. See mysql --help
                      for details.
  -H, --host=name     This option specifies the host to use when connecting to
                      the database server with TCP/IP.  The option accepts a
                      string argument. See mysql --help for details.
  -P, --port=#        This option specifies the port to use when connecting to
                      the database server with TCP/IP.  The option accepts a
                      string argument. See mysql --help for details.
  -p, --password[=name] 
                      This option specifies the password to use when connecting
                      to the database. It accepts a string argument.  See mysql
                      --help for details.
  -S, --socket=name   This option specifies the socket to use when connecting
                      to the local database server with a UNIX domain socket. 
                      The option accepts a string argument. See mysql --help
                      for details.
  --incremental-history-name=name 
                      This option specifies the name of the backup series
                      stored in the PERCONA_SCHEMA.xtrabackup_history history
                      record to base an incremental backup on. Xtrabackup will
                      search the history table looking for the most recent
                      (highest innodb_to_lsn), successful backup in the series
                      and take the to_lsn value to use as the starting lsn for
                      the incremental backup. This will be mutually exclusive
                      with --incremental-history-uuid, --incremental-basedir
                      and --incremental-lsn. If no valid lsn can be found (no
                      series by that name, no successful backups by that name)
                      xtrabackup will return with an error. It is used with the
                      --incremental option.
  --incremental-history-uuid=name 
                      This option specifies the UUID of the specific history
                      record stored in the PERCONA_SCHEMA.xtrabackup_history to
                      base an incremental backup on.
                      --incremental-history-name, --incremental-basedir and
                      --incremental-lsn. If no valid lsn can be found (no
                      success record with that uuid) xtrabackup will return
                      with an error. It is used with the --incremental option.
  --decrypt=name      Decrypts all files with the .xbcrypt extension in a
                      backup previously made with --encrypt option.
  --remove-original   Remove .qp and .xbcrypt files after decryption and
                      decompression.
  --ftwrl-wait-query-type=name 
                      This option specifies which types of queries are allowed
                      to complete before innobackupex will issue the global
                      lock. Default is all.
  --kill-long-query-type=name 
                      This option specifies which types of queries should be
                      killed to unblock the global lock. Default is "SELECT".
  --history[=name]    This option enables the tracking of backup history in the
                      PERCONA_SCHEMA.xtrabackup_history table. An optional
                      history series name may be specified that will be placed
                      with the history record for the current backup being
                      taken.
  --kill-long-queries-timeout=# 
                      This option specifies the number of seconds innobackupex
                      waits between starting FLUSH TABLES WITH READ LOCK and
                      killing those queries that block it. Default is 0
                      seconds, which means innobackupex will not attempt to
                      kill any queries.
  --ftwrl-wait-timeout=# 
                      This option specifies time in seconds that innobackupex
                      should wait for queries that would block FTWRL before
                      running it. If there are still such queries when the
                      timeout expires, innobackupex terminates with an error.
                      Default is 0, in which case innobackupex does not wait
                      for queries to complete and starts FTWRL immediately.
  --ftwrl-wait-threshold=# 
                      This option specifies the query run time threshold which
                      is used by innobackupex to detect long-running queries
                      with a non-zero value of --ftwrl-wait-timeout. FTWRL is
                      not started until such long-running queries exist. This
                      option has no effect if --ftwrl-wait-timeout is 0.
                      Default value is 60 seconds.
  --debug-sleep-before-unlock=# 
                      This is a debug-only option used by the XtraBackup test
                      suite.
  --safe-slave-backup-timeout=# 
                      How many seconds --safe-slave-backup should wait for
                      Slave_open_temp_tables to become zero. (default 300)
  --binlog-info[=name] 
                      This option controls how XtraBackup should retrieve
                      server's binary log coordinates corresponding to the
                      backup. Possible values are OFF, ON, LOCKLESS and AUTO.
                      See the XtraBackup manual for more information
  --reencrypt-for-server-id=# 
                      Re-encrypt tablespace keys for given server-id.
  --check-privileges  Check database user privileges before performing any
                      query.
  --read-buffer-size[=#] 
                      Set datafile read buffer size, given value is scaled up
                      to page size. Default is 10Mb.
  --ssl-mode=name     SSL connection mode.
  --ssl               Deprecated. Use --ssl-mode instead.
                      (Defaults to on; use --skip-ssl to disable.)
  --ssl-verify-server-cert 
                      Deprecated. Use --ssl-mode=VERIFY_IDENTITY instead.
  --ssl-ca=name       CA file in PEM format.
  --ssl-capath=name   CA directory.
  --ssl-cert=name     X509 cert in PEM format.
  --ssl-cipher=name   SSL cipher to use.
  --ssl-key=name      X509 key in PEM format.
  --ssl-crl=name      Certificate revocation list.
  --ssl-crlpath=name  Certificate revocation list path.
  --tls-version=name  TLS version to use, permitted values are: TLSv1, TLSv1.1,
                      TLSv1.2
  --server-public-key-path=name 
                      File path to the server public RSA key in PEM format.
  -h, --datadir=name  Path to the database root.
  -t, --tmpdir=name   Path for temporary files. Several paths may be specified,
                      separated by a colon (:), in this case they are used in a
                      round-robin fashion.
  --parallel=#        Number of threads to use for parallel datafiles transfer.
                      The default value is 1.
  --log[=name]        Ignored option for MySQL option compatibility
  --log-bin[=name]    Base name for the log sequence
  --innodb[=name]     Ignored option for MySQL option compatibility
  --innodb-adaptive-hash-index 
                      Enable InnoDB adaptive hash index (enabled by default). 
                      Disable with --skip-innodb-adaptive-hash-index.
                      (Defaults to on; use --skip-innodb-adaptive-hash-index to disable.)
  --innodb-autoextend-increment=# 
                      Data file autoextend increment in megabytes
  --innodb-buffer-pool-size=# 
                      The size of the memory buffer InnoDB uses to cache data
                      and indexes of its tables.
  --innodb-checksums  Enable InnoDB checksums validation (enabled by default).
                      Disable with --skip-innodb-checksums.
                      (Defaults to on; use --skip-innodb-checksums to disable.)
  --innodb-data-file-path=name 
                      Path to individual files and their sizes.
  --innodb-data-home-dir=name 
                      The common part for InnoDB table spaces.
  --innodb-doublewrite 
                      Enable InnoDB doublewrite buffer (enabled by default).
                      Disable with --skip-innodb-doublewrite.
                      (Defaults to on; use --skip-innodb-doublewrite to disable.)
  --innodb-io-capacity[=#] 
                      Number of IOPs the server can do. Tunes the background IO
                      rate
  --innodb-file-io-threads=# 
                      Number of file I/O threads in InnoDB.
  --innodb-read-io-threads=# 
                      Number of background read I/O threads in InnoDB.
  --innodb-write-io-threads=# 
                      Number of background write I/O threads in InnoDB.
  --innodb-file-per-table 
                      Stores each InnoDB table to an .ibd file in the database
                      dir.
  --innodb-flush-log-at-trx-commit[=#] 
                      Set to 0 (write and flush once per second), 1 (write and
                      flush at each commit) or 2 (write at commit, flush once
                      per second).
  --innodb-flush-method=name 
                      With which method to flush data.
  --innodb-force-recovery=# 
                      Helps to save your data in case the disk image of the
                      database becomes corrupt.
  --innodb-log-arch-dir=name 
                      Where full logs should be archived.
  --innodb-log-buffer-size=# 
                      The size of the buffer which InnoDB uses to write log to
                      the log files on disk.
  --innodb-log-file-size=# 
                      Size of each log file in a log group.
  --innodb-log-files-in-group=# 
                      Number of log files in the log group. InnoDB writes to
                      the files in a circular fashion. Value 3 is recommended
                      here.
  --innodb-log-group-home-dir=name 
                      Path to InnoDB log files.
  --innodb-max-dirty-pages-pct=# 
                      Percentage of dirty pages allowed in bufferpool.
  --innodb-open-files=# 
                      How many files at the maximum InnoDB keeps open at the
                      same time.
  --innodb-use-native-aio 
                      Use native AIO if supported on this platform.
  --innodb-page-size=# 
                      The universal page size of the database.
  --innodb-log-block-size=# 
                      The log block size of the transaction log file. Changing
                      for created log file is not supported. Use on your own
                      risk!
  --innodb-fast-checksum 
                      Change the algorithm of checksum for the whole of
                      datapage to 4-bytes word based.
  --innodb-doublewrite-file=name 
                      Path to special datafile for doublewrite buffer. (default
                      is : not used)
  --innodb-buffer-pool-filename=name 
                      Filename to/from which to dump/load the InnoDB buffer
                      pool
  --debug-sync=name   Debug sync point. This is only used by the xtrabackup
                      test suite
  -#, --debug[=name]  Output debug log. Default all ib_log output to stderr. To
                      redirect all ib_log output to separate file, use
                      --debug=d,ib_log:o,/tmp/xtrabackup.trace
  --innodb-checksum-algorithm=name 
                      The algorithm InnoDB uses for page checksumming. [CRC32,
                      STRICT_CRC32, INNODB, STRICT_INNODB, NONE, STRICT_NONE]
  --innodb-log-checksum-algorithm=name 
                      The algorithm InnoDB uses for log checksumming. [CRC32,
                      STRICT_CRC32, INNODB, STRICT_INNODB, NONE, STRICT_NONE]
  --innodb-undo-directory=name 
                      Directory where undo tablespace files live, this path can
                      be absolute.
  --innodb-undo-tablespaces=# 
                      Number of undo tablespaces to use.
  --defaults-group=name 
                      defaults group in config file (default "mysqld").
  --open-files-limit=# 
                      the maximum number of file descriptors to reserve with
                      setrlimit().
  --redo-log-version=# 
                      Redo log version of the backup. For --prepare only.
  --server-id=#       The server instance being backed up
  --transition-key[=name] 
                      Transition key to encrypt tablespace keys with.
  --xtrabackup-plugin-dir=name 
                      Directory for xtrabackup plugins.
  --generate-new-master-key 
                      Generate new master key when doing copy-back.
  --generate-transition-key 
                      Generate transition key and store it into keyring.

Variables (--variable-name=value)
and boolean options {FALSE|TRUE}  Value (after reading options)