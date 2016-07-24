class SearchDestinationListItem extends React.Component {
  render () {
    return (
        <a className="display-next" href={this.props.destination.url}>
          <div className="min-marg" dangerouslySetInnerHTML={{ __html: this.props.destination.name }} />
        </a>
    );
  }
}
