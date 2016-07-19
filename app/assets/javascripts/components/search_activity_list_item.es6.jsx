class SearchActivityListItem extends React.Component {
  render() {
    return (
      <li>
        <a href={this.props.activity.url}>
          <img width="35" className="avatar-image" src={this.props.activity.cover} />
          <span dangerouslySetInnerHTML={{ __html: this.props.activity.title }} />
        </a>
      </li>
    );
  }
}