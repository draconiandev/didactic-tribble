class SearchDestinationListItem extends React.Component {
  render () {
    return (
      <li>
        <a className="display-next" href={this.props.destination.url}>
          <span dangerouslySetInnerHTML={{ __html: this.props.destination.name }} />
        </a>
      </li>
    );
  }
}
