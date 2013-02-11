Server
======

The application intended for sending user activities to the [client][1] and handling responses from it. Sending of activities is developed through background jobs ([Resque lib][2]).

## Installation

 1. Install [Redis][3]
 2. Install this application
 3. Install [client][1] application
 4. If you have custom Redis settings put them in [config/initializers/resque.rb][4]
 5. Change client receiver url on yours in [config/settings.yml][5]

## Launching

 1. Run up Redis server
 2. Lanch resque workers through shell command in the project root directory of server:
    ```
    rake resque:work QUEUE=*
    ```
 3. Lanch server rails application
 4. Lanch client rails application
 5. At the root url of your server application you will find two links: one with provoking activity and one with aint provoking activity

You can find resque web interface at http://your-site-address/resque

## Specs

The app has specs. Yoy can run them through shell command from project directory:

```
rspec -cfn spec/
```


  [1]: https://github.com/Timrael/client
  [2]: https://github.com/defunkt/resque
  [3]: https://github.com/antirez/redis
  [4]: https://github.com/Timrael/server/blob/master/config/initializers/resque.rb
  [5]: https://github.com/Timrael/server/blob/master/config/settings.yml
