#!/usr/bin/env python3
"""Helper functions for district research: point-in-polygon, geocoding."""

import json
import urllib.request
import urllib.parse
import time

DISTRICTS_FILE = "/Users/andrey/Projects/oviedo-map/data/districts_polygons.json"


def load_districts():
    with open(DISTRICTS_FILE) as f:
        return json.load(f)


def point_in_polygon(lat, lon, polygon_coords):
    """
    Ray-casting algorithm for point-in-polygon.
    polygon_coords: list of [lon, lat] pairs (GeoJSON format).
    """
    n = len(polygon_coords)
    inside = False
    x, y = lon, lat

    j = n - 1
    for i in range(n):
        xi, yi = polygon_coords[i][0], polygon_coords[i][1]
        xj, yj = polygon_coords[j][0], polygon_coords[j][1]

        if ((yi > y) != (yj > y)) and (x < (xj - xi) * (y - yi) / (yj - yi) + xi):
            inside = not inside
        j = i

    return inside


def geocode_nominatim(query, near_lat=43.36, near_lon=-5.85):
    """Geocode a place name using Nominatim, biased toward Oviedo."""
    encoded = urllib.parse.quote(query)
    url = (
        f"https://nominatim.openstreetmap.org/search?"
        f"q={encoded}&format=json&limit=5"
        f"&viewbox={near_lon-0.1},{near_lat+0.1},{near_lon+0.1},{near_lat-0.1}"
        f"&bounded=0"
    )
    req = urllib.request.Request(url, headers={"User-Agent": "OviedoMapResearch/1.0"})
    with urllib.request.urlopen(req, timeout=10) as resp:
        results = json.loads(resp.read().decode())

    if not results:
        # Try with "Oviedo" appended
        query2 = f"{query}, Oviedo, Spain"
        encoded2 = urllib.parse.quote(query2)
        url2 = f"https://nominatim.openstreetmap.org/search?q={encoded2}&format=json&limit=5"
        req2 = urllib.request.Request(url2, headers={"User-Agent": "OviedoMapResearch/1.0"})
        with urllib.request.urlopen(req2, timeout=10) as resp2:
            results = json.loads(resp2.read().decode())

    return results


def find_district_for_point(lat, lon, districts):
    """Find which district a point belongs to."""
    for d in districts:
        coords = d["geojson"]["coordinates"][0]
        if point_in_polygon(lat, lon, coords):
            return d["name"]
    return None


def validate_poi_in_district(poi_name, lat, lon, district_name, districts):
    """Check if a POI falls within the expected district."""
    district = None
    for d in districts:
        if d["name"] == district_name:
            district = d
            break
    if not district:
        return False, "District not found"

    coords = district["geojson"]["coordinates"][0]
    if point_in_polygon(lat, lon, coords):
        return True, "Inside district"

    # Find actual district
    actual = find_district_for_point(lat, lon, districts)
    return False, f"Outside district (actually in: {actual or 'unknown/outside Oviedo'})"


if __name__ == "__main__":
    districts = load_districts()
    # Test: Cathedral of Oviedo should be in Centro Oeste or similar
    test_lat, test_lon = 43.3625, -5.8432
    result = find_district_for_point(test_lat, test_lon, districts)
    print(f"Test point ({test_lat}, {test_lon}): {result}")

    # Test geocoding
    results = geocode_nominatim("Catedral de San Salvador, Oviedo")
    if results:
        r = results[0]
        print(f"Catedral: {r['lat']}, {r['lon']} - {r.get('display_name','')[:80]}")
