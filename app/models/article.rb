class Article < ApplicationRecord
validates:Title,presence: true ,length:{minimum:6,maximum:100}
validates:Description,presence:true,length:{minimum:15,maximum:300}
end