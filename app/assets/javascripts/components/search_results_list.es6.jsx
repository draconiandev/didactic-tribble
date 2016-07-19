class SearchResultsList extends React.Component {

  render() {
    return (
      <ul className="dropdown-menu" id="autocomplete-items" onMouseEnter={() => {this.props.setPreventHideDropdown()}} onMouseLeave={() => {this.props.resetPreventHideDropdown()}}>
        <span className="dropdown-arrow-top"></span>
        <span className="dropdown-arrow-bottom"></span>
        <li>
          <a href={`/search?q=${this.props.term}`}>
            <i className="fa fa-search fa-2x"></i>Search for <strong>{this.props.term}</strong>
          </a>
        </li>
        {this.renderActivityHeading()}
        {this.renderActivities()}
        {this.renderCategoryHeading()}
        {this.renderCategories()}
        {this.renderDestinationHeading()}
        {this.renderDestinations()}
      </ul>
    );
  }

  renderActivities() {
   return this.props.activities.slice(0, 3).map((activity) => {
      return <SearchActivityListItem key={activity.id} activity={activity} />
    });
  }

  renderCategories() {
    return this.props.categories.slice(0, 3).map((category) => {
      return <SearchCategoryListItem key={category.id} category={category} />
    });
  }

  renderDestinations() {
    return this.props.destinations.slice(0, 3).map((destination) => {
      return <SearchDestinationListItem key={destination.id} destination={destination} />
    });
  }

  renderActivityHeading() {
    if (this.props.activities.length === 0) { return; }

    return <li className="autocomplete-heading"><h4>Activities</h4></li>
  }

  renderCategoryHeading() {
    if (this.props.categories.length === 0) { return; }

    return <li className="autocomplete-heading"><h4>Category</h4></li>
  }

  renderDestinationHeading() {
    if (this.props.destinations.length === 0) { return; }

    return <li className="autocomplete-heading"><h4>Destinations</h4></li>
  }
}