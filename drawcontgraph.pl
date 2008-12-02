use GraphViz;
$g = GraphViz->new();
while(<>){
	@t1=split(/\s+/);
	if(@t1[0] eq "C"){
		$v1="C.".@t1[1];
		$v2="C.".@t1[3];
		$e1=@t1[2];
		$e2=@t1[4];
		$readcnt=@t1[5];
                $node{$v1}++;
		$node{$v2}++;
		$label="$e1->$e2($readcnt)";
                if($node{$v1}<1){
                       	$g->add_node($v1, label => $v1);
                  }
   		if($node{$v2}<1){
		      	$g->add_node($v1, label => $v1);
		}
		if($readcnt>0){
	       		$g->add_edge($v1 => $v2, label => $label);			
		}
		#print "$v1->$node{$v1}\t$v2->$node{$v2}\t$label\n";
	}
	#print ;
}
print $g->as_png;


