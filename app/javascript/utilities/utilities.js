import moment from 'moment';

export function formatNumber(value) {
    if (!value) {
        return 0;
    }

    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

export function distanceAway( distanceInKm ){
    if( distanceInKm < 1 ){
        return `${ Math.round(distanceInKm * 1000) }m`;
    } else if ( distanceInKm > 1 ){
        return `${ distanceInKm.toFixed(1) }km`;
    }
}

export function addClassModifiers(base, modifiers = []) {
    if (!Array.isArray(modifiers)) {
        modifiers = modifiers.split(' ');
    }

    modifiers = modifiers.map(modifier => `${base}--${modifier}`);

    return [base, ...modifiers];
}

export function formatDuration(start) {
    return moment.duration(moment().diff(start), 'milliseconds').format('d[d] h[h] m[m]');
}

export function relativeDate(value) {
    const date = moment(value);

    if (moment().isSame(date, 'd')) {
        return 'Today';
    }

    if (
        moment()
            .add(1, 'day')
            .isSame(date, 'd')
    ) {
        return 'Tomorrow';
    }

    if (date.isBetween(moment().add(1, 'day'), moment().add(8, 'days'), 'day')) {
        return date.format('dddd');
    }

    return 'In ' + date.toNow(true);
}

export function relativeDateTime(value) {
    const date = moment(value);

    if (moment().diff(date, 'days') > 5) {
        return 'A long long time ago';
    }

    if (moment().diff(date, 'days') > 1) {
        return `${moment().diff(date, 'days')} days ago`;
    }

    if (moment().diff(date, 'hours') >= 24) {
        return 'A day ago';
    }

    if (moment().diff(date, 'hours') > 1) {
        return `${moment().diff(date, 'hours')} hours ago`;
    }

    if (moment().diff(date, 'minutes') > 59) {
        return 'An hour ago';
    }

    if (moment().diff(date, 'seconds') > 119) {
        return `${moment().diff(date, 'minutes')} minutes ago`;
    }

    if (moment().diff(date, 'seconds') >= 60) {
        return 'A minute ago';
    }

    return 'Just now';
}

export function diffInSeconds(otherMoment) {
    return moment().diff(otherMoment, 'seconds');
}

export function positionToGridAreaNotation(position) {
    const [from, to = null] = position.toLowerCase().split(':');

    if (from.length !== 2 || (to && to.length !== 2)) {
        return;
    }

    const areaFrom = `${from[1]} / ${indexInAlphabet(from[0])}`;
    const area = to
        ? `${areaFrom} / ${Number(to[1]) + 1} / ${indexInAlphabet(to[0]) + 1}`
        : areaFrom;

    return area;
}

function indexInAlphabet(character) {
    const index = character.toLowerCase().charCodeAt(0) - 96;
    return index < 1 ? 1 : index;
}

export function createGeoJSON( inputLocations, geoJSONid, markerColor ) {
    // inputLocations argument expected as an array of objects
    // [{name: <...>, lat: <lat>, lng: <longitude>}, ... ]
    // If no data is passed it will return an empty GeoJSON object
    
    // Create empty GeoJSON return object
    let outputGeoJSON = 
    {
        "id": geoJSONid,
        "type": "symbol",
        "source": {
          "type": "geojson",
          "data": {
            "type": "FeatureCollection",
            "features": []
          }
        }, // end source
        "type": "circle",
        "paint": {
          "circle-radius": 7,
          "circle-color": markerColor
        }
    } // end let outputGeoJSON
  
    // Loop over each input argument passed as an argument and add to geoJSON
    inputLocations.forEach(loc => 
        outputGeoJSON.source.data.features.push(
        {
            "type": "Feature",
            "properties": {
              "description": `${ loc.name }`,
              "icon": "circle"
            },
            "geometry": {
              "type": "Point",
              "coordinates": [ 
                loc.lng,
                loc.lat
              ]
            }
          }
        ) // end features.push
    ); // end forEach
    return outputGeoJSON;
} // end function createGeoJSON