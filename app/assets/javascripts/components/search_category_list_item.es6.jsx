class SearchCategoryListItem extends React.Component {
  render() {
    return (
      <li>
        <a className="display-next" href={this.props.category.url}>
          <span dangerouslySetInnerHTML={{ __html: this.props.category.name }} />
        </a> 
      </li>
    );
  }
}
