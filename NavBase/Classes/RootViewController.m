//
//  RootViewController.m
//  NavBase
//
//  Created by Laurent on 27/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "Serie.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle

@synthesize tabSeries;


- (void)viewDidLoad {
    [super viewDidLoad];
 
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  // Charger le fichier .plist dans un tableau que l'on appelera  arrayFromFile
  NSString *path = [[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"];
  NSArray *arrayFromFile = [[NSMutableArray alloc] initWithContentsOfFile:path];
  
  // Créons un tableau temporaire que nous allons remplir avec un objet Serie par NSDictionnary contenu dans le fichier .plist
  // Notez l'utilisation de NSEnumerator pour parcourir un tableau
  NSMutableArray *seriesToAdd = [[NSMutableArray alloc] init];
  NSEnumerator *enumerator = [arrayFromFile objectEnumerator];
  NSDictionary *anObject;
  while (anObject = [enumerator nextObject]) {
    Serie *sr = [[Serie alloc] initWithDictionaryFromPlist: anObject];
    [seriesToAdd addObject: sr];
    NSLog(@"série ajoutée, title :",sr.title);
    [sr release];
  }
  
  // Remplir la propriété tabSeries avec le contenu du NSMutableArray précédent
  self.tabSeries = [NSArray arrayWithArray:seriesToAdd];
  
  // Gestion de la mémoire : pour chaque alloc, n'oubliez pas le release qui va avec !
  [seriesToAdd release];
  [arrayFromFile release];
 
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Nous ne tenons pas compte du numéro de section puisqu'il n'y en a qu'une
  // Dans cette unique section il y a tous les éléments du tableau, on retourne donc le nombre
  return [self.tabSeries count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
  
  // Les cellules sont mises en cache pour accélérer le traitement, sous l'identifiant "Cell",
  // on essaie récupère ce modèle de cellule s'il est déjà en cache
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  // Si on n'a pas réussi à sortir une cellule du cache, on crée un nouveau modèle de cellule
  // et on l'enregistre dans le cache
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
  }
  
  // On récupère l'objet Serie qui correspond à la ligne que l'on souhaite afficher
  Serie *sr = [self.tabSeries objectAtIndex:indexPath.row];
  
  // On configure la cellule avec le titre du site et sa description
  cell.textLabel.text = sr.title;
  cell.detailTextLabel.text = sr.description;
  
  // On renvoie la cellule configurée pour l'affichage
  return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    		
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
    [tabSeries release];
}


@end

