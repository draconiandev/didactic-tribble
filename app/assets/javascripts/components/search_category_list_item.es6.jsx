class SearchCategoryListItem extends React.Component {
  render() {
    return (
      <li>
        <a href={this.props.category.url}>
          <i className="fa fa-location-arrow fa-2x" />
          <span dangerouslySetInnerHTML={{ __html: this.props.category.name }} />
        </a> 
      </li>
    );
  }
}
