class SearchCategoryListItem extends React.Component {
  render() {
    return (
        <a className="display-next" href={this.props.category.url}>
          <div className="min-marg" dangerouslySetInnerHTML={{ __html: this.props.category.name }} />
        </a>
    );
  }
}
