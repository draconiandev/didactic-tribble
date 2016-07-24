class SearchBar extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    return (
      <div className="row">
        <div className="col s12">
          <form action="/search" acceptCharset="UTF-8" method="get">
            <input name="utf8" type="hidden" value="√" />
            <input
              onFocus={() => this.props.showDropdown()}
              onBlur={() => this.props.hideDropdown()}
              value={this.props.term}
              onChange={(event) => {this.handleInputChange(event.target.value)}}
              placeholder="Search away" 
              autoComplete="off" 
              type="search" 
              name="search[q]" 
              id="search_q" />
          </form>
        </div>
      </div>
    );
  }

  handleInputChange(term) {
    this.props.onSearchTermChange(term);
  }
}

