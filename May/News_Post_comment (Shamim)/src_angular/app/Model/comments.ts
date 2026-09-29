export class Comments {


   comment_id: any;
   blog_id: any;
   comments: any;
   publish: any
   status:any;

   constructor(comment_id: any, blog_id: any, comments: any, publish: any) {
      this.comment_id = comment_id;
      this.blog_id = blog_id;
      this.comments = comments;
      this.publish = publish;
   }


}
