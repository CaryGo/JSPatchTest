

defineClass("ViewController", {
            
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell")
            if (!cell) {
            cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
            }
            cell.textLabel().setText("JSPatch");
            var redColor = require('UIColor').redColor();
            cell.textLabel.textColor(redColor);
            return cell
            },
            
            //instance method definitions
//            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
//            var row = indexPath.row()
//            if (self.dataSource().length > row) {  // 加上判断越界的逻辑
//            var content = self.dataArr()[row];
//            }
            }
            },
            {});