export class Blog {

     blog_id:any;
	 writer:any;
	 title:any;
	 description:any;
	 publ_date:any;
	 image:any;

     constructor(blog_id:any, writer:any,title:any,description:any, publ_date:any,image:any){

        this.blog_id=blog_id;
        this.writer=writer;
        this.title=title;
        this.description=description;
        this.publ_date=publ_date;
        this.image=image;
     }
	
}
