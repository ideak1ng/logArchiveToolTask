# logArchiveToolTask
Project for "Log Archive Tool" task from Linux roadmap on (roadmap.sh)

## Installing (Manual)
1. **Download project**, you can just download zip or use `git clone https://github.com/ideak1ng/logArchiveToolTask.git` command in your terminal
2. Unzip files if you downloaded project as zip, then **go to logArchiveToolTask directory**, you can use `cd logArchiveToolTask` if you used `git clone`.
3. **Copy log-archive.sh to /usr/local/bin directory**, you can do it by using `sudo cp log-archive.sh /usr/local/bin/log-archive`
4. **Give execute permissions to log-archive script** `sudo chmod u+x /usr/loca/bin/log-archive`
Done! Now you can use `log-archive <log-directory>`, but it will works only for **your user**, if you want to access that command from any user you should gibe execute permission to "others", you can do it by using `sudo chmod o+rx` 

## Installing (Auto)
1. **Download project**, you can just download zip or use `git clone https://github.com/ideak1ng/logArchiveToolTask.git` command in your terminal
2. Unzip files if you downloaded project as zip, then **go to logArchiveToolTask directory**, you can use `cd logArchiveToolTask` if you used `git clone`.
3. **Give execute permissions to installer script** `sudo chmod u+x install.sh` and then **run install.sh** by `./install.sh`.

## Usage
- `log-archive <log-directory>` this command will **archive your directory in tar.gz format and place that archive to */your-home-dir/archivedLogs* directory**. **Logs** will store in */your-home-dir/archivedLogs/logs.log* and **error logs** will store in */your-home-dir/archivedLogs/errorLogs.log*
