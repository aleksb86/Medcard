import React, {Component} from 'react';

class Tiles extends Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: []
    };
  }

  componentDidMount() {
    fetch('/api/v1/categories')
    .then(categories_data => categories_data.json())
    .then((data) => this.setState({categories: data}))
    .catch(console.error);
  }

  render() {
    return (
      <div className="tile_container">
        {this.state.categories.map((category, i) =>
          <Tile key={i} category={category}/>
        )}
      </div>
    );
  }
}

const Tile = ({category}) =>
  <div color={category.color}>{category.name}</div>

export default Tiles;
