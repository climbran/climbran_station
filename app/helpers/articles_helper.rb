module ArticlesHelper
 def article_genre(article)
   Genre.find(article.genre_id).name
 end
end
