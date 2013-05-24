
    var MyPolyline = function(model) { 
        google.maps.Polyline.call(this,model);
    }

    MyPolyline.prototype = new google.maps.Polyline();
    MyPolyline.prototype.dist = [];
    MyPolyline.prototype.check = [];
    MyPolyline.prototype.total_dist = 0;
    MyPolyline.prototype.old_dist_index = 0;
    MyPolyline.prototype.checking_dist = 1;

    MyPolyline.prototype.setPath = function(path){
    
        if (path.length ==0){
            this.dist = [];
            this.check = [];
            this.total_dist = 0;
            this.old_dist_index = 0;
            this.checking_dist = 1;
            return;
        }

        this.total_dist =  Math.round(google.maps.geometry.spherical.computeLength(path))/1000;
        this.dist = [];

        var len = path.length, total = 0;
        for(var i=0; i<len-1 ; i++) { 
            total += Math.round(google.maps.geometry.spherical.computeDistanceBetween(path[i],path[i+1])) / 1000;
            this.dist.push(total);
        }

       google.maps.Polyline.prototype.setPath.call(this,path);
       
       
       this.renderCheck();
       this.old_dist_index = this.dist.length;

   }

    MyPolyline.prototype.renderCheck = function() {
       
        if (this.old_dist_index > this.dist.length){
            for(var i=this.dist.length; i>this.old_dist_index; i--){
                if (this.checing_dist != Math.floor(this.dist[i])){ 
                    check_marker = this.check.pop;
                    check_marker.setMap(null);
                    this.checking_dist--;
                }
            }
            return;
        }

        var path = this.getPath();
        for(var i=this.old_dist_index; i<this.dist.length-1; i++){
            while(1){
              
                if ( this.dist[i] >= this.checking_dist){
                    remain_distance = this.checking_dist - ((i==0)? 0 : this.dist[i-1]);
                    heading = google.maps.geometry.spherical.computeHeading(path.getAt(i),path.getAt(i+1));
                    checkpoint = google.maps.geometry.spherical.computeOffset( path.getAt(i),remain_distance,heading);
                    check_marker = new google.maps.Marker({position: checkpoint, map: this.map, title: "" + this.checking_dist + "km", icon: checkimg});
                    this.check.push(check_marker);
                    this.checking_dist++;
                }
                else{
                    break;
                }
            }
        }
    }

    MyPolyline.prototype.inKm = function() {
        return this.total_dist;
    }
