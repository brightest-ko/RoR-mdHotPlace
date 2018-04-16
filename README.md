# md-hot-place
### Stayes Server Mac 에서 설정하기

- `Terminal` 에서 아래 작업들을 실행

1. `homebrew` 설치
	- `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

2. `Ruby` 설치
	- `brew install rbenv ruby-build`
	- `echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile`
	- `source ~/.bash_profile`
	- `rbenv install 2.4.2`

3. `Github` 셋팅 (안되어 있을시) [키 확인  `ls -al ~/.ssh`]
	- ssh key 생성 `ssh-keygen -t rsa -C "YOUR@EMAIL.com"`
	- 비밀번호 입력
	- 생성한 키 복사 `pbcopy < ~/.ssh/id_rsa.pub`
	- github setting page 에서 ssh key 등록
	- `ssh -T git@github.com` 입력후 성공메세지가 뜨면 완료

4. `Rails` 설치
	- `gem install rails -v 5.0.6`
	- `rbenv rehash`

5. 저장소 로컬에 clone
	- `git clone git@github.com:Stayes/md-hot-place.git`
	- `rbenv local 2.4.2`

6. `gem` 설치
	- `gem install bundler`
	- `gem install libv8 -- --with-system-v8`
	- `gem install rubocop scss_lint`
	- `bundle`

7.  `gem` 적용
	아래의  gem list 참고
	- `bundle install`

8. `Rails server 실행`
	- `rails s`


### DB setup

- [프로덕션 DB를 로컬로 마이그레이션 하기](https://github.com/Stayes/web/wiki/%ED%94%84%EB%A1%9C%EB%8D%95%EC%85%98-DB%EB%A5%BC-%EB%A1%9C%EC%BB%AC%EB%A1%9C-%EB%A7%88%EC%9D%B4%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%85%98) 참고.
- `cp config/database.yml.example config/database.yml`
- `rake db:migrate`

### gem LIST
	- `gem install carrierwave`
	- In Rails, add it to your Gemfile: `gem 'carrierwave', '~> 1.0'`
	- `rails generate uploader Avatar`
	- In Rails, add it to your Gemfile: `gem 'mini_magick'`
	- In Rails, add it to your Gemfile: `gem 'fog-aws'`

	devise gem 
	- In Rails, add it to your Gemfile: `gem 'devise'`
	- `rails generate devise:install`

	bootstrap gem
	- In Rails, add it to your Gemfile: `gem 'bootstrap', '~> 4.0.0'`

	jquery & ajax gem
	- In Rails, add it to your Gemfile: `gem 'jquery-rails'`

	bootstrap paginate gem & pagination gem
	- In Rails, add it to your Gemfile: `gem 'will_paginate-bootstrap'`
	- In Rails, add it to your Gemfile: `gem 'will_paginate', '~> 3.0.6'`