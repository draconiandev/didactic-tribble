class SearchResultsList extends React.Component {

  render() {
    return (
      <ul className="dropdown-menu" id="autocomplete-items" onMouseEnter={() => {this.props.setPreventHideDropdown()}} onMouseLeave={() => {this.props.resetPreventHideDropdown()}}>
        <span className="dropdown-arrow-top"></span>
        <span className="dropdown-arrow-bottom"></span>
        <li>
          <a href={`/search?q=${this.props.term}`}>
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

    return <li className="autocomplete-heading"><h6>Activities</h6></li>
  }

  renderCategoryHeading() {
    if (this.props.categories.length === 0) { return; }

    return <li className="autocomplete-heading"><h6>Categories</h6></li>
  }

  renderDestinationHeading() {
    if (this.props.destinations.length === 0) { return; }

    return <li className="autocomplete-heading"><h6>Destinations</h6></li>
  }
}