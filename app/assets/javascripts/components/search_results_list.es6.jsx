class SearchResultsList extends React.Component {

  render() {
    return (
      <ul className="dropdown-menu" id="autocomplete-items" onMouseEnter={() => {this.props.setPreventHideDropdown()}} onMouseLeave={() => {this.props.resetPreventHideDropdown()}}>
        <ul>
          {this.renderActivityHeading()}
          {this.renderActivities()}
          {this.renderCategoryHeading()}
          {this.renderCategories()}
          {this.renderDestinationHeading()}
          {this.renderDestinations()}
        </ul>
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
  }

  renderCategoryHeading() {
    if (this.props.categories.length === 0) { return; }
  }

  renderDestinationHeading() {
    if (this.props.destinations.length === 0) { return; }
  }
}