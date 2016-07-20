class SearchActivityListItem extends React.Component {
  render() {
    return (
      <li>
        <a className="display-next" href={this.props.activity.url}>
          <span dangerouslySetInnerHTML={{ __html: this.props.activity.title }} />
        </a>
        <br/>
      </li>
    );
  }
}