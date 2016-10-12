//
//  FugitivosTableViewController.swift
//  BountyHunter
//
//  Created by Posgrado en Letras 02 on 08/10/16.
//  Copyright © 2016 Luis Alfredo Silva. All rights reserved.
//

import UIKit

class FugitivosTableViewController: UITableViewController {
    
    //Esta Propiedad determina si los registros de van a presentar si estan capturados (1) o no (0)
    
    var estaCapturado = 0
    
    var losFugados:NSArray?

    @IBAction func btnNuevoTouch(sender: AnyObject) {
        
        self.performSegueWithIdentifier("Nuevo", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Es necesario inicializar el array, porque no puede ser nil
        self.losFugados = NSArray()
    }
    
    override func viewWillAppear(animated: Bool) {
    
        self.losFugados = DBManager.instance.encuentraTodosLos("Fugitive", filtradosPor: NSPredicate(format: "captured=%d", self.estaCapturado))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.losFugados!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReuseID", forIndexPath: indexPath)

        // Configure the cell...
        let elFugitivo = self.losFugados![indexPath.row] as! Fugitive
        cell.textLabel?.text=elFugitivo.name
        
        // Se Escribìa así antes de crear la subclase
        //cell.textLabel?.text=(self.losFugados![indexPath.row].valueForKey("name") as! String)
    

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
