class SearchDestinationListItem extends React.Component {
  render () {
    return (
      <li className="search-tag-list-item">
        <a href={this.props.destination.url}>
          <i className="fa fa-location-arrow fa-2x" />
          <span dangerouslySetInnerHTML={{ __html: this.props.destination.name }} />
        </a>
      </li>
    );
  }
}
