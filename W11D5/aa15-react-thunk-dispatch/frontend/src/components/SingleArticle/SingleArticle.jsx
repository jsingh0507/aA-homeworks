import React from 'react';
import { useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';

const SingleArticle = () => {
  const { articleId } = useParams();
  const article = useSelector(state => 
    state.articleState.entries.find(article => article.id === parseInt(articleId))
  );

  if (!article) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h1>{article.title}</h1>
      <p>{article.body}</p>
      <img src={article.imageUrl} alt={article.title} />
    </div>
  );
};

export default SingleArticle;
