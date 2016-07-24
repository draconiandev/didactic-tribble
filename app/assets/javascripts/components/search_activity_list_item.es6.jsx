class SearchActivityListItem extends React.Component {
  render() {
    return (
        <a className="display-next" href={this.props.activity.url}>
          <div className="min-marg" dangerouslySetInnerHTML={{ __html: this.props.activity.title }} />
        </a>
    );
  }
}