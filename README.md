## Coffee Break

[![CircleCI](https://circleci.com/gh/wnascy/coffee-break/tree/master.svg?style=svg)](https://circleci.com/gh/wnascy/coffee-break/tree/master)

This a blog to you share content for free. 

### How to contribute

Clone the project using git

Run the command bellow to **install**

```
docker-compose build
docker-compose up
docker-compose run web rake db:create
docker-compose run web rake db:migrate
``` 

To open the **project** run

```
docker-compose up
``` 

To the **tests** run

```
docker-compose run web rails test
``` 

## License

Copyright 2020 Weverson Nascimento.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
