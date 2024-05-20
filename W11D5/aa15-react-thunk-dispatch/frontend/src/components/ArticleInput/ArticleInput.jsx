import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { writeArticle } from '../../store/articleReducer';

const ArticleInput = () => {
  const dispatch = useDispatch();
  const [title, setTitle] = useState('');
  const [body, setBody] = useState('');
  const [imageUrl, setImageUrl] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    const article = { title, body, imageUrl };
    const newArticle = await dispatch(writeArticle(article));
    if (newArticle) {
      setTitle('');
      setBody('');
      setImageUrl('');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <input 
        type="text"
        placeholder="Title"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />
      <textarea 
        placeholder="Body"
        value={body}
        onChange={(e) => setBody(e.target.value)}
      />
      <input 
        type="text"
        placeholder="Image URL"
        value={imageUrl}
        onChange={(e) => setImageUrl(e.target.value)}
      />
      <button type="submit">Submit</button>
    </form>
  );
};

export default ArticleInput;