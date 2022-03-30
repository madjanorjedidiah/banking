import geopandas as gpd
from shapely.geometry import Point, LineString, Polygon
import networkx as nx
import osmnx as ox
import matplotlib.pyplot as plt




"""  creating a travel time that produces the time to travel to a particular place using a osmnx graph. """
def create_graph(loc, dist, transport_mode, loc_type="address"):
	# Transport mode = ‘walk’, ‘bike’, ‘drive’, ‘drive_service’, ‘all’, ‘all_private’, ‘none’
	if loc_type == "address":
	    G = ox.graph_from_address(loc, dist, network_type=transport_mode)
	elif loc_type == "points":
	    G = ox.graph_from_point(loc, dist, network_type=transport_mode )
	return G

coord = (59.325273, 18.070998)
def create_gdf_poi(create_graph, coord):
	# 2 - Create nodes geodataframe from Graph network (G)
	gdf_nodes = ox.graph_to_gdfs(create_graph, edges=False)
	# 3 - Specify where you want to start and get nearest nodes. 
	point_of_interest = ox.distance.nearest_nodes(create_graph, coord[0], coord[1])
	# 4 - Project a graph from lat-long to the UTM zone appropriate for its geographic location.
	G = ox.project_graph(create_graph)
	return G



def travel_time(create_gdf_poi):
	# Trip time in Mintues
	trip_times = [5, 15, 25, 40, 60]

	times = []

	# walking speed in km/hour
	travel_speed = 4.5

	# add an edge attribute for time in minutes required to traverse each edge
	meters_per_minute = travel_speed * 1000 / 60 #km per hour to m per minute
	for u, v, k, data in create_gdf_poi.edges(data=True, keys=True):
	    data['time'] = data['length'] / meters_per_minute
	    times.append(date['time'])
	return times



def getShortestPathDistance():
	xmin, xmax = -84.323, -84.305
	ymin, ymax =  39.084,  39.092
	G = ox.graph_from_bbox( ymax, ymin, xmin, xmax, network_type='drive', simplify=True)
	# G = ox.graph_from_place('Wuppertal, Germany', network_type='drive')
	# get the nearest network node to each point
	orig_node = ox.distance.nearest_nodes(G, 39.08710, -84.31050)
	dest_node = ox.distance.nearest_nodes(G, 39.08800, -84.32000)

	# how long is our route in meters?
	return nx.shortest_path_length(G, orig_node, dest_node, weight='length')
